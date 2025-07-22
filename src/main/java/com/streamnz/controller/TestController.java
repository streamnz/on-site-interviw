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

    @GetMapping("/health")
    @Operation(summary = "Health check", description = "Simple health check endpoint")
    public ApiResponse<String> health() {
        return ApiResponse.success("服务健康", "OK");
    }

    @GetMapping("/snowflake/generate")
    @Operation(summary = "Generate Snowflake ID", description = "Generate a single Snowflake ID")
    public ApiResponse<SnowflakeResponse> generateSnowflakeId() {
        long id = snowflakeIdGenerator.nextId();
        SnowflakeIdGenerator.IdComponents components = snowflakeIdGenerator.parseId(id);
        
        return ApiResponse.success("雪花ID生成成功", new SnowflakeResponse(id, components));
    }

    @GetMapping("/snowflake/generate/{count}")
    @Operation(summary = "Generate multiple Snowflake IDs", 
               description = "Generate multiple Snowflake IDs for testing")
    public ApiResponse<List<SnowflakeResponse>> generateMultipleSnowflakeIds(@PathVariable int count) {
        List<SnowflakeResponse> responses = new ArrayList<>();
        
        for (int i = 0; i < count && i < 100; i++) { // Limit to 100 for safety
            long id = snowflakeIdGenerator.nextId();
            SnowflakeIdGenerator.IdComponents components = snowflakeIdGenerator.parseId(id);
            responses.add(new SnowflakeResponse(id, components));
        }
        
        return ApiResponse.success("批量雪花ID生成成功", responses);
    }

    @GetMapping("/snowflake/parse/{id}")
    @Operation(summary = "Parse Snowflake ID", 
               description = "Parse a Snowflake ID to extract its components")
    public ApiResponse<SnowflakeResponse> parseSnowflakeId(@PathVariable long id) {
        SnowflakeIdGenerator.IdComponents components = snowflakeIdGenerator.parseId(id);
        return ApiResponse.success("雪花ID解析成功", new SnowflakeResponse(id, components));
    }

    /**
     * Response class for Snowflake ID operations
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