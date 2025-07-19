package com.streamnz.query;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.po.User;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 * 用户查询构建器
 * 负责将UserQueryDTO转换为MyBatis-Plus的QueryWrapper
 */
@Component
public class UserQueryBuilder {

    /**
     * 构建动态查询条件
     * @param queryDTO 查询条件DTO
     * @return QueryWrapper对象
     */
    public QueryWrapper<User> buildQueryWrapper(UserQueryDTO queryDTO) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();

        if (queryDTO == null) {
            return queryWrapper;
        }

        // 用户名模糊搜索
        if (StringUtils.hasText(queryDTO.getUsername())) {
            queryWrapper.like("username", queryDTO.getUsername());
        }

        // 邮箱模糊搜索
        if (StringUtils.hasText(queryDTO.getEmail())) {
            queryWrapper.like("email", queryDTO.getEmail());
        }

        // 全名模糊搜索
        if (StringUtils.hasText(queryDTO.getFullName())) {
            queryWrapper.like("full_name", queryDTO.getFullName());
        }

        // 角色精确匹配
        if (StringUtils.hasText(queryDTO.getRole())) {
            queryWrapper.eq("role", queryDTO.getRole());
        }

        // 启用状态精确匹配
        if (queryDTO.getEnabled() != null) {
            queryWrapper.eq("enabled", queryDTO.getEnabled());
        }

        // 创建时间范围查询
        if (queryDTO.getCreatedAtStartAsDateTime() != null) {
            queryWrapper.ge("created_at", queryDTO.getCreatedAtStartAsDateTime());
        }
        if (queryDTO.getCreatedAtEndAsDateTime() != null) {
            queryWrapper.le("created_at", queryDTO.getCreatedAtEndAsDateTime());
        }

        // 更新时间范围查询
        if (queryDTO.getUpdatedAtStartAsDateTime() != null) {
            queryWrapper.ge("updated_at", queryDTO.getUpdatedAtStartAsDateTime());
        }
        if (queryDTO.getUpdatedAtEndAsDateTime() != null) {
            queryWrapper.le("updated_at", queryDTO.getUpdatedAtEndAsDateTime());
        }

        // 邮箱域名筛选
        if (StringUtils.hasText(queryDTO.getEmailDomain())) {
            queryWrapper.like("email", "@" + queryDTO.getEmailDomain());
        }

        // 默认按创建时间降序排列
        queryWrapper.orderByDesc("created_at");

        return queryWrapper;
    }
} 