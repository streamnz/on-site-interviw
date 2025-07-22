package com.streamnz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.streamnz.model.po.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Role Mapper interface
 */
@Mapper
public interface RoleMapper extends BaseMapper<Role> {

    /**
     * Find roles by user ID
     */
    @Select("SELECT r.* FROM roles r " +
            "INNER JOIN user_roles_r urr ON r.id = urr.role_id " +
            "WHERE urr.user_id = #{userId}")
    List<Role> findRolesByUserId(@Param("userId") Long userId);

    /**
     * Find role by name
     */
    @Select("SELECT * FROM roles WHERE name = #{name}")
    Role findByName(@Param("name") String name);
} 