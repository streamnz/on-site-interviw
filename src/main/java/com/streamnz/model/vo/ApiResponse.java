package com.streamnz.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Generic API response object
 * Provides standardized response format for all API endpoints
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "Generic API response format")
public class ApiResponse<T> {

    @Schema(description = "Response status code", example = "200")
    private String code;

    @Schema(description = "Response message", example = "Operation successful")
    private String message;

    @Schema(description = "Response data")
    private T data;

    @Schema(description = "Timestamp", example = "1640995200000")
    private Long timestamp;

    /**
     * Success response (no data)
     */
    public static <T> ApiResponse<T> success() {
        return new ApiResponse<>(200, "Operation successful", null, System.currentTimeMillis());
    }

    /**
     * Success response (with data)
     */
    public static <T> ApiResponse<T> success(T data) {
        return new ApiResponse<>(200, "Operation successful", data, System.currentTimeMillis());
    }

    /**
     * Success response (custom message)
     */
    public static <T> ApiResponse<T> success(String message, T data) {
        return new ApiResponse<>(200, message, data, System.currentTimeMillis());
    }

    /**
     * Error response
     */
    public static <T> ApiResponse<T> error(Integer code, String message) {
        return new ApiResponse<>(code, message, null, System.currentTimeMillis());
    }

    /**
     * Error response (with data)
     */
    public static <T> ApiResponse<T> error(Integer code, String message, T data) {
        return new ApiResponse<>(code, message, data, System.currentTimeMillis());
    }

    /**
     * Error response (default 500 error)
     */
    public static <T> ApiResponse<T> error(String message) {
        return new ApiResponse<>(500, message, null, System.currentTimeMillis());
    }
} 