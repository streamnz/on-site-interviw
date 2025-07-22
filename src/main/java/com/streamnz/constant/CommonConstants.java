package com.streamnz.constant;

/**
 * Common constants used across the application
 */
public final class CommonConstants {

    private CommonConstants() {
        // Prevent instantiation
    }

    /**
     * HTTP related constants
     */
    public static final String CONTENT_TYPE_JSON = "application/json";
    public static final String CHARSET_UTF8 = "UTF-8";

    /**
     * Default pagination values
     */
    public static final long DEFAULT_PAGE_SIZE = 10L;
    public static final long DEFAULT_CURRENT_PAGE = 1L;
    public static final long MAX_PAGE_SIZE = 100L;

    /**
     * Database related constants
     */
    public static final String DEFAULT_SORT_FIELD = "created_at";
    public static final String SORT_DESC = "DESC";
    public static final String SORT_ASC = "ASC";

    /**
     * Response messages
     */
    public static final String SUCCESS_MSG = "Operation successful";
    public static final String LOGIN_SUCCESS_MSG = "Login successful";
    public static final String LOGOUT_SUCCESS_MSG = "Logout successful";
    public static final String REGISTRATION_SUCCESS_MSG = "Registration successful";
    public static final String USER_CREATED_MSG = "User created successfully";
    public static final String USER_UPDATED_MSG = "User updated successfully";
    public static final String USER_DELETED_MSG = "User deleted successfully";
    public static final String USERS_QUERIED_MSG = "Users queried successfully";
    public static final String USER_INFO_RETRIEVED_MSG = "User information retrieved successfully";
    public static final String CURRENT_USER_INFO_RETRIEVED_MSG = "Current user information retrieved successfully";
    public static final String CONNECTION_POOL_STATUS_RETRIEVED_MSG = "Connection pool status retrieved successfully";
    public static final String SYSTEM_HEALTH_RETRIEVED_MSG = "System health status retrieved successfully";

    /**
     * Error messages
     */
    public static final String PARAMETER_VALIDATION_FAILED_MSG = "Parameter validation failed";
    public static final String ACCESS_DENIED_MSG = "Access denied";
    public static final String INTERNAL_SERVER_ERROR_MSG = "Internal server error";
    public static final String USER_NOT_FOUND_MSG = "User not found";
    public static final String USERNAME_EXISTS_MSG = "Username already exists";
    public static final String EMAIL_EXISTS_MSG = "Email already exists";
    public static final String INVALID_CREDENTIALS_MSG = "Invalid username or password";

    /**
     * System related constants
     */
    public static final String APPLICATION_NAME = "User Management System";
    public static final String API_VERSION = "v1";
    public static final String API_BASE_PATH = "/api";

    /**
     * Cache related constants
     */
    public static final String CACHE_PERMISSIONS = "permissions";
    public static final String CACHE_USER_RESOURCES = "user_resources";
    public static final long CACHE_TTL_SECONDS = 3600L; // 1 hour

    /**
     * Thread pool related constants
     */
    public static final int CORE_POOL_SIZE = 8;
    public static final int MAX_POOL_SIZE = 16;
    public static final int QUEUE_CAPACITY = 100;
    public static final int KEEP_ALIVE_SECONDS = 60;
} 