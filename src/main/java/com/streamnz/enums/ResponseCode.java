package com.streamnz.enums;

/**
 * Response code enumeration
 */
public enum ResponseCode {
    // Success codes
    SUCCESS(200, "Success"),
    CREATED(201, "Created"),
    
    // Client error codes
    BAD_REQUEST(400, "Bad Request"),
    UNAUTHORIZED(401, "Unauthorized"),
    FORBIDDEN(403, "Forbidden"),
    NOT_FOUND(404, "Not Found"),
    METHOD_NOT_ALLOWED(405, "Method Not Allowed"),
    CONFLICT(409, "Conflict"),
    VALIDATION_FAILED(422, "Validation Failed"),
    
    // Server error codes
    INTERNAL_SERVER_ERROR(500, "Internal Server Error"),
    BAD_GATEWAY(502, "Bad Gateway"),
    SERVICE_UNAVAILABLE(503, "Service Unavailable"),
    GATEWAY_TIMEOUT(504, "Gateway Timeout");

    private final int code;
    private final String message;

    ResponseCode(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public int getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    /**
     * Get ResponseCode by code
     * @param code HTTP status code
     * @return ResponseCode enum
     */
    public static ResponseCode fromCode(int code) {
        for (ResponseCode responseCode : values()) {
            if (responseCode.getCode() == code) {
                return responseCode;
            }
        }
        throw new IllegalArgumentException("Unknown response code: " + code);
    }

    /**
     * Check if the code represents success
     * @return true if success code (2xx)
     */
    public boolean isSuccess() {
        return code >= 200 && code < 300;
    }

    /**
     * Check if the code represents client error
     * @return true if client error (4xx)
     */
    public boolean isClientError() {
        return code >= 400 && code < 500;
    }

    /**
     * Check if the code represents server error
     * @return true if server error (5xx)
     */
    public boolean isServerError() {
        return code >= 500 && code < 600;
    }
} 