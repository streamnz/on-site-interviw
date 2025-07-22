package com.streamnz.controller;

import com.streamnz.util.SnowflakeIdGenerator;
import com.streamnz.model.vo.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.v3.oas.annotations.Parameter;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * Test Controller for development and debugging
 * Provides endpoints for testing various features
 */
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/test")
@Tag(name = "Test", description = "Test endpoints for development")
public class TestController {

    private final SnowflakeIdGenerator snowflakeIdGenerator;

    @GetMapping("/hello")
    @Operation(summary = "Hello World", description = "Simple hello world endpoint")
    public ApiResponse<String> hello() {
        return ApiResponse.success("Hello World!", "Hello from User Management System API");
    }

    @GetMapping("/health")
    @Operation(summary = "Service Health Check", description = "Check if the service is running properly")
    public ApiResponse<String> health() {
        return ApiResponse.success("Service Health", "OK");
    }

    @GetMapping("/snowflake/generate")
    @Operation(summary = "Generate Snowflake ID", description = "Generate a single Snowflake ID")
    public ApiResponse<SnowflakeResponse> generateSnowflakeId() {
        long id = snowflakeIdGenerator.nextId();
        SnowflakeIdGenerator.IdComponents components = snowflakeIdGenerator.parseId(id);
        return ApiResponse.success("Snowflake ID generated successfully", new SnowflakeResponse(id, components));
    }

    @GetMapping("/snowflake/generate/batch")
    @Operation(summary = "Generate Batch Snowflake IDs", description = "Generate multiple Snowflake IDs")
    public ApiResponse<List<SnowflakeResponse>> generateBatchSnowflakeIds(
            @Parameter(description = "Number of IDs to generate", example = "5")
            @RequestParam(defaultValue = "5") int count) {
        List<SnowflakeResponse> responses = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            long id = snowflakeIdGenerator.nextId();
            SnowflakeIdGenerator.IdComponents components = snowflakeIdGenerator.parseId(id);
            responses.add(new SnowflakeResponse(id, components));
        }
        return ApiResponse.success("Batch Snowflake IDs generated successfully", responses);
    }

    @GetMapping("/snowflake/parse/{id}")
    @Operation(summary = "Parse Snowflake ID", description = "Parse a Snowflake ID into its components")
    public ApiResponse<SnowflakeResponse> parseSnowflakeId(
            @Parameter(description = "Snowflake ID to parse")
            @PathVariable Long id) {
        SnowflakeIdGenerator.IdComponents components = snowflakeIdGenerator.parseId(id);
        return ApiResponse.success("Snowflake ID parsed successfully", new SnowflakeResponse(id, components));
    }

    /**
     * Snowflake ID response wrapper
     */
    public static class SnowflakeResponse {
        private final long id;
        private final SnowflakeIdGenerator.IdComponents components;

        public SnowflakeResponse(long id, SnowflakeIdGenerator.IdComponents components) {
            this.id = id;
            this.components = components;
        }

        public long getId() { return id; }
        public SnowflakeIdGenerator.IdComponents getComponents() { return components; }
    }
} 