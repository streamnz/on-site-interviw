package com.streamnz.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

/**
 * Login request DTO
 */
@Data
@Schema(description = "Login request")
public class LoginRequest {

    @NotBlank(message = "用户名不能为空")
    @Schema(description = "Username", example = "admin")
    private String username;

    @NotBlank(message = "密码不能为空")
    @Schema(description = "Password", example = "password")
    private String password;
} 