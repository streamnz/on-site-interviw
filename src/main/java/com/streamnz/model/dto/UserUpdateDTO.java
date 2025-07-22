package com.streamnz.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;
import org.springframework.util.StringUtils;

/**
 * User update DTO
 * Used to encapsulate user update request parameters
 */
@Data
@Schema(description = "User update request parameters")
public class UserUpdateDTO {

    @Schema(description = "User ID", example = "1")
    @NotBlank(message = "User ID cannot be empty")
    private String id;

    @Schema(description = "Username", example = "john_doe")
    @Size(min = 3, max = 50, message = "Username length must be between 3-50 characters")
    @Pattern(regexp = "^[a-zA-Z0-9_]+$", message = "Username can only contain letters, numbers and underscores")
    private String username;

    @Schema(description = "Password", example = "newPassword123")
    @Size(min = 6, max = 100, message = "Password length must be between 6-100 characters")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d@$!%*?&]{6,}$", 
             message = "Password must contain at least one lowercase letter, one uppercase letter and one number")
    private String password;

    @Schema(description = "Email", example = "john.doe@example.com")
    @Email(message = "Invalid email format")
    @Size(max = 100, message = "Email length cannot exceed 100 characters")
    private String email;

    @Schema(description = "Full name", example = "John Doe")
    @Size(min = 2, max = 100, message = "Full name length must be between 2-100 characters")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "Full name can only contain letters and spaces")
    private String fullName;

    /**
     * Check if any field is set (except ID)
     */
    public boolean hasAnyField() {
        return (StringUtils.hasText(username) ||
                StringUtils.hasText(password) ||
                StringUtils.hasText(email) ||
                StringUtils.hasText(fullName));


    }

}