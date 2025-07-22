package com.streamnz.model.dto.response;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Authentication response DTO
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "Authentication response")
public class AuthResponse {

    @Schema(description = "JWT token")
    private String token;

    @Schema(description = "Token type", example = "Bearer")
    private String tokenType;

    @Schema(description = "User information")
    private UserInfo userInfo;

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    @Schema(description = "User information")
    public static class UserInfo {
        @Schema(description = "User ID")
        private Long id;

        @Schema(description = "Username")
        private String username;

        @Schema(description = "Email")
        private String email;

        @Schema(description = "Full name")
        private String fullName;

        @Schema(description = "User roles")
        private String[] roles;
    }
} 