package com.streamnz.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.AssertTrue;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

/**
 * User query DTO
 * Used to encapsulate all possible query conditions
 */
@Data
@Schema(description = "User query parameters")
public class UserQueryDTO {

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

    @Schema(description = "Email domain", example = "test.com")
    @Pattern(regexp = "^[a-zA-Z0-9.-]+$", message = "Invalid email domain format")
    @Size(max = 50, message = "Email domain length cannot exceed 50 characters")
    private String emailDomain;

    // Time format constant
    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    /**
     * Get created time start (LocalDateTime type)
     */
    public LocalDateTime getCreatedAtStartAsDateTime() {
        return parseDateTime(createdAtStart);
    }

    /**
     * Get created time end (LocalDateTime type)
     */
    public LocalDateTime getCreatedAtEndAsDateTime() {
        return parseDateTime(createdAtEnd);
    }

    /**
     * Get updated time start (LocalDateTime type)
     */
    public LocalDateTime getUpdatedAtStartAsDateTime() {
        return parseDateTime(updatedAtStart);
    }

    /**
     * Get updated time end (LocalDateTime type)
     */
    public LocalDateTime getUpdatedAtEndAsDateTime() {
        return parseDateTime(updatedAtEnd);
    }

    /**
     * Parse time string to LocalDateTime
     */
    private LocalDateTime parseDateTime(String dateTimeStr) {
        if (dateTimeStr == null || dateTimeStr.trim().isEmpty()) {
            return null;
        }
        try {
            return LocalDateTime.parse(dateTimeStr.trim(), DATE_TIME_FORMATTER);
        } catch (DateTimeParseException e) {
            throw new IllegalArgumentException("Invalid time format: " + dateTimeStr + ", should be: yyyy-MM-dd HH:mm:ss");
        }
    }

    /**
     * Custom validation: created time range logic
     */
    @AssertTrue(message = "Created time start cannot be later than created time end")
    public boolean isCreatedAtRangeValid() {
        LocalDateTime start = getCreatedAtStartAsDateTime();
        LocalDateTime end = getCreatedAtEndAsDateTime();
        
        if (start != null && end != null) {
            return !start.isAfter(end);
        }
        return true;
    }

    @AssertTrue(message = "Updated time start cannot be later than updated time end")
    public boolean isUpdatedAtRangeValid() {
        LocalDateTime start = getUpdatedAtStartAsDateTime();
        LocalDateTime end = getUpdatedAtEndAsDateTime();
        
        if (start != null && end != null) {
            return !start.isAfter(end);
        }
        return true;
    }

    /**
     * Custom validation: time cannot be in the future (allow current year)
     */
    @AssertTrue(message = "Created time start cannot be in the future")
    public boolean isCreatedAtStartNotFuture() {
        LocalDateTime start = getCreatedAtStartAsDateTime();
        if (start != null) {
            // Allow current year time
            LocalDateTime now = LocalDateTime.now();
            return !start.isAfter(now.plusYears(1));
        }
        return true;
    }

    @AssertTrue(message = "Updated time start cannot be in the future")
    public boolean isUpdatedAtStartNotFuture() {
        LocalDateTime start = getUpdatedAtStartAsDateTime();
        if (start != null) {
            // Allow current year time
            LocalDateTime now = LocalDateTime.now();
            return !start.isAfter(now.plusYears(1));
        }
        return true;
    }
} 