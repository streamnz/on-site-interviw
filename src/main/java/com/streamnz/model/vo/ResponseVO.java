package com.streamnz.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Generic API response object
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "Generic API response format")
public class ResponseVO<T> {

    @Schema(description = "Response status code", example = "200")
    private Integer code;

    @Schema(description = "Response message", example = "Operation successful")
    private String message;

    @Schema(description = "Response data")
    private T data;

    @Schema(description = "Timestamp", example = "1640995200000")
    private Long timestamp;

    /**
     * Success response (no data)
     */
    public static <T> ResponseVO<T> success() {
        return new ResponseVO<>(200, "Operation successful", null, System.currentTimeMillis());
    }

    /**
     * Success response (with data)
     */
    public static <T> ResponseVO<T> success(T data) {
        return new ResponseVO<>(200, "Operation successful", data, System.currentTimeMillis());
    }

    /**
     * Success response (custom message)
     */
    public static <T> ResponseVO<T> success(String message, T data) {
        return new ResponseVO<>(200, message, data, System.currentTimeMillis());
    }

    /**
     * Error response
     */
    public static <T> ResponseVO<T> error(Integer code, String message) {
        return new ResponseVO<>(code, message, null, System.currentTimeMillis());
    }

    /**
     * Error response (with data)
     */
    public static <T> ResponseVO<T> error(Integer code, String message, T data) {
        return new ResponseVO<>(code, message, data, System.currentTimeMillis());
    }

    /**
     * Error response (default 500 error)
     */
    public static <T> ResponseVO<T> error(String message) {
        return new ResponseVO<>(500, message, null, System.currentTimeMillis());
    }
} 