package com.streamnz.query;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.po.User;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;

/**
 * 用户查询构建器 - Builder模式版本
 * 提供更灵活的查询条件构建方式
 */
public class UserQueryBuilderV2 {

    private final QueryWrapper<User> queryWrapper;
    private final UserQueryDTO queryDTO;

    public UserQueryBuilderV2(UserQueryDTO queryDTO) {
        this.queryWrapper = new QueryWrapper<>();
        this.queryDTO = queryDTO;
    }

    /**
     * 添加用户名模糊搜索条件
     */
    public UserQueryBuilderV2 withUsername() {
        if (StringUtils.hasText(queryDTO.getUsername())) {
            queryWrapper.like("username", queryDTO.getUsername());
        }
        return this;
    }

    /**
     * 添加邮箱模糊搜索条件
     */
    public UserQueryBuilderV2 withEmail() {
        if (StringUtils.hasText(queryDTO.getEmail())) {
            queryWrapper.like("email", queryDTO.getEmail());
        }
        return this;
    }

    /**
     * 添加全名模糊搜索条件
     */
    public UserQueryBuilderV2 withFullName() {
        if (StringUtils.hasText(queryDTO.getFullName())) {
            queryWrapper.like("full_name", queryDTO.getFullName());
        }
        return this;
    }

    /**
     * 添加角色精确匹配条件
     */
    public UserQueryBuilderV2 withRole() {
        if (StringUtils.hasText(queryDTO.getRole())) {
            queryWrapper.eq("role", queryDTO.getRole());
        }
        return this;
    }

    /**
     * 添加启用状态精确匹配条件
     */
    public UserQueryBuilderV2 withEnabled() {
        if (queryDTO.getEnabled() != null) {
            queryWrapper.eq("enabled", queryDTO.getEnabled());
        }
        return this;
    }

    /**
     * 添加创建时间范围查询条件
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
     * 添加更新时间范围查询条件
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
     * 添加邮箱域名筛选条件
     */
    public UserQueryBuilderV2 withEmailDomain() {
        if (StringUtils.hasText(queryDTO.getEmailDomain())) {
            queryWrapper.like("email", "@" + queryDTO.getEmailDomain());
        }
        return this;
    }

    /**
     * 添加默认排序
     */
    public UserQueryBuilderV2 withDefaultOrder() {
        queryWrapper.orderByDesc("created_at");
        return this;
    }

    /**
     * 构建完整的查询条件
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
     * 获取QueryWrapper
     */
    public QueryWrapper<User> build() {
        return queryWrapper;
    }

    /**
     * 静态工厂方法
     */
    public static UserQueryBuilderV2 from(UserQueryDTO queryDTO) {
        return new UserQueryBuilderV2(queryDTO);
    }
} 