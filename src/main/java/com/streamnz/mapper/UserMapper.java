package com.streamnz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.streamnz.model.po.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * UserMapper interface for MyBatis-Plus operations on users table
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {
}
