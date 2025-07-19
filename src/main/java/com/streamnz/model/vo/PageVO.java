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
 * 通用分页视图对象
 * @param <T> 数据类型
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(description = "分页响应对象")
public class PageVO<T> {

    @Schema(description = "数据列表")
    private List<T> records;

    @Schema(description = "总记录数")
    private Long total;

    @Schema(description = "每页大小")
    private Long size;

    @Schema(description = "当前页码")
    private Long current;

    @Schema(description = "总页数")
    private Long pages;

    /**
     * 从MyBatis-Plus的Page对象构造PageVO
     * @param page MyBatis-Plus的Page对象
     * @param converter 数据转换函数
     * @param <R> 原始数据类型
     * @param <T> 目标数据类型
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
     * 从MyBatis-Plus的Page对象构造PageVO（无转换）
     * @param page MyBatis-Plus的Page对象
     */
    public PageVO(Page<T> page) {
        this.records = page.getRecords();
        this.total = page.getTotal();
        this.size = page.getSize();
        this.current = page.getCurrent();
        this.pages = page.getPages();
    }
} 