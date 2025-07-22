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

    @Schema(description = "Username", example = "john_doe", required = true)
    @NotBlank(message = "Username cannot be empty")
    @Size(min = 3, max = 50, message = "Username length must be between 3-50 characters")
    @Pattern(regexp = "^[a-zA-Z0-9_]+$", message = "Username can only contain letters, numbers and underscores")
    private String username;

    @Schema(description = "Password", example = "password123", required = true)
    @NotBlank(message = "Password cannot be empty")
    @Size(min = 6, max = 100, message = "Password length must be between 6-100 characters")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d@$!%*?&]{6,}$", 
             message = "Password must contain at least one lowercase letter, one uppercase letter and one number")
    private String password;

    @Schema(description = "Confirm password", example = "password123", required = true)
    @NotBlank(message = "Confirm password cannot be empty")
    private String confirmPassword;

    @Schema(description = "Email", example = "john.doe@example.com", required = true)
    @NotBlank(message = "Email cannot be empty")
    @Email(message = "Invalid email format")
    @Size(max = 100, message = "Email length cannot exceed 100 characters")
    private String email;

    @Schema(description = "Full name", example = "John Doe", required = true)
    @NotBlank(message = "Full name cannot be empty")
    @Size(min = 2, max = 100, message = "Full name length must be between 2-100 characters")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "Full name can only contain letters and spaces")
    private String fullName;

    @Schema(description = "User role", example = "USER", defaultValue = "USER")
    @Pattern(regexp = "^(ADMIN|MANAGER|USER)$", message = "Role can only be ADMIN, MANAGER or USER")
    private String role;

    @Schema(description = "Enabled status", example = "true", defaultValue = "true")
    private Boolean enabled;

    /**
     * Custom validation: password confirmation
     */
    @AssertTrue(message = "Password and confirm password do not match")
    public boolean isPasswordConfirmed() {
        if (password == null || confirmPassword == null) {
            return false;
        }
        return password.equals(confirmPassword);
    }

    /**
     * Custom validation: username cannot contain sensitive words
     */
    @AssertTrue(message = "Username contains sensitive words, please change")
    public boolean isUsernameNotSensitive() {
        if (username == null) {
            return true;
        }
        String lowerUsername = username.toLowerCase();
        String[] sensitiveWords = {"admin", "root", "system", "test", "guest"};
        for (String word : sensitiveWords) {
            if (lowerUsername.contains(word)) {
                return false;
            }
        }
        return true;
    }

    /**
     * Custom validation: email domain check
     */
    @AssertTrue(message = "Email domain is not supported")
    public boolean isEmailDomainValid() {
        if (email == null) {
            return true;
        }
        String[] validDomains = {"gmail.com", "yahoo.com", "hotmail.com", "outlook.com", "example.com"};
        String domain = email.substring(email.indexOf("@") + 1);
        for (String validDomain : validDomains) {
            if (domain.equals(validDomain)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Set default values
     */
    public void setDefaults() {
        if (role == null || role.trim().isEmpty()) {
            this.role = "USER";
        }
        if (enabled == null) {
            this.enabled = true;
        }
    }
} 