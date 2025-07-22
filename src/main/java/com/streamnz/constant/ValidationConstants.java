package com.streamnz.constant;

/**
 * Validation related constants
 */
public final class ValidationConstants {

    private ValidationConstants() {
        // Prevent instantiation
    }

    /**
     * Regex patterns
     */
    public static final String USERNAME_PATTERN = "^[a-zA-Z0-9_]+$";
    public static final String PASSWORD_PATTERN = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d@$!%*?&]{6,}$";
    public static final String EMAIL_PATTERN = "^[A-Za-z0-9+_.-]+@([A-Za-z0-9.-]+\\.[A-Za-z]{2,})$";
    public static final String FULL_NAME_PATTERN = "^[a-zA-Z\\s]+$";
    public static final String ROLE_PATTERN = "^(ADMIN|MANAGER|USER)$";
    public static final String EMAIL_DOMAIN_PATTERN = "^[a-zA-Z0-9.-]+$";
    public static final String DATETIME_PATTERN = "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$";

    /**
     * Length constraints
     */
    public static final int USERNAME_MIN_LENGTH = 3;
    public static final int USERNAME_MAX_LENGTH = 50;
    public static final int PASSWORD_MIN_LENGTH = 6;
    public static final int PASSWORD_MAX_LENGTH = 100;
    public static final int EMAIL_MAX_LENGTH = 100;
    public static final int FULL_NAME_MIN_LENGTH = 2;
    public static final int FULL_NAME_MAX_LENGTH = 100;
    public static final int EMAIL_DOMAIN_MAX_LENGTH = 50;

    /**
     * Validation messages
     */
    public static final String USERNAME_EMPTY_MSG = "Username cannot be empty";
    public static final String USERNAME_LENGTH_MSG = "Username length must be between " + USERNAME_MIN_LENGTH + "-" + USERNAME_MAX_LENGTH + " characters";
    public static final String USERNAME_PATTERN_MSG = "Username can only contain letters, numbers and underscores";
    public static final String PASSWORD_EMPTY_MSG = "Password cannot be empty";
    public static final String PASSWORD_LENGTH_MSG = "Password length must be between " + PASSWORD_MIN_LENGTH + "-" + PASSWORD_MAX_LENGTH + " characters";
    public static final String PASSWORD_PATTERN_MSG = "Password must contain at least one lowercase letter, one uppercase letter and one number";
    public static final String EMAIL_EMPTY_MSG = "Email cannot be empty";
    public static final String EMAIL_FORMAT_MSG = "Invalid email format";
    public static final String EMAIL_LENGTH_MSG = "Email length cannot exceed " + EMAIL_MAX_LENGTH + " characters";
    public static final String FULL_NAME_EMPTY_MSG = "Full name cannot be empty";
    public static final String FULL_NAME_LENGTH_MSG = "Full name length must be between " + FULL_NAME_MIN_LENGTH + "-" + FULL_NAME_MAX_LENGTH + " characters";
    public static final String FULL_NAME_PATTERN_MSG = "Full name can only contain letters and spaces";

    /**
     * Sensitive words
     */
    public static final String[] SENSITIVE_WORDS = {"admin", "root", "system", "test", "guest"};

    /**
     * Valid email domains
     */
    public static final String[] VALID_EMAIL_DOMAINS = {"gmail.com", "yahoo.com", "hotmail.com", "outlook.com", "example.com"};

    /**
     * Date time format
     */
    public static final String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
} 