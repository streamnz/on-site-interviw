package com.streamnz.controller;

import com.streamnz.model.entity.Resource;
import com.streamnz.model.vo.ResponseVO;
import com.streamnz.model.vo.PermissionVO;
import com.streamnz.model.vo.ResourceVO;
import com.streamnz.service.RbacService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;
import com.streamnz.mapper.UserMapper;

/**
 * Resource Permission Controller
 * Provides REST APIs for resource queries and permission validation
 * Uses approach 2: Simple @PreAuthorize expressions + method-level permission validation
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/admin/resources")
public class ResourceController {

    private final RbacService rbacService;

    private final UserMapper userMapper;

    /**
     * Get all resource permissions for current user
     * Requires user authentication
     */
    @GetMapping("/my")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<ResponseVO<List<ResourceVO>>> getMyResources() {
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Long userId = getUserIdFromAuthentication(authentication);
        
        if (userId == null) {
            return ResponseEntity.badRequest().body(ResponseVO.error(400, "Unable to get user information"));
        }

        List<Resource> resources = rbacService.getUserResources(userId);
        List<ResourceVO> resourceVOs = resources.stream()
                .map(ResourceVO::new)
                .collect(Collectors.toList());
        
        log.info("User {} retrieved resource permissions, total {} resources", userId, resources.size());
        
        return ResponseEntity.ok(ResponseVO.success("User resource permissions retrieved successfully", resourceVOs));
    }

    /**
     * Get all resource permissions for specified user
     * Requires admin permission
     */
    @GetMapping("/user/{userId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ResponseVO<List<ResourceVO>>> getUserResources(@PathVariable Long userId) {
        // Perform permission validation inside method
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Long currentUserId = getUserIdFromAuthentication(auth);
        
        // Check if user has permission to query specified user's resources
        if (!rbacService.hasPermission(currentUserId, "GET", "/api/resources/user/{userId}")) {
            log.warn("User {} attempted to query user {} resource permissions, insufficient permissions", currentUserId, userId);
            throw new AccessDeniedException("Insufficient permissions");
        }
        
        List<Resource> resources = rbacService.getUserResources(userId);
        List<ResourceVO> resourceVOs = resources.stream()
                .map(ResourceVO::new)
                .collect(Collectors.toList());
        
        log.info("Admin queried user {} resource permissions, total {} resources", userId, resources.size());
        
        return ResponseEntity.ok(ResponseVO.success("User resource permissions retrieved successfully", resourceVOs));
    }

    /**
     * Check if current user has specified permission
     * Requires user authentication
     */
    @GetMapping("/check")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<ResponseVO<PermissionVO>> checkMyPermission(
            @RequestParam String method,
            @RequestParam String path) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Long userId = getUserIdFromAuthentication(authentication);
        
        if (userId == null) {
            return ResponseEntity.badRequest().body(ResponseVO.error(400, "Unable to get user information"));
        }

        boolean hasPermission = rbacService.hasPermission(userId, method, path);
        PermissionVO permissionVO = new PermissionVO(userId, method, path, hasPermission);
        
        log.info("User {} permission validation: method={}, path={}, hasPermission={}", 
                 userId, method, path, hasPermission);
        
        return ResponseEntity.ok(ResponseVO.success("Permission check completed", permissionVO));
    }

    /**
     * Check if specified user has specified permission
     * Requires admin permission
     */
    @GetMapping("/check/{userId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ResponseVO<PermissionVO>> checkUserPermission(
            @PathVariable Long userId,
            @RequestParam String method,
            @RequestParam String path) {
        // Perform permission validation inside method
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Long currentUserId = getUserIdFromAuthentication(auth);
        
        // Check if user has permission to query specified user's permissions
        if (!rbacService.hasPermission(currentUserId, "GET", "/api/resources/check/{userId}")) {
            log.warn("User {} attempted to query user {} permissions, insufficient permissions", currentUserId, userId);
            throw new AccessDeniedException("Insufficient permissions");
        }
        
        boolean hasPermission = rbacService.hasPermission(userId, method, path);
        PermissionVO permissionVO = new PermissionVO(userId, method, path, hasPermission);
        
        log.info("Admin permission validation: userId={}, method={}, path={}, hasPermission={}", 
                 userId, method, path, hasPermission);
        
        return ResponseEntity.ok(ResponseVO.success("Permission check completed", permissionVO));
    }

    /**
     * Clear user permission cache
     * Requires admin permission
     */
    @DeleteMapping("/cache/{userId}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ResponseVO<Void>> clearUserPermissions(@PathVariable Long userId) {
        // Perform permission validation inside method
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Long currentUserId = getUserIdFromAuthentication(auth);
        
        // Check if user has permission to clear specified user's cache
        if (!rbacService.hasPermission(currentUserId, "DELETE", "/api/resources/cache/{userId}")) {
            log.warn("User {} attempted to clear user {} permission cache, insufficient permissions", currentUserId, userId);
            throw new AccessDeniedException("Insufficient permissions");
        }
        
        rbacService.clearUserPermissions(userId);
        log.info("Cleared user permission cache: userId={}", userId);
        
        return ResponseEntity.ok(ResponseVO.success("User permission cache cleared successfully", null));
    }

    /**
     * Example: Business interface requiring specific permissions
     * Demonstrates how to use permission validation in business interfaces
     */
    @GetMapping("/users")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<ResponseVO<String>> getUsers() {
        // Permission check inside method
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Long userId = getUserIdFromAuthentication(auth);
        
        if (userId == null) {
            log.warn("Unable to get user ID");
            return ResponseEntity.status(403).body(ResponseVO.error(403, "Unable to get user information"));
        }
        
        if (!rbacService.hasPermission(userId, "GET", "/api/resources/users")) {
            log.warn("User {} attempted to access user list interface, insufficient permissions", userId);
            return ResponseEntity.status(403).body(ResponseVO.error(403, "Insufficient permissions"));
        }
        
        log.info("User {} accessed user list interface", userId);
        return ResponseEntity.ok(ResponseVO.success("User list retrieved successfully", "User list data"));
    }

    /**
     * Admin only interface
     * Only administrators can access
     */
    @GetMapping("/admin-only")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ResponseVO<String>> adminOnly() {
        // Permission check inside method
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Long userId = getUserIdFromAuthentication(auth);
        
        if (userId == null) {
            log.warn("Unable to get user ID");
            return ResponseEntity.status(403).body(ResponseVO.error(403, "Unable to get user information"));
        }
        
        if (!rbacService.hasPermission(userId, "GET", "/api/resources/admin-only")) {
            log.warn("User {} attempted to access admin-only interface, insufficient permissions", userId);
            return ResponseEntity.status(403).body(ResponseVO.error(403, "Insufficient permissions, admin required"));
        }
        
        log.info("Admin {} accessed admin-only interface", userId);
        return ResponseEntity.ok(ResponseVO.success("Admin data retrieved successfully", "Admin-only data"));
    }

    /**
     * Clear all user permission cache
     * Requires admin permission
     */
    @PostMapping("/cache/clear")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<ResponseVO<String>> clearAllCache() {
        // In-method permission check
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Long userId = getUserIdFromAuthentication(auth);
        
        if (userId == null) {
            log.warn("Cannot get user ID");
            return ResponseEntity.status(403).body(ResponseVO.error(403, "Unable to get user information"));
        }
        
        if (!rbacService.hasPermission(userId, "POST", "/api/resources/cache/clear")) {
            log.warn("User {} tried to clear all permission cache, insufficient permissions", userId);
            return ResponseEntity.status(403).body(ResponseVO.error(403, "Insufficient permissions, admin required"));
        }
        
        rbacService.clearAllCache();
        log.info("Admin {} cleared all permission cache", userId);
        return ResponseEntity.ok(ResponseVO.success("All permission cache cleared successfully", "Cache cleared successfully"));
    }

    @PostMapping("/users")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<ResponseVO<String>> createUser(@RequestBody String userData) {
        // Permission check inside method
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Long userId = getUserIdFromAuthentication(auth);
        
        if (!rbacService.hasPermission(userId, "POST", "/api/resources/users")) {
            log.warn("User {} attempted to create user, insufficient permissions", userId);
            throw new AccessDeniedException("Insufficient permissions");
        }
        
        log.info("User {} created new user", userId);
        return ResponseEntity.ok(ResponseVO.success("User created successfully", "User created successfully"));
    }

    @PutMapping("/users/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<ResponseVO<String>> updateUser(@PathVariable Long id, @RequestBody String userData) {
        // Permission check inside method
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Long userId = getUserIdFromAuthentication(auth);
        
        if (!rbacService.hasPermission(userId, "PUT", "/api/resources/users/{id}")) {
            log.warn("User {} attempted to update user {}, insufficient permissions", userId, id);
            throw new AccessDeniedException("Insufficient permissions");
        }
        
        log.info("User {} updated user information: id={}", userId, id);
        return ResponseEntity.ok(ResponseVO.success("User updated successfully", "User updated successfully"));
    }

    @DeleteMapping("/users/{id}")
    @PreAuthorize("isAuthenticated()")
    public ResponseEntity<ResponseVO<String>> deleteUser(@PathVariable Long id) {
        // Permission check inside method
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Long userId = getUserIdFromAuthentication(auth);
        
        if (!rbacService.hasPermission(userId, "DELETE", "/api/resources/users/{id}")) {
            log.warn("User {} attempted to delete user {}, insufficient permissions", userId, id);
            throw new AccessDeniedException("Insufficient permissions");
        }
        
        log.info("User {} deleted user: id={}", userId, id);
        return ResponseEntity.ok(ResponseVO.success("User deleted successfully", "User deleted successfully"));
    }

    /**
     * Extract user ID from Authentication object
     */
    private Long getUserIdFromAuthentication(Authentication authentication) {
        if (authentication == null || authentication.getPrincipal() == null) {
            log.warn("Authentication or Principal is null");
            return null;
        }

        Object principal = authentication.getPrincipal();
        log.info("Principal type: {}, value: {}", principal.getClass().getName(), principal);

        if (principal instanceof com.streamnz.model.security.UserPrincipal) {
            Long userId = ((com.streamnz.model.security.UserPrincipal) principal).getId();
            log.info("Extracted user ID from UserPrincipal: {}", userId);
            return userId;
        }

        // If not UserPrincipal, try to query user ID from username
        if (principal instanceof String) {
            String username = (String) principal;
            log.info("Principal is String type, attempting to get user ID from username: {}", username);
            try {
                com.streamnz.model.entity.User user = userMapper.selectByUsername(username);
                Long userId = user != null ? user.getId() : null;
                log.info("User ID retrieved from username: {}", userId);
                return userId;
            } catch (Exception e) {
                log.warn("Unable to get user ID from username: {}", username, e);
                return null;
            }
        }

        log.warn("Unrecognized Principal type: {}", principal.getClass().getName());
        return null;
    }
} 