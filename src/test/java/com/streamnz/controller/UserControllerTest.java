package com.streamnz.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.streamnz.model.dto.UserCreateDTO;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.dto.UserUpdateDTO;
import com.streamnz.model.po.User;
import com.streamnz.model.vo.UserVO;
import com.streamnz.model.vo.PageVO;
import com.streamnz.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Unit tests for UserController
 * Tests individual controller methods with mocked dependencies
 */
@ExtendWith(MockitoExtension.class)
@DisplayName("UserController Unit Tests")
class UserControllerTest {

    @Mock
    private UserService userService;

    @InjectMocks
    private UserController userController;

    private MockMvc mockMvc;
    private ObjectMapper objectMapper;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.standaloneSetup(userController).build();
        objectMapper = new ObjectMapper();
    }

    @Test
    @DisplayName("GET /api/users - Should return paginated user list")
    void getUsers_ShouldReturnPaginatedUserList() throws Exception {
        // Given
        List<User> users = Arrays.asList(
            createTestUser(1L, "user1", "user1@test.com"),
            createTestUser(2L, "user2", "user2@test.com")
        );
        Page<User> userPage = new Page<>(1L, 10L);
        userPage.setRecords(users);
        userPage.setTotal(2L);

        when(userService.pageQueryWithConditions(anyLong(), anyLong(), any(UserQueryDTO.class)))
            .thenReturn(userPage);

        // When & Then
        mockMvc.perform(get("/api/users")
                .param("current", "1")
                .param("size", "10"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.records").isArray())
            .andExpect(jsonPath("$.records.length()").value(2))
            .andExpect(jsonPath("$.total").value(2))
            .andExpect(jsonPath("$.current").value(1))
            .andExpect(jsonPath("$.size").value(10));

        verify(userService).pageQueryWithConditions(anyLong(), anyLong(), any(UserQueryDTO.class));
    }

    @Test
    @DisplayName("GET /api/users/{id} - Should return user by ID")
    void getUserById_ShouldReturnUser() throws Exception {
        // Given
        User user = createTestUser(1L, "testuser", "test@example.com");
        when(userService.findById(1L)).thenReturn(user);

        // When & Then
        mockMvc.perform(get("/api/users/1"))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(1))
            .andExpect(jsonPath("$.username").value("testuser"))
            .andExpect(jsonPath("$.email").value("test@example.com"));

        verify(userService).findById(1L);
    }

    @Test
    @DisplayName("GET /api/users/{id} - Should return 404 when user not found")
    void getUserById_ShouldReturn404_WhenUserNotFound() throws Exception {
        // Given
        when(userService.findById(999L)).thenReturn(null);

        // When & Then
        mockMvc.perform(get("/api/users/999"))
            .andExpect(status().isNotFound());

        verify(userService).findById(999L);
    }

    @Test
    @DisplayName("POST /api/users/create - Should create user successfully")
    void createUser_ShouldCreateUserSuccessfully() throws Exception {
        // Given
        UserCreateDTO createDTO = new UserCreateDTO();
        createDTO.setUsername("newuser");
        createDTO.setPassword("Password123");
        createDTO.setConfirmPassword("Password123");
        createDTO.setEmail("newuser@example.com");
        createDTO.setFullName("New User");

        User createdUser = createTestUser(1L, "newuser", "newuser@example.com");
        when(userService.createUser(any(UserCreateDTO.class))).thenReturn(createdUser);

        // When & Then
        mockMvc.perform(post("/api/users/create")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(createDTO)))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.id").value(1))
            .andExpect(jsonPath("$.username").value("newuser"))
            .andExpect(jsonPath("$.email").value("newuser@example.com"));

        verify(userService).createUser(any(UserCreateDTO.class));
    }

    @Test
    @DisplayName("POST /api/users/create - Should return 400 for invalid data")
    void createUser_ShouldReturn400_WhenInvalidData() throws Exception {
        // Given
        UserCreateDTO createDTO = new UserCreateDTO();
        createDTO.setUsername(""); // Invalid username
        createDTO.setPassword("123"); // Too short password
        createDTO.setConfirmPassword("123");
        createDTO.setEmail("invalid-email"); // Invalid email
        createDTO.setFullName(""); // Invalid full name

        // When & Then
        mockMvc.perform(post("/api/users/create")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(createDTO)))
            .andExpect(status().isBadRequest());

        // Verify that service method is not called due to validation failure
        verify(userService, never()).createUser(any(UserCreateDTO.class));
    }

    @Test
    @DisplayName("PUT /api/users/update - Should update user successfully")
    void updateUser_ShouldUpdateUserSuccessfully() throws Exception {
        // Given
        UserUpdateDTO updateDTO = new UserUpdateDTO();
        updateDTO.setId(1L);
        updateDTO.setEmail("updated@example.com");
        updateDTO.setFullName("Updated User");

        User updatedUser = createTestUser(1L, "testuser", "updated@example.com");
        updatedUser.setFullName("Updated User");
        when(userService.updateUser(any(UserUpdateDTO.class))).thenReturn(updatedUser);

        // When & Then
        mockMvc.perform(put("/api/users/update")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(updateDTO)))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.id").value(1))
            .andExpect(jsonPath("$.email").value("updated@example.com"))
            .andExpect(jsonPath("$.fullName").value("Updated User"));

        verify(userService).updateUser(any(UserUpdateDTO.class));
    }

    @Test
    @DisplayName("PUT /api/users/update - Should return 404 when user not found")
    void updateUser_ShouldReturn404_WhenUserNotFound() throws Exception {
        // Given
        UserUpdateDTO updateDTO = new UserUpdateDTO();
        updateDTO.setId(999L);
        updateDTO.setEmail("updated@example.com");

        when(userService.updateUser(any(UserUpdateDTO.class))).thenReturn(null);

        // When & Then
        mockMvc.perform(put("/api/users/update")
                .contentType(MediaType.APPLICATION_JSON)
                .content(objectMapper.writeValueAsString(updateDTO)))
            .andExpect(status().isNotFound());

        verify(userService).updateUser(any(UserUpdateDTO.class));
    }

    @Test
    @DisplayName("DELETE /api/users/{id} - Should delete user successfully")
    void deleteUser_ShouldDeleteUserSuccessfully() throws Exception {
        // Given
        when(userService.deleteUser(1L)).thenReturn(true);

        // When & Then
        mockMvc.perform(delete("/api/users/1"))
            .andExpect(status().isNoContent());

        verify(userService).deleteUser(1L);
    }

    @Test
    @DisplayName("DELETE /api/users/{id} - Should return 404 when user not found")
    void deleteUser_ShouldReturn404_WhenUserNotFound() throws Exception {
        // Given
        when(userService.deleteUser(999L)).thenReturn(false);

        // When & Then
        mockMvc.perform(delete("/api/users/999"))
            .andExpect(status().isNotFound());

        verify(userService).deleteUser(999L);
    }

    @Test
    @DisplayName("POST /api/users/pageQuery - Should return filtered users")
    void pageQuery_ShouldReturnFilteredUsers() throws Exception {
        // Given
        UserQueryDTO queryDTO = new UserQueryDTO();
        queryDTO.setUsername("test");
        queryDTO.setEmail("test@example.com");

        List<User> users = Arrays.asList(
            createTestUser(1L, "testuser1", "test1@example.com"),
            createTestUser(2L, "testuser2", "test2@example.com")
        );
        Page<User> userPage = new Page<>(1L, 10L);
        userPage.setRecords(users);
        userPage.setTotal(2L);

        when(userService.pageQueryWithConditions(anyLong(), anyLong(), any(UserQueryDTO.class)))
            .thenReturn(userPage);

        // When & Then
        mockMvc.perform(post("/api/users/pageQuery")
                .contentType(MediaType.APPLICATION_JSON)
                .param("current", "1")
                .param("size", "10")
                .content(objectMapper.writeValueAsString(queryDTO)))
            .andExpect(status().isOk())
            .andExpect(jsonPath("$.records").isArray())
            .andExpect(jsonPath("$.records.length()").value(2))
            .andExpect(jsonPath("$.total").value(2));

        verify(userService).pageQueryWithConditions(anyLong(), anyLong(), any(UserQueryDTO.class));
    }

    // Helper method to create test user
    private User createTestUser(Long id, String username, String email) {
        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setPassword("encodedPassword");
        user.setEmail(email);
        user.setFullName("Test User");
        user.setRole("USER");
        user.setEnabled(true);
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());
        return user;
    }
} 