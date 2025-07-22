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
    @Operation(summary = "Date Format Demo", description = "Demonstrate custom date formatting")
    public ApiResponse<DateDemoResponse> dateFormatDemo() {
        LocalDateTime now = LocalDateTime.now();
        return ApiResponse.success("Date format demo", new DateDemoResponse(now));
    }

    /**
     * Response class for date format demo
     */
    public static class DateDemoResponse {
        @DateFormat(pattern = "yyyy-MM-dd HH:mm:ss")
        private LocalDateTime timestamp;

        public DateDemoResponse(LocalDateTime timestamp) {
            this.timestamp = timestamp;
        }

        public LocalDateTime getTimestamp() {
            return timestamp;
        }

        public void setTimestamp(LocalDateTime timestamp) {
            this.timestamp = timestamp;
        }
    }
} 