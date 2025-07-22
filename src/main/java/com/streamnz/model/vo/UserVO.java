package com.streamnz.model.vo;

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
    private LocalDateTime createdAt;

    @Schema(description = "Updated time")
    private LocalDateTime updatedAt;

    /**
     * Construct UserVO from User entity
     * @param user User entity object
     */
    public UserVO(User user) {
        if (user != null) {
            this.id = user.getId();
            this.username = user.getUsername();
            this.email = user.getEmail();
            this.fullName = user.getFullName();
            // Roles are now managed through RBAC system
            this.roles = new String[]{"USER"}; // Default role
            this.enabled = user.getEnabled();
            this.createdAt = user.getCreatedAt();
            this.updatedAt = user.getUpdatedAt();
        }
    }
} 