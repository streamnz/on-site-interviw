package com.streamnz.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import jakarta.validation.constraints.*;

/**
 * 用户更新DTO
 * 用于封装更新用户时的请求参数
 */
@Data
@Schema(description = "用户更新请求参数")
public class UserUpdateDTO {

    @Schema(description = "用户ID", example = "1", required = true)
    @NotNull(message = "用户ID不能为空")
    @Min(value = 1, message = "用户ID必须大于0")
    private Long id;

    @Schema(description = "用户名", example = "john_doe")
    @Size(min = 3, max = 50, message = "用户名长度必须在3-50个字符之间")
    @Pattern(regexp = "^[a-zA-Z0-9_]+$", message = "用户名只能包含字母、数字和下划线")
    private String username;

    @Schema(description = "密码", example = "newPassword123")
    @Size(min = 6, max = 100, message = "密码长度必须在6-100个字符之间")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d@$!%*?&]{6,}$", 
             message = "密码必须包含至少一个小写字母、一个大写字母和一个数字")
    private String password;

    @Schema(description = "确认密码", example = "newPassword123")
    private String confirmPassword;

    @Schema(description = "邮箱", example = "john.doe@example.com")
    @Email(message = "邮箱格式不正确")
    @Size(max = 100, message = "邮箱长度不能超过100个字符")
    private String email;

    @Schema(description = "全名", example = "John Doe")
    @Size(min = 2, max = 100, message = "全名长度必须在2-100个字符之间")
    @Pattern(regexp = "^[\\u4e00-\\u9fa5a-zA-Z\\s]+$", message = "全名只能包含中文、英文和空格")
    private String fullName;

    @Schema(description = "用户角色", example = "USER")
    @Pattern(regexp = "^(ADMIN|MANAGER|USER)$", message = "角色只能是ADMIN、MANAGER或USER")
    private String role;

    @Schema(description = "启用状态", example = "true")
    private Boolean enabled;

    /**
     * 自定义校验：密码确认（仅在密码不为空时校验）
     */
    @AssertTrue(message = "密码和确认密码不匹配")
    public boolean isPasswordConfirmed() {
        // 如果密码为空，则不需要确认密码
        if (password == null || password.trim().isEmpty()) {
            return true;
        }
        // 如果密码不为空，则确认密码也不能为空
        if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
            return false;
        }
        return password.equals(confirmPassword);
    }

    /**
     * 自定义校验：用户名不能包含敏感词
     */
    @AssertTrue(message = "用户名包含敏感词，请更换")
    public boolean isUsernameNotSensitive() {
        if (username == null || username.trim().isEmpty()) {
            return true;
        }
        String lowerUsername = username.toLowerCase();
        String[] sensitiveWords = {"admin", "root", "system", "test", "guest"};
        for (String word : sensitiveWords) {
            if (lowerUsername.contains(word)) {
                return false;
            }
        }
        return true;
    }

    /**
     * 自定义校验：邮箱域名检查
     */
    @AssertTrue(message = "邮箱域名不被支持")
    public boolean isEmailDomainValid() {
        if (email == null || email.trim().isEmpty()) {
            return true;
        }
        if (!email.contains("@")) {
            return false;
        }
        String[] validDomains = {"gmail.com", "yahoo.com", "hotmail.com", "outlook.com", "example.com"};
        String domain = email.substring(email.indexOf("@") + 1);
        for (String validDomain : validDomains) {
            if (domain.equals(validDomain)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 自定义校验：至少有一个字段被更新（除了ID）
     */
    @AssertTrue(message = "至少需要提供一个要更新的字段")
    public boolean hasAtLeastOneField() {
        return (username != null && !username.trim().isEmpty()) ||
               (password != null && !password.trim().isEmpty()) ||
               (email != null && !email.trim().isEmpty()) ||
               (fullName != null && !fullName.trim().isEmpty()) ||
               (role != null && !role.trim().isEmpty()) ||
               (enabled != null);
    }

    /**
     * 自定义校验：不能同时更新用户名和邮箱为空
     */
    @AssertTrue(message = "用户名和邮箱不能同时为空")
    public boolean isUsernameOrEmailProvided() {
        boolean hasUsername = username != null && !username.trim().isEmpty();
        boolean hasEmail = email != null && !email.trim().isEmpty();
        return hasUsername || hasEmail;
    }

    /**
     * 检查是否有任何字段被设置（除了ID）
     */
    public boolean hasAnyField() {
        return (username != null && !username.trim().isEmpty()) ||
               (password != null && !password.trim().isEmpty()) ||
               (email != null && !email.trim().isEmpty()) ||
               (fullName != null && !fullName.trim().isEmpty()) ||
               (role != null && !role.trim().isEmpty()) ||
               (enabled != null);
    }

    /**
     * 获取非空字段数量（不包括ID）
     */
    public int getNonEmptyFieldCount() {
        int count = 0;
        if (username != null && !username.trim().isEmpty()) count++;
        if (password != null && !password.trim().isEmpty()) count++;
        if (email != null && !email.trim().isEmpty()) count++;
        if (fullName != null && !fullName.trim().isEmpty()) count++;
        if (role != null && !role.trim().isEmpty()) count++;
        if (enabled != null) count++;
        return count;
    }
} 