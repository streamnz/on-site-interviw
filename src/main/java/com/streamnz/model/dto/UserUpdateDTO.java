package com.streamnz.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.*;
import lombok.Data;

/**
 * User update DTO
 * Used to encapsulate user update request parameters
 */
@Data
@Schema(description = "User update request parameters")
public class UserUpdateDTO {

    @Schema(description = "User ID", example = "1", required = true)
    @NotNull(message = "User ID cannot be empty")
    @Min(value = 1, message = "User ID must be greater than 0")
    private Long id;

    @Schema(description = "Username", example = "john_doe")
    @Size(min = 3, max = 50, message = "Username length must be between 3-50 characters")
    @Pattern(regexp = "^[a-zA-Z0-9_]+$", message = "Username can only contain letters, numbers and underscores")
    private String username;

    @Schema(description = "Password", example = "newPassword123")
    @Size(min = 6, max = 100, message = "Password length must be between 6-100 characters")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d@$!%*?&]{6,}$", 
             message = "Password must contain at least one lowercase letter, one uppercase letter and one number")
    private String password;

    @Schema(description = "Confirm password", example = "newPassword123")
    private String confirmPassword;

    @Schema(description = "Email", example = "john.doe@example.com")
    @Email(message = "Invalid email format")
    @Size(max = 100, message = "Email length cannot exceed 100 characters")
    private String email;

    @Schema(description = "Full name", example = "John Doe")
    @Size(min = 2, max = 100, message = "Full name length must be between 2-100 characters")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "Full name can only contain letters and spaces")
    private String fullName;

    @Schema(description = "Enabled status", example = "true")
    private Boolean enabled;

    /**
     * Custom validation: password confirmation (only when password is not empty)
     */
    @AssertTrue(message = "Password and confirm password do not match")
    public boolean isPasswordConfirmed() {
        // If password is empty, no confirmation needed
        if (password == null || password.trim().isEmpty()) {
            return true;
        }
        // If password is not empty, confirm password cannot be empty
        if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
            return false;
        }
        return password.equals(confirmPassword);
    }

    /**
     * Custom validation: username cannot contain sensitive words
     */
    @AssertTrue(message = "Username contains sensitive words, please change")
    public boolean isUsernameNotSensitive() {
        if (username == null || username.trim().isEmpty()) {
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
        if (email == null || email.trim().isEmpty()) {
            return true;
        }
        if (!email.contains("@")) {
            return false;
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
     * Custom validation: at least one field must be updated (except ID)
     */
    @AssertTrue(message = "At least one field must be provided for update")
    public boolean hasAtLeastOneField() {
        return (username != null && !username.trim().isEmpty()) ||
               (password != null && !password.trim().isEmpty()) ||
               (email != null && !email.trim().isEmpty()) ||
               (fullName != null && !fullName.trim().isEmpty()) ||
               (enabled != null);
    }

    /**
     * Custom validation: username and email cannot be empty at the same time
     */
    @AssertTrue(message = "Username and email cannot be empty at the same time")
    public boolean isUsernameOrEmailProvided() {
        boolean hasUsername = username != null && !username.trim().isEmpty();
        boolean hasEmail = email != null && !email.trim().isEmpty();
        return hasUsername || hasEmail;
    }

    /**
     * Check if any field is set (except ID)
     */
    public boolean hasAnyField() {
        return (username != null && !username.trim().isEmpty()) ||
               (password != null && !password.trim().isEmpty()) ||
               (email != null && !email.trim().isEmpty()) ||
               (fullName != null && !fullName.trim().isEmpty()) ||
               (enabled != null);
    }

    /**
     * Get count of non-empty fields (excluding ID)
     */
    public int getNonEmptyFieldCount() {
        int count = 0;
        if (username != null && !username.trim().isEmpty()) count++;
        if (password != null && !password.trim().isEmpty()) count++;
        if (email != null && !email.trim().isEmpty()) count++;
        if (fullName != null && !fullName.trim().isEmpty()) count++;
        if (enabled != null) count++;
        return count;
    }
} 