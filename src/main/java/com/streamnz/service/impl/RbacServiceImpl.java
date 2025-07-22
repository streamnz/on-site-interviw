package com.streamnz.service.impl;

import com.streamnz.mapper.ResourceMapper;
import com.streamnz.model.entity.Resource;
import com.streamnz.service.RbacService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.AntPathMatcher;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.Collections;

/**
 * RBAC permission service implementation
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class RbacServiceImpl implements RbacService {

    private final ResourceMapper resourceMapper;

    // Path matcher, supports wildcards
    private final AntPathMatcher pathMatcher = new AntPathMatcher();
    
    // Simple in-memory cache, production environment recommends using Redis
    private final ConcurrentHashMap<String, Boolean> permissionCache = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<Long, List<Resource>> userResourcesCache = new ConcurrentHashMap<>();

    @Override
    public boolean hasPermission(Long userId, String method, String path) {
        if (userId == null || method == null || path == null) {
            log.warn("Permission validation parameters are null: userId={}, method={}, path={}", userId, method, path);
            return false;
        }

        // Build cache key
        String cacheKey = userId + ":" + method + ":" + path;
        
        // Check cache
        Boolean cachedResult = permissionCache.get(cacheKey);
        if (cachedResult != null) {
            log.debug("Permission validation cache hit: {}", cacheKey);
            return cachedResult;
        }

        try {
            // Query database
            boolean hasPermission = resourceMapper.checkUserPermission(userId, path, method);
            
            // If no exact match in database, try path pattern matching
            if (!hasPermission) {
                hasPermission = checkPathPatternPermission(userId, method, path);
            }

            // Cache result
            permissionCache.put(cacheKey, hasPermission);
            
            log.debug("Permission validation result: userId={}, method={}, path={}, hasPermission={}",
                     userId, method, path, hasPermission);
            
            return hasPermission;
        } catch (Exception e) {
            log.error("Permission validation exception: userId={}, method={}, path={}", userId, method, path, e);
            return false;
        }
    }

    @Override
    public List<Resource> getUserResources(Long userId) {
        if (userId == null) {
            log.warn("Get user resources parameter is null: userId={}", userId);
            return Collections.emptyList();
        }

        // Check cache
        List<Resource> cachedResources = userResourcesCache.get(userId);
        if (cachedResources != null) {
            log.debug("User resources cache hit: userId={}", userId);
            return cachedResources;
        }

        try {
            // Query database
            List<Resource> resources = resourceMapper.findUserResources(userId);
            
            // Cache result
            userResourcesCache.put(userId, resources);
            
            log.debug("Get user resources: userId={}, resourceCount={}", userId, resources.size());
            
            return resources;
        } catch (Exception e) {
            log.error("Get user resources exception: userId={}", userId, e);
            return Collections.emptyList();
        }
    }

    @Override
    public boolean hasResourcePermission(Long userId, Long resourceId) {
        if (userId == null || resourceId == null) {
            return false;
        }

        List<Resource> userResources = getUserResources(userId);
        return userResources.stream()
                .anyMatch(resource -> resource.getId().equals(resourceId));
    }

    @Override
    public List<Resource> getResourcesByRoleIds(List<Long> roleIds) {
        if (roleIds == null || roleIds.isEmpty()) {
            return Collections.emptyList();
        }

        try {
            return resourceMapper.findResourcesByRoleIds(roleIds);
        } catch (Exception e) {
            log.error("Get resources by role IDs exception: roleIds={}", roleIds, e);
            return Collections.emptyList();
        }
    }

    @Override
    public void clearUserPermissions(Long userId) {
        if (userId == null) {
            return;
        }

        // Clear user resources cache
        userResourcesCache.remove(userId);
        
        // Clear related permission cache
        permissionCache.entrySet().removeIf(entry -> 
            entry.getKey().startsWith(userId + ":"));
        
        log.debug("Clear user permission cache: userId={}", userId);
    }

    @Override
    public void clearAllCache() {
        // Clear all permission cache
        permissionCache.clear();
        
        // Clear all user resources cache
        userResourcesCache.clear();
        
        log.debug("Clear all permission cache");
    }

    /**
     * Check path pattern matching permission
     * Supports wildcard matching, e.g., /api/users/** matches /api/users/1
     */
    private boolean checkPathPatternPermission(Long userId, String method, String path) {
        List<Resource> userResources = getUserResources(userId);
        
        return userResources.stream()
                .anyMatch(resource -> 
                    resource.getMethod().equals(method) && 
                    pathMatcher.match(resource.getPath(), path));
    }
} 