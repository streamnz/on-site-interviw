package com.streamnz.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * User-Role relation entity class
 * Represents the user_roles_r table in the database
 */
@Data
@TableName("user_roles_r")
@Schema(description = "User-Role relation entity")
public class UserRoleRelation {

    @TableId(type = IdType.INPUT)
    @Schema(description = "Relation ID")
    private Long id;

    @Schema(description = "User ID")
    private Long userId;

    @Schema(description = "Role ID")
    private Long roleId;

    @Schema(description = "Created time")
    private LocalDateTime createdAt;
} 