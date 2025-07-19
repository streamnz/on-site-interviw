package com.streamnz.controller;

import com.streamnz.annotation.DateFormat;
import com.streamnz.model.vo.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Data;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.Date;

/**
 * Test controller for demonstrating custom date formatting annotations
 */
@RestController
@RequestMapping("/api/test/date-format")
@Tag(name = "Date Format Test", description = "Test endpoints for custom date formatting annotations")
public class DateFormatTestController {

    @GetMapping("/demo")
    @Operation(summary = "Demonstrate custom date formatting", 
               description = "Shows different date formatting patterns using custom annotations")
    public ApiResponse<DateDemoVO> demonstrateDateFormatting() {
        DateDemoVO demo = new DateDemoVO();
        demo.setDefaultFormat(LocalDateTime.now());
        demo.setCustomFormat(LocalDateTime.now());
        demo.setShortFormat(LocalDateTime.now());
        demo.setLongFormat(LocalDateTime.now());
        demo.setDateObject(new Date());
        
        return ApiResponse.success("Date formatting demonstration", demo);
    }

    /**
     * Demo VO with different date formatting annotations
     */
    @Data
    public static class DateDemoVO {
        
        @DateFormat // Uses default pattern: "yyyy-MM-dd HH:mm:ss"
        private LocalDateTime defaultFormat;
        
        @DateFormat(pattern = "yyyy年MM月dd日 HH:mm:ss")
        private LocalDateTime customFormat;
        
        @DateFormat(pattern = "yyyy-MM-dd")
        private LocalDateTime shortFormat;
        
        @DateFormat(pattern = "yyyy-MM-dd HH:mm:ss.SSS", timezone = "UTC")
        private LocalDateTime longFormat;
        
        @DateFormat(pattern = "yyyy/MM/dd HH:mm:ss")
        private Date dateObject;
    }
} 