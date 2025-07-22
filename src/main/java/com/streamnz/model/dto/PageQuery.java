package com.streamnz.model.dto;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Generic page query wrapper that combines pagination parameters with query conditions
 * @Author cheng hao
 * @Date 22/07/2025 21:36
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "Page query wrapper with pagination and query conditions")
public class PageQuery<T> {
    
    @Schema(description = "Pagination parameters")
    @Valid
    private PageParam pageParam = PageParam.defaultPage();
    
    @Schema(description = "Query conditions")
    private T query;
    
    /**
     * Create PageQuery with default pagination
     */
    public static <T> PageQuery<T> of(T query) {
        return new PageQuery<>(PageParam.defaultPage(), query);
    }
    
    /**
     * Create PageQuery with custom pagination
     */
    public static <T> PageQuery<T> of(PageParam pageParam, T query) {
        return new PageQuery<>(pageParam != null ? pageParam : PageParam.defaultPage(), query);
    }
    
    /**
     * Create PageQuery with page number and size
     */
    public static <T> PageQuery<T> of(Integer pageNum, Integer pageSize, T query) {
        return new PageQuery<>(PageParam.of(pageNum, pageSize), query);
    }
    
    /**
     * Create PageQuery with sorting
     */
    public static <T> PageQuery<T> withSort(Integer pageNum, Integer pageSize, T query, String sortField, String sortOrder) {
        PageParam pageParam = PageParam.withSort(pageNum, pageSize, sortField, sortOrder);
        return new PageQuery<>(pageParam, query);
    }
    
    /**
     * Convert to MyBatis-Plus Page object
     */
    public <E> Page<E> toMybatisPlusPage() {
        return pageParam.toMybatisPlusPage();
    }
    
    /**
     * Get page number
     */
    public Integer getPageNum() {
        return pageParam.getPageNum();
    }
    
    /**
     * Get page size
     */
    public Integer getPageSize() {
        return pageParam.getPageSize();
    }
    
    /**
     * Check if has sorting
     */
    public boolean hasSorts() {
        return pageParam.hasSorts();
    }
    
    /**
     * Get sorts
     */
    public java.util.List<SortParam> getSorts() {
        return pageParam.getSorts();
    }
} 