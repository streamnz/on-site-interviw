package com.streamnz.config;

import org.springframework.stereotype.Component;

import java.util.concurrent.atomic.AtomicLong;

/**
 * Snowflake ID Generator Implementation
 * Generates distributed unique IDs using Snowflake algorithm
 * 
 * ID structure (64 bits):
 * - 1 bit: sign bit (always 0)
 * - 41 bits: timestamp (milliseconds since epoch)
 * - 10 bits: worker ID (5 bits) + datacenter ID (5 bits)
 * - 12 bits: sequence number
 */
@Component
public class SnowflakeIdGenerator {

    // Epoch start time (2023-01-01 00:00:00 UTC)
    private static final long EPOCH = 1672531200000L;
    
    // Bit lengths
    private static final long WORKER_ID_BITS = 5L;
    private static final long DATACENTER_ID_BITS = 5L;
    private static final long SEQUENCE_BITS = 12L;
    
    // Maximum values
    private static final long MAX_WORKER_ID = ~(-1L << WORKER_ID_BITS);
    private static final long MAX_DATACENTER_ID = ~(-1L << DATACENTER_ID_BITS);
    private static final long MAX_SEQUENCE = ~(-1L << SEQUENCE_BITS);
    
    // Bit shifts
    private static final long WORKER_ID_SHIFT = SEQUENCE_BITS;
    private static final long DATACENTER_ID_SHIFT = SEQUENCE_BITS + WORKER_ID_BITS;
    private static final long TIMESTAMP_SHIFT = SEQUENCE_BITS + WORKER_ID_BITS + DATACENTER_ID_BITS;
    
    private final long workerId;
    private final long datacenterId;
    private final AtomicLong sequence = new AtomicLong(0L);
    private volatile long lastTimestamp = -1L;
    
    /**
     * Constructor
     * @param workerId Worker ID (0-31)
     * @param datacenterId Datacenter ID (0-31)
     */
    public SnowflakeIdGenerator(long workerId, long datacenterId) {
        if (workerId > MAX_WORKER_ID || workerId < 0) {
            throw new IllegalArgumentException("Worker ID must be between 0 and " + MAX_WORKER_ID);
        }
        if (datacenterId > MAX_DATACENTER_ID || datacenterId < 0) {
            throw new IllegalArgumentException("Datacenter ID must be between 0 and " + MAX_DATACENTER_ID);
        }
        
        this.workerId = workerId;
        this.datacenterId = datacenterId;
    }
    
    /**
     * Generate next unique ID
     * @return Unique ID
     */
    public synchronized long nextId() {
        long timestamp = System.currentTimeMillis();
        
        // Handle clock moving backwards
        if (timestamp < lastTimestamp) {
            throw new RuntimeException("Clock moved backwards. Refusing to generate ID for " + 
                                   (lastTimestamp - timestamp) + " milliseconds");
        }
        
        // Handle same timestamp
        if (timestamp == lastTimestamp) {
            long sequenceValue = sequence.incrementAndGet() & MAX_SEQUENCE;
            if (sequenceValue == 0) {
                // Sequence overflow, wait for next millisecond
                timestamp = waitForNextMillis(lastTimestamp);
            }
        } else {
            // New timestamp, reset sequence
            sequence.set(0L);
        }
        
        lastTimestamp = timestamp;
        
        return ((timestamp - EPOCH) << TIMESTAMP_SHIFT) |
               (datacenterId << DATACENTER_ID_SHIFT) |
               (workerId << WORKER_ID_SHIFT) |
               sequence.get();
    }
    
    /**
     * Wait for next millisecond if sequence overflow
     * @param lastTimestamp Last timestamp
     * @return Next timestamp
     */
    private long waitForNextMillis(long lastTimestamp) {
        long timestamp = System.currentTimeMillis();
        while (timestamp <= lastTimestamp) {
            timestamp = System.currentTimeMillis();
        }
        return timestamp;
    }
    
    /**
     * Parse ID to extract components
     * @param id Snowflake ID
     * @return ID components
     */
    public IdComponents parseId(long id) {
        long timestamp = (id >> TIMESTAMP_SHIFT) + EPOCH;
        long datacenterId = (id >> DATACENTER_ID_SHIFT) & MAX_DATACENTER_ID;
        long workerId = (id >> WORKER_ID_SHIFT) & MAX_WORKER_ID;
        long sequence = id & MAX_SEQUENCE;
        
        return new IdComponents(timestamp, datacenterId, workerId, sequence);
    }
    
    /**
     * ID components for debugging
     */
    public static class IdComponents {
        private final long timestamp;
        private final long datacenterId;
        private final long workerId;
        private final long sequence;
        
        public IdComponents(long timestamp, long datacenterId, long workerId, long sequence) {
            this.timestamp = timestamp;
            this.datacenterId = datacenterId;
            this.workerId = workerId;
            this.sequence = sequence;
        }
        
        public long getTimestamp() { return timestamp; }
        public long getDatacenterId() { return datacenterId; }
        public long getWorkerId() { return workerId; }
        public long getSequence() { return sequence; }
        
        @Override
        public String toString() {
            return String.format("IdComponents{timestamp=%d, datacenterId=%d, workerId=%d, sequence=%d}", 
                               timestamp, datacenterId, workerId, sequence);
        }
    }
} 