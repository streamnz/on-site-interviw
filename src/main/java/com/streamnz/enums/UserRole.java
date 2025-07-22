package com.streamnz.enums;

/**
 * User role enumeration
 */
public enum UserRole {
    ADMIN("ADMIN", "Administrator", "System administrator with full access"),
    MANAGER("MANAGER", "Manager", "Manager with limited administrative access"),
    USER("USER", "Regular User", "Regular user with basic access");

    private final String code;
    private final String displayName;
    private final String description;

    UserRole(String code, String displayName, String description) {
        this.code = code;
        this.displayName = displayName;
        this.description = description;
    }

    public String getCode() {
        return code;
    }

    public String getDisplayName() {
        return displayName;
    }

    public String getDescription() {
        return description;
    }

    /**
     * Get UserRole by code
     * @param code role code
     * @return UserRole enum
     */
    public static UserRole fromCode(String code) {
        if (code == null) {
            return null;
        }
        for (UserRole role : values()) {
            if (role.getCode().equals(code)) {
                return role;
            }
        }
        throw new IllegalArgumentException("Unknown role code: " + code);
    }

    /**
     * Check if the code is valid
     * @param code role code
     * @return true if valid
     */
    public static boolean isValidCode(String code) {
        if (code == null) {
            return false;
        }
        for (UserRole role : values()) {
            if (role.getCode().equals(code)) {
                return true;
            }
        }
        return false;
    }
} 