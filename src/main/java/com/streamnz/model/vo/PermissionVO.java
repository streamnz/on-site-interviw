package com.streamnz.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Permission check response object
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "权限检查响应对象")
public class PermissionVO {

    @Schema(description = "用户ID")
    private Long userId;

    @Schema(description = "HTTP方法")
    private String method;

    @Schema(description = "请求路径")
    private String path;

    @Schema(description = "是否有权限")
    private Boolean hasPermission;

    @Schema(description = "权限检查时间戳")
    private Long checkTime;

    public PermissionVO(Long userId, String method, String path, Boolean hasPermission) {
        this.userId = userId;
        this.method = method;
        this.path = path;
        this.hasPermission = hasPermission;
        this.checkTime = System.currentTimeMillis();
    }
} 