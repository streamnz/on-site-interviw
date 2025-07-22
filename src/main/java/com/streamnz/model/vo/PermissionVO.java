package com.streamnz.model.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * Permission check response object
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "Permission check response object")
public class PermissionVO {

    @Schema(description = "User ID")
    private Long userId;

    @Schema(description = "HTTP method")
    private String method;

    @Schema(description = "Request path")
    private String path;

    @Schema(description = "Has permission")
    private Boolean hasPermission;

    @Schema(description = "Permission check timestamp")
    private LocalDateTime checkTime;

    public PermissionVO(Long userId, String method, String path, Boolean hasPermission) {
        this.userId = userId;
        this.method = method;
        this.path = path;
        this.hasPermission = hasPermission;
        this.checkTime = LocalDateTime.now();
    }
} 