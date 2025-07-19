package com.streamnz.model.dto;

import lombok.Data;

import java.time.LocalDateTime;

/**
 * Data Transfer Object for User entity
 * Used to prevent sensitive information from being exposed in API responses
 */
@Data
public class UserDTO {
    
    private Long id;
    
    private String username;
    
    private String email;
    
    private String fullName;
    
    private String role;
    
    private Boolean enabled;
    
    private LocalDateTime createdAt;
    
    private LocalDateTime updatedAt;
}
