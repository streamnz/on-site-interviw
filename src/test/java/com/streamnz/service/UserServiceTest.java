package com.streamnz.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.streamnz.util.SnowflakeIdGenerator;
import com.streamnz.mapper.UserMapper;
import com.streamnz.model.dto.request.UserCreateDTO;
import com.streamnz.model.dto.request.UserQueryDTO;
import com.streamnz.model.dto.request.UserUpdateDTO;
import com.streamnz.model.entity.User;
import com.streamnz.service.impl.UserServiceImpl;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * Unit tests for UserService
 * Tests business logic with mocked dependencies
 */
@ExtendWith(MockitoExtension.class)
@DisplayName("UserService Unit Tests")
class UserServiceTest {

    @Mock
    private UserMapper userMapper;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private SnowflakeIdGenerator snowflakeIdGenerator;

    @InjectMocks
    private UserServiceImpl userService;

    @BeforeEach
    void setUp() {
        // Setup will be done in individual tests as needed
    }

    @Test
    @DisplayName("Should create user successfully")
    void createUser_ShouldCreateUserSuccessfully() {
        // Given
        UserCreateDTO createDTO = new UserCreateDTO();
        createDTO.setUsername("testuser");
        createDTO.setPassword("Password123");
        createDTO.setConfirmPassword("Password123");
        createDTO.setEmail("test@example.com");
        createDTO.setFullName("Test User");

        User expectedUser = createTestUser(123456789L, "testuser", "test@example.com");
        when(userMapper.selectOne(any())).thenReturn(null); // No existing user
        when(userMapper.insert(any(User.class))).thenReturn(1);

        // When
        User result = userService.createUser(createDTO);

        // Then
        assertNotNull(result);
        assertEquals("testuser", result.getUsername());
        assertEquals("test@example.com", result.getEmail());
        assertEquals("Test User", result.getFullName());
        assertTrue(result.getEnabled());

        verify(passwordEncoder).encode("Password123");
        verify(snowflakeIdGenerator).nextId();
        verify(userMapper).insert(any(User.class));
    }

    @Test
    @DisplayName("Should throw exception when username already exists")
    void createUser_ShouldThrowException_WhenUsernameExists() {
        // Given
        UserCreateDTO createDTO = new UserCreateDTO();
        createDTO.setUsername("existinguser");
        createDTO.setPassword("Password123");
        createDTO.setConfirmPassword("Password123");
        createDTO.setEmail("test@example.com");
        createDTO.setFullName("Test User");

        // Mock existing user found by username
        when(userMapper.selectOne(any())).thenReturn(createTestUser(1L, "existinguser", "test@example.com"));

        // When & Then
        assertThrows(IllegalArgumentException.class, () -> userService.createUser(createDTO));
        verify(userMapper).selectOne(any());
        verify(userMapper, never()).insert(any(User.class));
    }

    @Test
    @DisplayName("Should throw exception when email already exists")
    void createUser_ShouldThrowException_WhenEmailExists() {
        // Given
        UserCreateDTO createDTO = new UserCreateDTO();
        createDTO.setUsername("newuser");
        createDTO.setPassword("Password123");
        createDTO.setConfirmPassword("Password123");
        createDTO.setEmail("existing@example.com");
        createDTO.setFullName("Test User");

        // Mock no user found by username, but existing user found by email
        when(userMapper.selectOne(any())).thenReturn(null, createTestUser(1L, "otheruser", "existing@example.com"));

        // When & Then
        assertThrows(IllegalArgumentException.class, () -> userService.createUser(createDTO));
        verify(userMapper, times(2)).selectOne(any());
        verify(userMapper, never()).insert(any(User.class));
    }

    @Test
    @DisplayName("Should update user successfully")
    void updateUser_ShouldUpdateUserSuccessfully() {
        // Given
        UserUpdateDTO updateDTO = new UserUpdateDTO();
        updateDTO.setId(1L);
        updateDTO.setEmail("updated@example.com");
        updateDTO.setFullName("Updated User");

        User existingUser = createTestUser(1L, "testuser", "old@example.com");
        when(userMapper.selectById(1L)).thenReturn(existingUser);
        when(userMapper.updateById(any(User.class))).thenReturn(1);

        // When
        User result = userService.updateUser(updateDTO);

        // Then
        assertNotNull(result);
        assertEquals("updated@example.com", result.getEmail());
        assertEquals("Updated User", result.getFullName());
        assertNotNull(result.getUpdatedAt());

        verify(userMapper).selectById(1L);
        verify(userMapper).updateById(any(User.class));
    }

    @Test
    @DisplayName("Should return null when user not found for update")
    void updateUser_ShouldReturnNull_WhenUserNotFound() {
        // Given
        UserUpdateDTO updateDTO = new UserUpdateDTO();
        updateDTO.setId(999L);
        updateDTO.setEmail("updated@example.com");

        when(userMapper.selectById(999L)).thenReturn(null);

        // When
        User result = userService.updateUser(updateDTO);

        // Then
        assertNull(result);
        verify(userMapper).selectById(999L);
        verify(userMapper, never()).updateById(any(User.class));
    }

    @Test
    @DisplayName("Should delete user successfully")
    void deleteUser_ShouldDeleteUserSuccessfully() {
        // Given
        when(userMapper.deleteById(1L)).thenReturn(1);

        // When
        boolean result = userService.deleteUser(1L);

        // Then
        assertTrue(result);
        verify(userMapper).deleteById(1L);
    }

    @Test
    @DisplayName("Should return false when user not found for deletion")
    void deleteUser_ShouldReturnFalse_WhenUserNotFound() {
        // Given
        when(userMapper.deleteById(999L)).thenReturn(0);

        // When
        boolean result = userService.deleteUser(999L);

        // Then
        assertFalse(result);
        verify(userMapper).deleteById(999L);
    }

    @Test
    @DisplayName("Should find user by ID successfully")
    void findById_ShouldFindUserSuccessfully() {
        // Given
        User expectedUser = createTestUser(1L, "testuser", "test@example.com");
        when(userMapper.selectById(1L)).thenReturn(expectedUser);

        // When
        User result = userService.findById(1L);

        // Then
        assertNotNull(result);
        assertEquals("testuser", result.getUsername());
        assertEquals("test@example.com", result.getEmail());
        verify(userMapper).selectById(1L);
    }

    @Test
    @DisplayName("Should return null when user not found by ID")
    void findById_ShouldReturnNull_WhenUserNotFound() {
        // Given
        when(userMapper.selectById(999L)).thenReturn(null);

        // When
        User result = userService.findById(999L);

        // Then
        assertNull(result);
        verify(userMapper).selectById(999L);
    }

    @Test
    @DisplayName("Should return paginated users with conditions")
    void pageQueryWithConditions_ShouldReturnPaginatedUsers() {
        // Given
        UserQueryDTO queryDTO = new UserQueryDTO();
        queryDTO.setUsername("test");
        queryDTO.setEmail("test.com");

        List<User> users = Arrays.asList(
            createTestUser(1L, "testuser1", "test1@example.com"),
            createTestUser(2L, "testuser2", "test2@example.com")
        );
        Page<User> expectedPage = new Page<>(1L, 10L);
        expectedPage.setRecords(users);
        expectedPage.setTotal(2L);

        when(userMapper.selectPage(any(Page.class), any())).thenReturn(expectedPage);

        // When
        Page<User> result = userService.pageQueryWithConditions(1L, 10L, queryDTO);

        // Then
        assertNotNull(result);
        assertEquals(2, result.getRecords().size());
        assertEquals(2L, result.getTotal());
        assertEquals(1L, result.getCurrent());
        assertEquals(10L, result.getSize());

        verify(userMapper).selectPage(any(Page.class), any());
    }

    @Test
    @DisplayName("Should return paginated users without conditions")
    void pageQueryWithConditions_ShouldReturnPaginatedUsers_WithoutConditions() {
        // Given
        List<User> users = Arrays.asList(
            createTestUser(1L, "user1", "user1@example.com"),
            createTestUser(2L, "user2", "user2@example.com")
        );
        Page<User> expectedPage = new Page<>(1L, 10L);
        expectedPage.setRecords(users);
        expectedPage.setTotal(2L);

        when(userMapper.selectPage(any(Page.class), any())).thenReturn(expectedPage);

        // When
        Page<User> result = userService.pageQueryWithConditions(1L, 10L, null);

        // Then
        assertNotNull(result);
        assertEquals(2, result.getRecords().size());
        assertEquals(2L, result.getTotal());

        verify(userMapper).selectPage(any(Page.class), any());
    }

    // Helper method to create test user
    private User createTestUser(Long id, String username, String email) {
        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setPassword("encodedPassword");
        user.setEmail(email);
        user.setFullName("Test User");
        user.setEnabled(true);
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());
        return user;
    }
} 