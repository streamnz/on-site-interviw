package com.streamnz.exception.custom;

import com.streamnz.enums.ResponseCode;

/**
 * Business logic exception
 * Used for business rule violations and expected error conditions
 */
public class BusinessException extends RuntimeException {

    private final int code;
    private final String message;
    private final Object data;

    public BusinessException(String message) {
        super(message);
        this.code = ResponseCode.BAD_REQUEST.getCode();
        this.message = message;
        this.data = null;
    }

    public BusinessException(int code, String message) {
        super(message);
        this.code = code;
        this.message = message;
        this.data = null;
    }

    public BusinessException(ResponseCode responseCode) {
        super(responseCode.getMessage());
        this.code = responseCode.getCode();
        this.message = responseCode.getMessage();
        this.data = null;
    }

    public BusinessException(ResponseCode responseCode, String customMessage) {
        super(customMessage);
        this.code = responseCode.getCode();
        this.message = customMessage;
        this.data = null;
    }

    public BusinessException(int code, String message, Object data) {
        super(message);
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public BusinessException(ResponseCode responseCode, Object data) {
        super(responseCode.getMessage());
        this.code = responseCode.getCode();
        this.message = responseCode.getMessage();
        this.data = data;
    }

    public int getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public Object getData() {
        return data;
    }

    // Static factory methods for common business exceptions
    public static BusinessException userNotFound() {
        return new BusinessException(ResponseCode.NOT_FOUND, "User not found");
    }

    public static BusinessException userNotFound(Long userId) {
        return new BusinessException(ResponseCode.NOT_FOUND, "User not found with ID: " + userId);
    }

    public static BusinessException usernameExists(String username) {
        return new BusinessException(ResponseCode.CONFLICT, "Username already exists: " + username);
    }

    public static BusinessException emailExists(String email) {
        return new BusinessException(ResponseCode.CONFLICT, "Email already exists: " + email);
    }

    public static BusinessException invalidCredentials() {
        return new BusinessException(ResponseCode.UNAUTHORIZED, "Invalid username or password");
    }

    public static BusinessException accessDenied() {
        return new BusinessException(ResponseCode.FORBIDDEN, "Access denied");
    }

    public static BusinessException validationFailed(String message) {
        return new BusinessException(ResponseCode.VALIDATION_FAILED, message);
    }
} 