package com.streamnz.model.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * Role entity class
 * Represents the roles table in the database
 */
@Data
@TableName("roles")
@Schema(description = "Role entity")
public class Role {

    @TableId(type = IdType.INPUT)
    @Schema(description = "Role ID")
    private Long id;

    @Schema(description = "Role name", example = "ADMIN")
    private String name;

    @Schema(description = "Role description")
    private String description;

    @Schema(description = "Created time")
    private LocalDateTime createdAt;

    @Schema(description = "Updated time")
    private LocalDateTime updatedAt;
} 