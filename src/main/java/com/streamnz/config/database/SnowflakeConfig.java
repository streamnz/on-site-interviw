package com.streamnz.config.database;

import com.streamnz.util.SnowflakeIdGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Snowflake ID Generator Configuration
 * Provides distributed ID generation using Snowflake algorithm
 */
@Configuration
public class SnowflakeConfig {

    /**
     * Configure Snowflake ID generator
     * @return SnowflakeIdGenerator instance
     */
    @Bean
    public SnowflakeIdGenerator snowflakeIdGenerator() {
        // Use worker ID 1 and datacenter ID 1 for this application
        return new SnowflakeIdGenerator(1, 1);
    }
} 