package com.streamnz.model.vo;

import com.streamnz.model.entity.Resource;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * Resource View Object for API responses
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "Resource information response object")
public class ResourceVO {

    @Schema(description = "Resource ID")
    private Long id;

    @Schema(description = "Resource name")
    private String name;

    @Schema(description = "Resource path")
    private String path;

    @Schema(description = "HTTP method")
    private String method;

    @Schema(description = "Resource description")
    private String description;

    @Schema(description = "Created time")
    private LocalDateTime createdAt;

    @Schema(description = "Updated time")
    private LocalDateTime updatedAt;

    /**
     * Construct ResourceVO from Resource entity
     * @param resource Resource entity object
     */
    public ResourceVO(Resource resource) {
        if (resource != null) {
            this.id = resource.getId();
            this.name = resource.getName();
            this.path = resource.getPath();
            this.method = resource.getMethod();
            this.description = resource.getDescription();
            this.createdAt = resource.getCreatedAt();
            this.updatedAt = resource.getUpdatedAt();
        }
    }
} 