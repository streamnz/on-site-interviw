package com.streamnz.model.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.streamnz.model.po.User;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * User View Object
 * Used for API responses, id is String type
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "User view object")
public class UserVO {
    @Schema(description = "User ID (as string)")
    private String id;

    @Schema(description = "Username")
    private String username;

    @Schema(description = "Email address")
    private String email;

    @Schema(description = "Full name")
    private String fullName;

    @Schema(description = "Created time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createdAt;

    @Schema(description = "Updated time")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime updatedAt;

    /**
     * Construct UserVO from User entity, converting id to String
     */
    public UserVO(User user) {
        this.id = user.getId() == null ? null : user.getId().toString();
        this.username = user.getUsername();
        this.email = user.getEmail();
        this.fullName = user.getFullName();
        this.createdAt = user.getCreatedAt();
        this.updatedAt = user.getUpdatedAt();
    }
}