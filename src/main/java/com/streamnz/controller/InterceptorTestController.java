package com.streamnz.controller;

import com.streamnz.model.vo.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * Test controller for demonstrating interceptor functionality
 */
@RestController
@RequestMapping("/api/test/interceptor")
@Tag(name = "Interceptor Test", description = "Test endpoints for interceptor functionality")
@Slf4j
public class InterceptorTestController {

    @GetMapping("/performance")
    @Operation(summary = "Test performance interceptor", 
               description = "This endpoint will be monitored by the performance interceptor")
    public ApiResponse<Map<String, Object>> testPerformanceInterceptor() {
        // Simulate some processing time
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        
        Map<String, Object> result = new HashMap<>();
        result.put("message", "Performance interceptor test completed");
        result.put("timestamp", System.currentTimeMillis());
        
        return ApiResponse.success("Performance interceptor test", result);
    }

    @GetMapping("/auth")
    @Operation(summary = "Test authentication interceptor", 
               description = "This endpoint requires authentication and will be checked by the auth interceptor")
    public ApiResponse<Map<String, Object>> testAuthenticationInterceptor(
            @RequestAttribute(value = "currentUser", required = false) String currentUser) {
        
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        
        Map<String, Object> result = new HashMap<>();
        result.put("message", "Authentication interceptor test completed");
        result.put("currentUser", currentUser);
        result.put("authentication", authentication != null ? authentication.getName() : "null");
        result.put("authorities", authentication != null ? authentication.getAuthorities() : "null");
        
        log.info("Authentication interceptor test - User: {}, Authorities: {}", 
                currentUser, authentication != null ? authentication.getAuthorities() : "null");
        
        return ApiResponse.success("Authentication interceptor test", result);
    }

    @GetMapping("/slow")
    @Operation(summary = "Test slow request detection", 
               description = "This endpoint simulates a slow request to test performance monitoring")
    public ApiResponse<Map<String, Object>> testSlowRequest() {
        // Simulate a slow request
        try {
            Thread.sleep(1500); // This should trigger the slow request warning
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
        
        Map<String, Object> result = new HashMap<>();
        result.put("message", "Slow request test completed");
        result.put("processingTime", "1500ms");
        
        return ApiResponse.success("Slow request test", result);
    }
} 