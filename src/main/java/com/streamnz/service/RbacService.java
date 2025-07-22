package com.streamnz.service;

import com.streamnz.model.entity.Resource;

import java.util.List;

/**
 * RBAC permission service interface
 */
public interface RbacService {

    /**
     * Check if user has specified permission
     * @param userId user ID
     * @param method HTTP method (GET, POST, PUT, DELETE, etc.)
     * @param path request path
     * @return has permission
     */
    boolean hasPermission(Long userId, String method, String path);

    /**
     * Get all resource permissions for user
     * @param userId user ID
     * @return user resource list
     */
    List<Resource> getUserResources(Long userId);

    /**
     * Check if user has specific resource permission
     * @param userId user ID
     * @param resourceId resource ID
     * @return has permission
     */
    boolean hasResourcePermission(Long userId, Long resourceId);

    /**
     * Get resources by role ID list
     * 
     * @param roleIds role ID list
     * @return resource list
     */
    List<Resource> getResourcesByRoleIds(List<Long> roleIds);

    /**
     * Clear user permission cache
     * @param userId user ID
     */
    void clearUserPermissions(Long userId);

    /**
     * Clear all user permission cache
     */
    void clearAllCache();
} 