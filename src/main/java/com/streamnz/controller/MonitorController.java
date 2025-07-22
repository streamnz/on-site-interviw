package com.streamnz.controller;

import com.streamnz.model.vo.ResponseVO;
import com.zaxxer.hikari.HikariDataSource;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * System monitoring controller
 * Provides system status monitoring interfaces including database connection pool
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/monitor")
@Tag(name = "System Monitor", description = "System monitoring related interfaces")
public class MonitorController {

    private final DataSource dataSource;

    /**
     * Get database connection pool status
     */
    @GetMapping("/database/pool")
    @Operation(summary = "Get database connection pool status", description = "Returns detailed status information of the current database connection pool")
    public ResponseEntity<ResponseVO<Map<String, Object>>> getDatabasePoolStatus() {
        Map<String, Object> poolInfo = new HashMap<>();
        
        try {
            if (dataSource instanceof HikariDataSource hikariDataSource) {
                var poolMXBean = hikariDataSource.getHikariPoolMXBean();
                
                poolInfo.put("poolName", hikariDataSource.getPoolName());
                poolInfo.put("activeConnections", poolMXBean.getActiveConnections());
                poolInfo.put("idleConnections", poolMXBean.getIdleConnections());
                poolInfo.put("totalConnections", poolMXBean.getTotalConnections());
                poolInfo.put("threadsAwaitingConnection", poolMXBean.getThreadsAwaitingConnection());
                poolInfo.put("maximumPoolSize", hikariDataSource.getMaximumPoolSize());
                poolInfo.put("minimumIdle", hikariDataSource.getMinimumIdle());
                poolInfo.put("connectionTimeout", hikariDataSource.getConnectionTimeout());
                poolInfo.put("idleTimeout", hikariDataSource.getIdleTimeout());
                poolInfo.put("maxLifetime", hikariDataSource.getMaxLifetime());
                poolInfo.put("leakDetectionThreshold", hikariDataSource.getLeakDetectionThreshold());
                
                // Calculate connection pool usage percentage
                int activeConnections = poolMXBean.getActiveConnections();
                int maximumPoolSize = hikariDataSource.getMaximumPoolSize();
                double usagePercentage = (double) activeConnections / maximumPoolSize * 100;
                poolInfo.put("usagePercentage", String.format("%.2f%%", usagePercentage));
                
                // Connection pool status assessment
                String status = "healthy";
                if (usagePercentage > 80) {
                    status = "warning";
                } else if (usagePercentage > 95) {
                    status = "critical";
                }
                poolInfo.put("status", status);
                
                log.debug("Database connection pool status query successful: {}", poolInfo);
                return ResponseEntity.ok(ResponseVO.success("Connection pool status retrieved successfully", poolInfo));
            } else {
                poolInfo.put("type", "Non-HikariCP DataSource");
                poolInfo.put("className", dataSource.getClass().getSimpleName());
                return ResponseEntity.ok(ResponseVO.success("DataSource information retrieved successfully", poolInfo));
            }
        } catch (Exception e) {
            log.error("Failed to get database connection pool status", e);
            poolInfo.put("error", e.getMessage());
            return ResponseEntity.ok(ResponseVO.error(500, "Failed to get connection pool status", poolInfo));
        }
    }

    /**
     * Get system health status
     */
    @GetMapping("/health")
    @Operation(summary = "Get system health status", description = "Returns overall system health status")
    public ResponseEntity<ResponseVO<Map<String, Object>>> getSystemHealth() {
        Map<String, Object> healthInfo = new HashMap<>();
        
        try {
            // JVM information
            Runtime runtime = Runtime.getRuntime();
            Map<String, Object> jvmInfo = new HashMap<>();
            jvmInfo.put("totalMemory", runtime.totalMemory());
            jvmInfo.put("freeMemory", runtime.freeMemory());
            jvmInfo.put("usedMemory", runtime.totalMemory() - runtime.freeMemory());
            jvmInfo.put("maxMemory", runtime.maxMemory());
            jvmInfo.put("availableProcessors", runtime.availableProcessors());
            
            healthInfo.put("jvm", jvmInfo);
            
            // Database connection test
            try (var connection = dataSource.getConnection()) {
                Map<String, Object> dbInfo = new HashMap<>();
                dbInfo.put("connected", true);
                dbInfo.put("valid", connection.isValid(1));
                dbInfo.put("autoCommit", connection.getAutoCommit());
                dbInfo.put("readOnly", connection.isReadOnly());
                healthInfo.put("database", dbInfo);
            }
            
            healthInfo.put("status", "UP");
            healthInfo.put("timestamp", System.currentTimeMillis());
            
            return ResponseEntity.ok(ResponseVO.success("System health status retrieved successfully", healthInfo));
        } catch (Exception e) {
            log.error("Failed to get system health status", e);
            healthInfo.put("status", "DOWN");
            healthInfo.put("error", e.getMessage());
            return ResponseEntity.ok(ResponseVO.error(500, "Failed to get system health status", healthInfo));
        }
    }
} 