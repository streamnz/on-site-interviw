package com.streamnz.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;

/**
 * 用户条件查询DTO
 * 用于封装所有可能的查询条件
 */
@Data
@Schema(description = "用户条件查询参数")
public class UserQueryDTO {

    @Schema(description = "用户名模糊搜索关键字")
    @Size(max = 50, message = "用户名长度不能超过50个字符")
    private String username;

    @Schema(description = "邮箱模糊搜索关键字")
    @Email(message = "邮箱格式不正确")
    @Size(max = 100, message = "邮箱长度不能超过100个字符")
    private String email;

    @Schema(description = "全名模糊搜索关键字")
    @Size(max = 100, message = "全名长度不能超过100个字符")
    private String fullName;

    @Schema(description = "用户角色", example = "ADMIN")
    @Pattern(regexp = "^(ADMIN|MANAGER|USER)$", message = "角色只能是ADMIN、MANAGER或USER")
    private String role;

    @Schema(description = "启用状态", example = "true")
    private Boolean enabled;

    @Schema(description = "创建时间开始", example = "2025-01-01 10:30:00")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$", 
             message = "创建时间开始格式不正确，应为：yyyy-MM-dd HH:mm:ss")
    private String createdAtStart;

    @Schema(description = "创建时间结束", example = "2025-12-31 23:59:59")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$", 
             message = "创建时间结束格式不正确，应为：yyyy-MM-dd HH:mm:ss")
    private String createdAtEnd;

    @Schema(description = "更新时间开始", example = "2025-01-01 10:30:00")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$", 
             message = "更新时间开始格式不正确，应为：yyyy-MM-dd HH:mm:ss")
    private String updatedAtStart;

    @Schema(description = "更新时间结束", example = "2025-12-31 23:59:59")
    @Pattern(regexp = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$", 
             message = "更新时间结束格式不正确，应为：yyyy-MM-dd HH:mm:ss")
    private String updatedAtEnd;

    @Schema(description = "邮箱域名", example = "test.com")
    @Pattern(regexp = "^[a-zA-Z0-9.-]+$", message = "邮箱域名格式不正确")
    @Size(max = 50, message = "邮箱域名长度不能超过50个字符")
    private String emailDomain;

    // 时间格式常量
    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    /**
     * 获取创建时间开始（LocalDateTime类型）
     */
    public LocalDateTime getCreatedAtStartAsDateTime() {
        return parseDateTime(createdAtStart);
    }

    /**
     * 获取创建时间结束（LocalDateTime类型）
     */
    public LocalDateTime getCreatedAtEndAsDateTime() {
        return parseDateTime(createdAtEnd);
    }

    /**
     * 获取更新时间开始（LocalDateTime类型）
     */
    public LocalDateTime getUpdatedAtStartAsDateTime() {
        return parseDateTime(updatedAtStart);
    }

    /**
     * 获取更新时间结束（LocalDateTime类型）
     */
    public LocalDateTime getUpdatedAtEndAsDateTime() {
        return parseDateTime(updatedAtEnd);
    }

    /**
     * 解析时间字符串为LocalDateTime
     */
    private LocalDateTime parseDateTime(String dateTimeStr) {
        if (dateTimeStr == null || dateTimeStr.trim().isEmpty()) {
            return null;
        }
        try {
            return LocalDateTime.parse(dateTimeStr.trim(), DATE_TIME_FORMATTER);
        } catch (DateTimeParseException e) {
            throw new IllegalArgumentException("时间格式不正确: " + dateTimeStr + "，应为：yyyy-MM-dd HH:mm:ss");
        }
    }

    /**
     * 自定义校验：时间范围逻辑
     */
    @AssertTrue(message = "创建时间开始不能晚于创建时间结束")
    public boolean isCreatedAtRangeValid() {
        LocalDateTime start = getCreatedAtStartAsDateTime();
        LocalDateTime end = getCreatedAtEndAsDateTime();
        
        if (start != null && end != null) {
            return !start.isAfter(end);
        }
        return true;
    }

    @AssertTrue(message = "更新时间开始不能晚于更新时间结束")
    public boolean isUpdatedAtRangeValid() {
        LocalDateTime start = getUpdatedAtStartAsDateTime();
        LocalDateTime end = getUpdatedAtEndAsDateTime();
        
        if (start != null && end != null) {
            return !start.isAfter(end);
        }
        return true;
    }

    /**
     * 自定义校验：时间不能是未来时间（允许当前年份）
     */
    @AssertTrue(message = "创建时间开始不能是未来时间")
    public boolean isCreatedAtStartNotFuture() {
        LocalDateTime start = getCreatedAtStartAsDateTime();
        if (start != null) {
            // 允许当前年份的时间
            LocalDateTime now = LocalDateTime.now();
            return !start.isAfter(now.plusYears(1));
        }
        return true;
    }

    @AssertTrue(message = "创建时间结束不能是未来时间")
    public boolean isCreatedAtEndNotFuture() {
        LocalDateTime end = getCreatedAtEndAsDateTime();
        if (end != null) {
            // 允许当前年份的时间
            LocalDateTime now = LocalDateTime.now();
            return !end.isAfter(now.plusYears(1));
        }
        return true;
    }

    @AssertTrue(message = "更新时间开始不能是未来时间")
    public boolean isUpdatedAtStartNotFuture() {
        LocalDateTime start = getUpdatedAtStartAsDateTime();
        if (start != null) {
            // 允许当前年份的时间
            LocalDateTime now = LocalDateTime.now();
            return !start.isAfter(now.plusYears(1));
        }
        return true;
    }

    @AssertTrue(message = "更新时间结束不能是未来时间")
    public boolean isUpdatedAtEndNotFuture() {
        LocalDateTime end = getUpdatedAtEndAsDateTime();
        if (end != null) {
            // 允许当前年份的时间
            LocalDateTime now = LocalDateTime.now();
            return !end.isAfter(now.plusYears(1));
        }
        return true;
    }
} 