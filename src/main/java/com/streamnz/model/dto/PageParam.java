package com.streamnz.model.dto;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.Getter;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/**
 * Base pagination parameters with builder pattern and sorting support
 * @Author cheng hao
 * @Date 22/07/2025 21:36
 */
@Getter
@Schema(description = "Pagination parameters with sorting support")
public class PageParam {
    
    // 排序字段白名单映射（前端字段 -> 数据库字段）
    private static final Map<String, String> SORT_FIELD_MAPPING = new HashMap<>();
    
    static {
        SORT_FIELD_MAPPING.put("id", "id");
        SORT_FIELD_MAPPING.put("username", "username");
        SORT_FIELD_MAPPING.put("email", "email");
        SORT_FIELD_MAPPING.put("fullName", "full_name");
        SORT_FIELD_MAPPING.put("enabled", "enabled");
        SORT_FIELD_MAPPING.put("createdAt", "created_at");
        SORT_FIELD_MAPPING.put("updatedAt", "updated_at");
    }
    
    /**
     * 校验并映射排序字段
     * @param frontendField 前端传递的字段名
     * @return 数据库字段名，如果不在白名单中则返回null
     */
    private String validateAndMapSortField(String frontendField) {
        if (frontendField == null || frontendField.trim().isEmpty()) {
            return null;
        }
        return SORT_FIELD_MAPPING.get(frontendField.trim());
    }
    
    @Schema(description = "Page number (starting from 1)", example = "1")
    @Min(value = 1, message = "Page number must be greater than 0")
    private Integer pageNum = 1;
    
    @Schema(description = "Page size", example = "10")
    @Min(value = 1, message = "Page size must be greater than 0")
    @Max(value = 100, message = "Page size cannot exceed 100")
    private Integer pageSize = 10;
    
    @Schema(description = "Sort configurations")
    private List<SortParam> sorts = new ArrayList<>();

    // Protected constructor for builder pattern and inheritance
    protected PageParam() {}

    public static PageParam create() {
        return new PageParam();
    }

    public PageParam pageNum(Integer pageNum) {
        if (pageNum != null && pageNum < 1) {
            throw new IllegalArgumentException("Page number must be greater than 0");
        }
        this.pageNum = pageNum;
        return this;
    }

    public PageParam pageSize(Integer pageSize) {
        if (pageSize != null && (pageSize < 1 || pageSize > 100)) {
            throw new IllegalArgumentException("Page size must be between 1 and 100");
        }
        this.pageSize = pageSize;
        return this;
    }
    
    public PageParam addSort(String field, String order) {
        if (StringUtils.hasText(field)) {
            this.sorts.add(new SortParam(field, order));
        }
        return this;
    }
    
    public PageParam addSort(SortParam sortParam) {
        if (sortParam != null && StringUtils.hasText(sortParam.getField())) {
            this.sorts.add(sortParam);
        }
        return this;
    }
    
    public PageParam sorts(List<SortParam> sorts) {
        this.sorts = sorts != null ? sorts : new ArrayList<>();
        return this;
    }

    // Convenience methods
    public static PageParam of(Integer pageNum, Integer pageSize) {
        return create().pageNum(pageNum).pageSize(pageSize);
    }
    
    public static PageParam defaultPage() {
        return new PageParam();
    }
    
    public static PageParam withSort(Integer pageNum, Integer pageSize, String field, String order) {
        return create().pageNum(pageNum).pageSize(pageSize).addSort(field, order);
    }
    
    /**
     * Convert to MyBatis-Plus Page object with sorting
     * @param <T> Entity type
     * @return MyBatis-Plus Page object
     */
    public <T> Page<T> toMybatisPlusPage() {
        Page<T> page = new Page<>(this.pageNum, this.pageSize);
        
        // Apply sorting with field mapping and whitelist validation
        if (!sorts.isEmpty()) {
            for (SortParam sort : sorts) {
                String dbField = validateAndMapSortField(sort.getField());
                if (dbField != null) { // 只有在白名单中的字段才添加排序
                    boolean isAsc = "ASC".equalsIgnoreCase(sort.getOrder());
                    if (isAsc) {
                        page.addOrder(com.baomidou.mybatisplus.core.metadata.OrderItem.asc(dbField));
                    } else {
                        page.addOrder(com.baomidou.mybatisplus.core.metadata.OrderItem.desc(dbField));
                    }
                }
                // 如果字段不在白名单中，直接忽略该排序条件
            }
        }
        
        return page;
    }
    
    /**
     * Check if has sorting configuration
     */
    public boolean hasSorts() {
        return !sorts.isEmpty();
    }
    
    /**
     * Get first sort field (for backward compatibility)
     */
    public String getSortField() {
        return sorts.isEmpty() ? null : sorts.get(0).getField();
    }
    
    /**
     * Get first sort order (for backward compatibility)
     */
    public String getSortOrder() {
        return sorts.isEmpty() ? "DESC" : sorts.get(0).getOrder();
    }
}