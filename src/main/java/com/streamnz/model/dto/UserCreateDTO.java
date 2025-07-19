package com.streamnz.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import jakarta.validation.constraints.*;

/**
 * 用户创建DTO
 * 用于封装创建用户时的请求参数
 */
@Data
@Schema(description = "用户创建请求参数")
public class UserCreateDTO {

    @Schema(description = "用户名", example = "john_doe", required = true)
    @NotBlank(message = "用户名不能为空")
    @Size(min = 3, max = 50, message = "用户名长度必须在3-50个字符之间")
    @Pattern(regexp = "^[a-zA-Z0-9_]+$", message = "用户名只能包含字母、数字和下划线")
    private String username;

    @Schema(description = "密码", example = "password123", required = true)
    @NotBlank(message = "密码不能为空")
    @Size(min = 6, max = 100, message = "密码长度必须在6-100个字符之间")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d@$!%*?&]{6,}$", 
             message = "密码必须包含至少一个小写字母、一个大写字母和一个数字")
    private String password;

    @Schema(description = "确认密码", example = "password123", required = true)
    @NotBlank(message = "确认密码不能为空")
    private String confirmPassword;

    @Schema(description = "邮箱", example = "john.doe@example.com", required = true)
    @NotBlank(message = "邮箱不能为空")
    @Email(message = "邮箱格式不正确")
    @Size(max = 100, message = "邮箱长度不能超过100个字符")
    private String email;

    @Schema(description = "全名", example = "John Doe", required = true)
    @NotBlank(message = "全名不能为空")
    @Size(min = 2, max = 100, message = "全名长度必须在2-100个字符之间")
    @Pattern(regexp = "^[\\u4e00-\\u9fa5a-zA-Z\\s]+$", message = "全名只能包含中文、英文和空格")
    private String fullName;

    @Schema(description = "用户角色", example = "USER", defaultValue = "USER")
    @Pattern(regexp = "^(ADMIN|MANAGER|USER)$", message = "角色只能是ADMIN、MANAGER或USER")
    private String role;

    @Schema(description = "启用状态", example = "true", defaultValue = "true")
    private Boolean enabled;

    /**
     * 自定义校验：密码确认
     */
    @AssertTrue(message = "密码和确认密码不匹配")
    public boolean isPasswordConfirmed() {
        if (password == null || confirmPassword == null) {
            return false;
        }
        return password.equals(confirmPassword);
    }

    /**
     * 自定义校验：用户名不能包含敏感词
     */
    @AssertTrue(message = "用户名包含敏感词，请更换")
    public boolean isUsernameNotSensitive() {
        if (username == null) {
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
        if (email == null) {
            return true;
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
     * 设置默认值
     */
    public void setDefaults() {
        if (role == null || role.trim().isEmpty()) {
            this.role = "USER";
        }
        if (enabled == null) {
            this.enabled = true;
        }
    }
} 