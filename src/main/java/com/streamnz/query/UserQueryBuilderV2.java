package com.streamnz.query;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.po.User;
import org.springframework.util.StringUtils;


/**
 * User query builder - Builder pattern version
 * Provides more flexible query condition building
 */
public class UserQueryBuilderV2 {

    private final QueryWrapper<User> queryWrapper;
    private final UserQueryDTO queryDTO;

    public UserQueryBuilderV2(UserQueryDTO queryDTO) {
        this.queryWrapper = new QueryWrapper<>();
        this.queryDTO = queryDTO;
    }

    /**
     * Add username fuzzy search condition
     */
    public UserQueryBuilderV2 withUsername() {
        if (StringUtils.hasText(queryDTO.getUsername())) {
            queryWrapper.like("username", queryDTO.getUsername());
        }
        return this;
    }

    /**
     * Add email fuzzy search condition
     */
    public UserQueryBuilderV2 withEmail() {
        if (StringUtils.hasText(queryDTO.getEmail())) {
            queryWrapper.like("email", queryDTO.getEmail());
        }
        return this;
    }

    /**
     * Add full name fuzzy search condition
     */
    public UserQueryBuilderV2 withFullName() {
        if (StringUtils.hasText(queryDTO.getFullName())) {
            queryWrapper.like("full_name", queryDTO.getFullName());
        }
        return this;
    }

    /**
     * Add role exact match condition
     */
    public UserQueryBuilderV2 withRole() {
        if (StringUtils.hasText(queryDTO.getRole())) {
            queryWrapper.eq("role", queryDTO.getRole());
        }
        return this;
    }

    /**
     * Add enabled status exact match condition
     */
    public UserQueryBuilderV2 withEnabled() {
        if (queryDTO.getEnabled() != null) {
            queryWrapper.eq("enabled", queryDTO.getEnabled());
        }
        return this;
    }

    /**
     * Add created time range query condition
     */
    public UserQueryBuilderV2 withCreatedAtRange() {
        if (queryDTO.getCreatedAtStartAsDateTime() != null) {
            queryWrapper.ge("created_at", queryDTO.getCreatedAtStartAsDateTime());
        }
        if (queryDTO.getCreatedAtEndAsDateTime() != null) {
            queryWrapper.le("created_at", queryDTO.getCreatedAtEndAsDateTime());
        }
        return this;
    }

    /**
     * Add updated time range query condition
     */
    public UserQueryBuilderV2 withUpdatedAtRange() {
        if (queryDTO.getUpdatedAtStartAsDateTime() != null) {
            queryWrapper.ge("updated_at", queryDTO.getUpdatedAtStartAsDateTime());
        }
        if (queryDTO.getUpdatedAtEndAsDateTime() != null) {
            queryWrapper.le("updated_at", queryDTO.getUpdatedAtEndAsDateTime());
        }
        return this;
    }

    /**
     * Add email domain filter condition
     */
    public UserQueryBuilderV2 withEmailDomain() {
        if (StringUtils.hasText(queryDTO.getEmailDomain())) {
            queryWrapper.like("email", "@" + queryDTO.getEmailDomain());
        }
        return this;
    }

    /**
     * Add default sorting
     */
    public UserQueryBuilderV2 withDefaultOrder() {
        queryWrapper.orderByDesc("created_at");
        return this;
    }

    /**
     * Build complete query conditions
     */
    public UserQueryBuilderV2 buildAll() {
        return this
                .withUsername()
                .withEmail()
                .withFullName()
                .withRole()
                .withEnabled()
                .withCreatedAtRange()
                .withUpdatedAtRange()
                .withEmailDomain()
                .withDefaultOrder();
    }

    /**
     * Get QueryWrapper
     */
    public QueryWrapper<User> build() {
        return queryWrapper;
    }

    /**
     * Static factory method
     */
    public static UserQueryBuilderV2 from(UserQueryDTO queryDTO) {
        return new UserQueryBuilderV2(queryDTO);
    }
} 