package com.streamnz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.streamnz.model.entity.Resource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Resource Mapper interface
 */
@Mapper
public interface ResourceMapper extends BaseMapper<Resource> {

    /**
     * Query all resource permissions for user
     */
    List<Resource> findUserResources(@Param("userId") Long userId);

    /**
     * Query specific permission for user
     */
    Resource findUserResourceByPathAndMethod(@Param("userId") Long userId, 
                                           @Param("path") String path, 
                                           @Param("method") String method);

    /**
     * Check if user has specific permission
     */
    Boolean checkUserPermission(@Param("userId") Long userId, 
                               @Param("path") String path, 
                               @Param("method") String method);

    /**
     * Query resources by role ID list
     */
    List<Resource> findResourcesByRoleIds(@Param("roleIds") List<Long> roleIds);

    /**
     * Query resource by path and method
     */
    Resource findByPathAndMethod(@Param("path") String path, @Param("method") String method);
} 