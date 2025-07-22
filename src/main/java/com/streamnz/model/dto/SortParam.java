package com.streamnz.model.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Sort parameter for pagination queries
 * @Author cheng hao
 * @Date 22/07/2025 21:36
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "Sort parameter")
public class SortParam {
    
    @Schema(description = "Sort field name", example = "createdAt")
    @NotBlank(message = "Sort field cannot be blank")
    private String field;
    
    @Schema(description = "Sort order (ASC/DESC)", example = "DESC", defaultValue = "DESC")
    @Pattern(regexp = "^(ASC|DESC)$", flags = Pattern.Flag.CASE_INSENSITIVE, 
             message = "Sort order must be ASC or DESC")
    private String order = "DESC";
    
    /**
     * Create ascending sort
     */
    public static SortParam asc(String field) {
        return new SortParam(field, "ASC");
    }
    
    /**
     * Create descending sort
     */
    public static SortParam desc(String field) {
        return new SortParam(field, "DESC");
    }
    
    /**
     * Check if sort order is ascending
     */
    public boolean isAsc() {
        return "ASC".equalsIgnoreCase(order);
    }
    
    /**
     * Check if sort order is descending
     */
    public boolean isDesc() {
        return "DESC".equalsIgnoreCase(order);
    }
} 