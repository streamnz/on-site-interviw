package com.streamnz.model.vo;

import com.streamnz.annotation.DateFormat;
import com.streamnz.model.entity.User;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * User View Object for API responses
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "User information response object")
public class UserVO {

    @Schema(description = "User ID")
    private Long id;

    @Schema(description = "Username")
    private String username;

    @Schema(description = "Email address")
    private String email;

    @Schema(description = "Full name")
    private String fullName;

    @Schema(description = "User roles (from RBAC system)")
    private String[] roles;

    @Schema(description = "Enabled status", example = "true")
    private Boolean enabled;

    @Schema(description = "Created time")
    @DateFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createdAt;

    @Schema(description = "Updated time")
    @DateFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updatedAt;

    /**
     * Construct UserVO from User entity and roles
     * @param user User entity object
     * @param roles 用户角色数组
     */
    public UserVO(User user, String[] roles) {
        if (user != null) {
            this.id = user.getId();
            this.username = user.getUsername();
            this.email = user.getEmail();
            this.fullName = user.getFullName();
            this.roles = roles;
            this.enabled = user.getEnabled();
            this.createdAt = user.getCreatedAt();
            this.updatedAt = user.getUpdatedAt();
        }
    }

    /**
     * 兼容旧用法，默认角色为USER（建议废弃）
     */
    public UserVO(User user) {
        this(user, new String[]{"USER"});
    }
} 