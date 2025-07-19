package com.streamnz.query;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.po.User;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 * User query builder
 * Responsible for converting UserQueryDTO to MyBatis-Plus QueryWrapper
 */
@Component
public class UserQueryBuilder {

    /**
     * Build dynamic query conditions
     * @param queryDTO Query condition DTO
     * @return QueryWrapper object
     */
    public QueryWrapper<User> buildQueryWrapper(UserQueryDTO queryDTO) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();

        if (queryDTO == null) {
            return queryWrapper;
        }

        // Username fuzzy search
        if (StringUtils.hasText(queryDTO.getUsername())) {
            queryWrapper.like("username", queryDTO.getUsername());
        }

        // Email fuzzy search
        if (StringUtils.hasText(queryDTO.getEmail())) {
            queryWrapper.like("email", queryDTO.getEmail());
        }

        // Full name fuzzy search
        if (StringUtils.hasText(queryDTO.getFullName())) {
            queryWrapper.like("full_name", queryDTO.getFullName());
        }

        // Role exact match
        if (StringUtils.hasText(queryDTO.getRole())) {
            queryWrapper.eq("role", queryDTO.getRole());
        }

        // Enabled status exact match
        if (queryDTO.getEnabled() != null) {
            queryWrapper.eq("enabled", queryDTO.getEnabled());
        }

        // Created time range query
        if (queryDTO.getCreatedAtStartAsDateTime() != null) {
            queryWrapper.ge("created_at", queryDTO.getCreatedAtStartAsDateTime());
        }
        if (queryDTO.getCreatedAtEndAsDateTime() != null) {
            queryWrapper.le("created_at", queryDTO.getCreatedAtEndAsDateTime());
        }

        // Updated time range query
        if (queryDTO.getUpdatedAtStartAsDateTime() != null) {
            queryWrapper.ge("updated_at", queryDTO.getUpdatedAtStartAsDateTime());
        }
        if (queryDTO.getUpdatedAtEndAsDateTime() != null) {
            queryWrapper.le("updated_at", queryDTO.getUpdatedAtEndAsDateTime());
        }

        // Email domain filter
        if (StringUtils.hasText(queryDTO.getEmailDomain())) {
            queryWrapper.like("email", "@" + queryDTO.getEmailDomain());
        }

        // Default sort by created time descending
        queryWrapper.orderByDesc("created_at");

        return queryWrapper;
    }
} 