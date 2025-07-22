package com.streamnz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.streamnz.model.po.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * User mapper interface
 * Extends MyBatis-Plus BaseMapper for basic CRUD operations
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {



}
