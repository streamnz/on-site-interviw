package com.streamnz.config;

import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.util.IdUtil;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Snowflake ID Generator Configuration
 * Uses Hutool's Snowflake implementation for distributed unique ID generation
 */
@Configuration
public class SnowflakeConfig {

    /**
     * Configure Snowflake ID generator using Hutool
     * @return Snowflake instance with workerId=1 and datacenterId=1
     */
    @Bean
    public Snowflake snowflake() {
        // Use worker ID 1 and datacenter ID 1 for this application instance
        return IdUtil.getSnowflake(1, 1);
    }
} 