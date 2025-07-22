package com.streamnz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.streamnz.model.po.Resource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Resource Mapper interface
 */
@Mapper
public interface ResourceMapper extends BaseMapper<Resource> {

    /**
     * Find resources by role IDs
     */
    @Select("SELECT DISTINCT res.* FROM resources res " +
            "INNER JOIN roles_resources_r rrr ON res.id = rrr.resource_id " +
            "WHERE rrr.role_id IN " +
            "<foreach item='roleId' collection='roleIds' open='(' separator=',' close=')'>" +
            "#{roleId}" +
            "</foreach>")
    List<Resource> findResourcesByRoleIds(@Param("roleIds") List<Long> roleIds);

    /**
     * Find resource by path and method
     */
    @Select("SELECT * FROM resources WHERE path = #{path} AND method = #{method}")
    Resource findByPathAndMethod(@Param("path") String path, @Param("method") String method);
} 