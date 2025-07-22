package com.streamnz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.streamnz.model.po.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

/**
 * User mapper interface
 * Extends MyBatis-Plus BaseMapper for basic CRUD operations
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    /**
     * Find user by username
     */
    @Select("SELECT * FROM users WHERE username = #{username}")
    User selectByUsername(@Param("username") String username);

    /**
     * Find user by email
     */
    @Select("SELECT * FROM users WHERE email = #{email}")
    User selectByEmail(@Param("email") String email);
}
