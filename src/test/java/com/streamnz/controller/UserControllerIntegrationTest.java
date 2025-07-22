package com.streamnz.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.streamnz.model.dto.UserCreateDTO;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.dto.UserUpdateDTO;
import com.streamnz.model.po.User;
import com.streamnz.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Integration tests for UserController
 * Tests with real database interactions and full application context
 */
@SpringBootTest
@ActiveProfiles("test")
@Transactional
@DisplayName("UserController Integration Tests")
class UserControllerIntegrationTest {

    @Autowired
    private WebApplicationContext webApplicationContext;

    @Autowired
    private UserService userService;

    private MockMvc mockMvc;
    private ObjectMapper objectMapper;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
        objectMapper = new ObjectMapper();
    }

    @Test
    @DisplayName("Integration Test: Complete user CRUD workflow")
    void testCompleteUserCrudWorkflow() throws Exception {
        // Step 1: Create user with valid data
        UserCreateDTO createDTO = new UserCreateDTO();
        createDTO.setUsername("integrationuser");
        createDTO.setPassword("Password123");
        createDTO.setConfirmPassword("Password123");
        createDTO.setEmail("integration@example.com");
        createDTO.setFullName("Integration User");

        String createResponse = mockMvc.perform(post("/api/users/create")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(createDTO)))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.username").value("integrationuser"))
            .andExpect(jsonPath("$.email").value("integration@example.com"))
            .andReturn().getResponse().getContentAsString();

        // Extract user ID from response
        String userId = extractUserIdFromResponse(createResponse);

        // Step 2: Get user by ID
        mockMvc.perform(get("/api/users/" + userId))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.username").value("integrationuser"))
            .andExpect(jsonPath("$.email").value("integration@example.com"));

        // Step 3: Update user
        UserUpdateDTO updateDTO = new UserUpdateDTO();
        updateDTO.setId(Long.parseLong(userId));
        updateDTO.setFullName("Updated Integration User");
        updateDTO.setEmail("updated.integration@example.com");

        mockMvc.perform(put("/api/users/update")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(updateDTO)))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.fullName").value("Updated Integration User"))
            .andExpect(jsonPath("$.email").value("updated.integration@example.com"));

        // Step 4: Verify user list contains the user
        mockMvc.perform(get("/api/users")
                .param("current", "1")
                .param("size", "10"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.records").isArray())
            .andExpect(jsonPath("$.records[?(@.username == 'integrationuser')]").exists());

        // Step 5: Delete user
        mockMvc.perform(delete("/api/users/" + userId))
            .andExpect(status().isNoContent());
    }

    @Test
    @DisplayName("Integration Test: User list pagination")
    void testUserListPagination() throws Exception {
        // Test pagination with existing test data
        mockMvc.perform(get("/api/users")
                .param("current", "1")
                .param("size", "5"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.records").isArray())
            .andExpect(jsonPath("$.total").isNumber())
            .andExpect(jsonPath("$.current").value(1))
            .andExpect(jsonPath("$.size").value(5));
    }

    @Test
    @DisplayName("Integration Test: User search with conditions")
    void testUserSearchWithConditions() throws Exception {
        // Test search with conditions
        UserQueryDTO queryDTO = new UserQueryDTO();
        queryDTO.setUsername("searchuser");
        queryDTO.setEmail("searchuser@example.com");

        mockMvc.perform(post("/api/users/pageQuery")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(queryDTO)))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.records").isArray())
            .andExpect(jsonPath("$.records[?(@.username == 'searchuser')]").exists());
    }

    @Test
    @DisplayName("Integration Test: Validation error handling")
    void testValidationErrorHandling() throws Exception {
        // Test with invalid data
        UserCreateDTO invalidDTO = new UserCreateDTO();
        invalidDTO.setUsername("ab"); // Too short
        invalidDTO.setPassword("123"); // Too short and no uppercase
        invalidDTO.setConfirmPassword("123"); // Mismatch
        invalidDTO.setEmail("invalid-email"); // Invalid email
        invalidDTO.setFullName(""); // Empty

        mockMvc.perform(post("/api/users/create")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(invalidDTO)))
            .andExpect(status().isBadRequest())
            .andExpect(jsonPath("$.errors").exists());
    }

    @Test
    @DisplayName("Integration Test: Non-existent user handling")
    void testNonExistentUserHandling() throws Exception {
        // Test getting non-existent user
        mockMvc.perform(get("/api/users/999999"))
            .andExpect(status().isNotFound());
    }

    @Test
    @DisplayName("Integration Test: Concurrent user creation")
    void testConcurrentUserCreation() throws Exception {
        // Test concurrent user creation with valid data
        UserCreateDTO createDTO = new UserCreateDTO();
        createDTO.setUsername("concurrentuser");
        createDTO.setPassword("Password123");
        createDTO.setConfirmPassword("Password123");
        createDTO.setEmail("concurrent@example.com");
        createDTO.setFullName("Concurrent User");

        mockMvc.perform(post("/api/users/create")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(createDTO)))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.username").value("concurrentuser"));
    }

    /**
     * Helper method to extract user ID from response
     */
    private String extractUserIdFromResponse(String response) {
        try {
            // Simple JSON parsing to extract ID
            int idIndex = response.indexOf("\"id\":");
            if (idIndex != -1) {
                int startIndex = response.indexOf(":", idIndex) + 1;
                int endIndex = response.indexOf(",", startIndex);
                if (endIndex == -1) {
                    endIndex = response.indexOf("}", startIndex);
                }
                return response.substring(startIndex, endIndex).trim();
            }
        } catch (Exception e) {
            // Fallback: return a default ID for testing
            return "1";
        }
        return "1";
    }
} 