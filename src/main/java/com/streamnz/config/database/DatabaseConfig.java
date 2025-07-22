package com.streamnz.config.database;

import com.zaxxer.hikari.HikariDataSource;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.event.EventListener;
import org.springframework.boot.context.event.ApplicationReadyEvent;

import javax.sql.DataSource;

/**
 * Database configuration class
 * Provides connection pool monitoring and health check functionality
 */
@Slf4j
@Configuration
public class DatabaseConfig {

    /**
     * Database connection pool health check
     */
    @Bean
    public HealthIndicator databaseHealthIndicator(DataSource dataSource) {
        return new DatabaseHealthIndicator(dataSource);
    }

    /**
     * Print connection pool information after application startup
     */
    @EventListener(ApplicationReadyEvent.class)
    public void logConnectionPoolInfo(ApplicationReadyEvent event) {
        DataSource dataSource = event.getApplicationContext().getBean(DataSource.class);
        if (dataSource instanceof HikariDataSource hikariDataSource) {
            log.info("=== HikariCP Connection Pool Configuration ===");
            log.info("Pool Name: {}", hikariDataSource.getPoolName());
            log.info("Maximum Pool Size: {}", hikariDataSource.getMaximumPoolSize());
            log.info("Minimum Idle: {}", hikariDataSource.getMinimumIdle());
            log.info("Connection Timeout: {}ms", hikariDataSource.getConnectionTimeout());
            log.info("Idle Timeout: {}ms", hikariDataSource.getIdleTimeout());
            log.info("Max Lifetime: {}ms", hikariDataSource.getMaxLifetime());
            log.info("Connection Test Query: {}", hikariDataSource.getConnectionTestQuery());
            log.info("================================================");
        }
    }

    /**
     * Database health check implementation
     */
    public static class DatabaseHealthIndicator implements HealthIndicator {

        private final DataSource dataSource;

        public DatabaseHealthIndicator(DataSource dataSource) {
            this.dataSource = dataSource;
        }

        @Override
        public Health health() {
            try {
                if (dataSource instanceof HikariDataSource hikariDataSource) {
                    var poolMXBean = hikariDataSource.getHikariPoolMXBean();
                    
                    if (poolMXBean != null) {
                        return Health.up()
                                .withDetail("poolName", hikariDataSource.getPoolName())
                                .withDetail("activeConnections", poolMXBean.getActiveConnections())
                                .withDetail("idleConnections", poolMXBean.getIdleConnections())
                                .withDetail("totalConnections", poolMXBean.getTotalConnections())
                                .withDetail("threadsAwaitingConnection", poolMXBean.getThreadsAwaitingConnection())
                                .withDetail("maximumPoolSize", hikariDataSource.getMaximumPoolSize())
                                .withDetail("minimumIdle", hikariDataSource.getMinimumIdle())
                                .build();
                    } else {
                        return Health.up()
                                .withDetail("poolName", hikariDataSource.getPoolName())
                                .withDetail("maximumPoolSize", hikariDataSource.getMaximumPoolSize())
                                .withDetail("minimumIdle", hikariDataSource.getMinimumIdle())
                                .withDetail("status", "Pool not yet initialized")
                                .build();
                    }
                }
                
                // For non-HikariCP datasources, perform simple connection test
                try (var connection = dataSource.getConnection()) {
                    return Health.up()
                            .withDetail("database", "Connected")
                            .withDetail("connectionValid", connection.isValid(1))
                            .build();
                }
            } catch (Exception e) {
                log.error("Database health check failed", e);
                return Health.down()
                        .withDetail("error", e.getMessage())
                        .withException(e)
                        .build();
            }
        }
    }
} 