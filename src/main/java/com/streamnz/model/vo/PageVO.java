package com.streamnz.model.vo;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * Generic pagination view object
 * @param <T> Data type
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "Pagination response object")
public class PageVO<T> {

    @Schema(description = "Data list")
    private List<T> records;

    @Schema(description = "Total record count")
    private Long total;

    @Schema(description = "Page size")
    private Long size;

    @Schema(description = "Current page number")
    private Long current;

    @Schema(description = "Total page count")
    private Long pages;

    /**
     * Construct PageVO from MyBatis-Plus Page object
     * @param page MyBatis-Plus Page object
     * @param converter Data conversion function
     * @param <R> Original data type
     * @param <T> Target data type
     */
    public <R> PageVO(Page<R> page, Function<R, T> converter) {
        this.records = page.getRecords().stream()
                .map(converter)
                .collect(Collectors.toList());
        this.total = page.getTotal();
        this.size = page.getSize();
        this.current = page.getCurrent();
        this.pages = page.getPages();
    }

    /**
     * Construct PageVO from MyBatis-Plus Page object (no conversion)
     * @param page MyBatis-Plus Page object
     */
    public PageVO(Page<T> page) {
        this.records = page.getRecords();
        this.total = page.getTotal();
        this.size = page.getSize();
        this.current = page.getCurrent();
        this.pages = page.getPages();
    }
} 