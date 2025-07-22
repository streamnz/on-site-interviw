package com.streamnz.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.*;
import lombok.Data;

/**
 * User creation DTO
 * Used to encapsulate user creation request parameters
 */
@Data
@Schema(description = "User creation request parameters")
public class UserCreateDTO {

    @Schema(description = "Username", example = "john_doe")
    @NotBlank(message = "Username cannot be empty")
    @Size(min = 3, max = 50, message = "Username length must be between 3-50 characters")
    @Pattern(regexp = "^[a-zA-Z0-9_]+$", message = "Username can only contain letters, numbers and underscores")
    private String username;

    @Schema(description = "Password", example = "password123")
    @NotBlank(message = "Password cannot be empty")
    @Size(min = 6, max = 100, message = "Password length must be between 6-100 characters")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d@$!%*?&]{6,}$", 
             message = "Password must contain at least one lowercase letter, one uppercase letter and one number")
    private String password;

    @Schema(description = "Confirm password", example = "password123")
    @NotBlank(message = "Confirm password cannot be empty")
    private String confirmPassword;

    @Schema(description = "Email", example = "john.doe@example.com")
    @NotBlank(message = "Email cannot be empty")
    @Email(message = "Invalid email format")
    @Size(max = 100, message = "Email length cannot exceed 100 characters")
    private String email;

    @Schema(description = "Full name", example = "John Doe")
    @NotBlank(message = "Full name cannot be empty")
    @Size(min = 2, max = 100, message = "Full name length must be between 2-100 characters")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "Full name can only contain letters and spaces")
    private String fullName;

    @Schema(description = "Enabled status", example = "true", defaultValue = "true")
    private Boolean enabled;


} 