package com.streamnz.model.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

/**
 * Register request DTO
 */
@Data
@Schema(description = "Register request")
public class RegisterRequest {

    @NotBlank(message = "Username cannot be empty")
    @Size(min = 3, max = 50, message = "Username length must be between 3 and 50 characters")
    @Schema(description = "Username", example = "newuser")
    private String username;

    @NotBlank(message = "Password cannot be empty")
    @Size(min = 6, max = 100, message = "Password length must be between 6 and 100 characters")
    @Schema(description = "Password", example = "password123")
    private String password;

    @Email(message = "Invalid email format")
    @Schema(description = "Email address", example = "user@example.com")
    private String email;

    @Schema(description = "Full name", example = "John Doe")
    private String fullName;
} 