package com.streamnz.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * Role-Resource relation entity class
 * Represents the roles_resources_r table in the database
 */
@Data
@TableName("roles_resources_r")
@Schema(description = "Role-Resource relation entity")
public class RoleResourceRelation {

    @TableId(type = IdType.INPUT)
    @Schema(description = "Relation ID")
    private Long id;

    @Schema(description = "Role ID")
    private Long roleId;

    @Schema(description = "Resource ID")
    private Long resourceId;

    @Schema(description = "Created time")
    private LocalDateTime createdAt;
} 