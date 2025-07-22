package com.streamnz.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * Resource entity class
 * Represents the resources table in the database
 */
@Data
@TableName("resources")
@Schema(description = "Resource entity")
public class Resource {

    @TableId(type = IdType.INPUT)
    @Schema(description = "Resource ID")
    private Long id;

    @Schema(description = "Resource name", example = "用户管理")
    private String name;

    @Schema(description = "Resource path", example = "/api/users/**")
    private String path;

    @Schema(description = "HTTP method", example = "GET")
    private String method;

    @Schema(description = "Resource description")
    private String description;

    @Schema(description = "Created time")
    private LocalDateTime createdAt;

    @Schema(description = "Updated time")
    private LocalDateTime updatedAt;
} 