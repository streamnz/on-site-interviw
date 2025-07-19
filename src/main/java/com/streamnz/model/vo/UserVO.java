package com.streamnz.model.vo;

import com.streamnz.model.po.User;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * User View Object for API responses
 * 用于API响应的用户视图对象
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "用户信息响应对象")
public class UserVO {

    @Schema(description = "用户ID")
    private Long id;

    @Schema(description = "用户名")
    private String username;

    @Schema(description = "邮箱地址")
    private String email;

    @Schema(description = "用户全名")
    private String fullName;

    @Schema(description = "用户角色", example = "ADMIN")
    private String role;

    @Schema(description = "是否启用", example = "true")
    private Boolean enabled;

    @Schema(description = "创建时间")
    private LocalDateTime createdAt;

    @Schema(description = "更新时间")
    private LocalDateTime updatedAt;

    /**
     * 从User实体构造UserVO
     * @param user User实体对象
     */
    public UserVO(User user) {
        if (user != null) {
            this.id = user.getId();
            this.username = user.getUsername();
            this.email = user.getEmail();
            this.fullName = user.getFullName();
            this.role = user.getRole();
            this.enabled = user.getEnabled();
            this.createdAt = user.getCreatedAt();
            this.updatedAt = user.getUpdatedAt();
        }
    }
} 