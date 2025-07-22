package com.streamnz.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

/**
 * User query DTO with pagination support
 * Extends PageParam to include pagination and sorting capabilities
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Schema(description = "User query parameters with pagination and sorting")
public class UserQueryDTO extends PageParam {

    // Public constructor for JSON deserialization
    public UserQueryDTO() {
        super();
    }

    @Schema(description = "Username search keyword")
    @Size(max = 50, message = "Username length cannot exceed 50 characters")
    private String username;

    @Schema(description = "Email search keyword")
    @Size(max = 100, message = "Email length cannot exceed 100 characters")
    private String email;

    @Schema(description = "Full name search keyword")
    @Size(max = 100, message = "Full name length cannot exceed 100 characters")
    private String fullName;

    @Schema(description = "Enabled status", example = "true")
    private Boolean enabled;

    @Schema(description = "Created time start", example = "2025-01-01 10:30:00")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$", 
             message = "Invalid created time start format, should be: yyyy-MM-dd HH:mm:ss")
    private String createdAtStart;

    @Schema(description = "Created time end", example = "2025-12-31 23:59:59")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$", 
             message = "Invalid created time end format, should be: yyyy-MM-dd HH:mm:ss")
    private String createdAtEnd;

    @Schema(description = "Updated time start", example = "2025-01-01 10:30:00")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$", 
             message = "Invalid updated time start format, should be: yyyy-MM-dd HH:mm:ss")
    private String updatedAtStart;

    @Schema(description = "Updated time end", example = "2025-12-31 23:59:59")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$", 
             message = "Invalid updated time end format, should be: yyyy-MM-dd HH:mm:ss")
    private String updatedAtEnd;

    @Schema(description = "Email domain search", example = "gmail.com")
    @Size(max = 50, message = "Email domain length cannot exceed 50 characters")
    private String emailDomain;

    /**
     * Custom validation: Created time range validation
     */
    @AssertTrue(message = "Created time start must be before created time end")
    public boolean isCreatedTimeRangeValid() {
        if (createdAtStart == null || createdAtEnd == null) {
            return true;
        }
        LocalDateTime start = getCreatedAtStartAsDateTime();
        LocalDateTime end = getCreatedAtEndAsDateTime();
        return start == null || end == null || !start.isAfter(end);
    }

    /**
     * Custom validation: Updated time range validation
     */
    @AssertTrue(message = "Updated time start must be before updated time end")
    public boolean isUpdatedTimeRangeValid() {
        if (updatedAtStart == null || updatedAtEnd == null) {
            return true;
        }
        LocalDateTime start = getUpdatedAtStartAsDateTime();
        LocalDateTime end = getUpdatedAtEndAsDateTime();
        return start == null || end == null || !start.isAfter(end);
    }

    /**
     * Custom validation: Email domain format validation
     */
    @AssertTrue(message = "Email domain format is invalid")
    public boolean isEmailDomainValid() {
        if (emailDomain == null || emailDomain.trim().isEmpty()) {
            return true;
        }
        // Simple domain format validation
        return emailDomain.matches("^[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
    }

    // DateTime conversion methods
    public LocalDateTime getCreatedAtStartAsDateTime() {
        return parseDateTime(createdAtStart);
    }

    public LocalDateTime getCreatedAtEndAsDateTime() {
        return parseDateTime(createdAtEnd);
    }

    public LocalDateTime getUpdatedAtStartAsDateTime() {
        return parseDateTime(updatedAtStart);
    }

    public LocalDateTime getUpdatedAtEndAsDateTime() {
        return parseDateTime(updatedAtEnd);
    }

    private LocalDateTime parseDateTime(String dateTimeStr) {
        if (dateTimeStr == null || dateTimeStr.trim().isEmpty()) {
            return null;
        }
        try {
            return LocalDateTime.parse(dateTimeStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        } catch (DateTimeParseException e) {
            return null;
        }
    }

    // Builder pattern methods for query construction
    public static UserQueryDTO create() {
        return new UserQueryDTO();
    }

    public UserQueryDTO withUsername(String username) {
        this.username = username;
        return this;
    }

    public UserQueryDTO withEmail(String email) {
        this.email = email;
        return this;
    }

    public UserQueryDTO withFullName(String fullName) {
        this.fullName = fullName;
        return this;
    }

    public UserQueryDTO withEnabled(Boolean enabled) {
        this.enabled = enabled;
        return this;
    }

    public UserQueryDTO withCreatedTimeRange(String start, String end) {
        this.createdAtStart = start;
        this.createdAtEnd = end;
        return this;
    }

    public UserQueryDTO withUpdatedTimeRange(String start, String end) {
        this.updatedAtStart = start;
        this.updatedAtEnd = end;
        return this;
    }

    public UserQueryDTO withEmailDomain(String emailDomain) {
        this.emailDomain = emailDomain;
        return this;
    }
} 