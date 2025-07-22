package com.streamnz.constant;

/**
 * Security related constants
 */
public final class SecurityConstants {

    private SecurityConstants() {
        // Prevent instantiation
    }

    /**
     * JWT related constants
     */
    public static final String TOKEN_PREFIX = "Bearer ";
    public static final String HEADER_STRING = "Authorization";
    public static final long DEFAULT_EXPIRATION_TIME = 86400000L; // 24 hours in milliseconds
    public static final String JWT_SECRET_PROPERTY = "jwt.secret";
    public static final String JWT_EXPIRATION_PROPERTY = "jwt.expiration";

    /**
     * Security related paths
     */
    public static final String[] PUBLIC_PATHS = {
        "/api/auth/**",
        "/swagger-ui/**",
        "/v3/api-docs/**",
        "/swagger-ui.html",
        "/swagger-ui/index.html",
        "/api/test/**",
        "/actuator/**",
        "/api/monitor/**"
    };

    /**
     * Role related constants
     */
    public static final String ROLE_PREFIX = "ROLE_";
    public static final String ADMIN_ROLE = "ADMIN";
    public static final String USER_ROLE = "USER";
    public static final String MANAGER_ROLE = "MANAGER";

    /**
     * Security configuration
     */
    public static final int BCRYPT_STRENGTH = 10;
    public static final String ANONYMOUS_USER = "anonymousUser";
} 