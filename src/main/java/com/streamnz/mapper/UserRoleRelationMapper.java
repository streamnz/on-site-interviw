package com.streamnz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.streamnz.model.po.UserRoleRelation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * User-Role relation Mapper interface
 */
@Mapper
public interface UserRoleRelationMapper extends BaseMapper<UserRoleRelation> {

    /**
     * Insert user role relations
     */
    int insertBatch(@Param("relations") List<UserRoleRelation> relations);

    /**
     * Delete user role relations by user ID
     */
    int deleteByUserId(@Param("userId") Long userId);
} 