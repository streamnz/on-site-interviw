package com.streamnz.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.streamnz.model.po.User;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.dto.UserCreateDTO;
import com.streamnz.model.dto.UserUpdateDTO;

/**
 * User service interface
 * Defines business operations for user management
 */
public interface UserService {

    /**
     * Search users with conditions and pagination
     * @param current Current page number
     * @param size Page size
     * @param queryDTO Query conditions
     * @return Page of users
     */
    Page<User> pageQueryWithConditions(Long current, Long size, UserQueryDTO queryDTO);

    /**
     * Find user by ID
     * @param id User ID
     * @return User object or null if not found
     */
    User findById(Long id);

    /**
     * Find user by username
     * @param username Username
     * @return User object or null if not found
     */
    User findByUsername(String username);

    /**
     * Create user with DTO validation
     * @param createDTO User creation DTO
     * @return Created user
     */
    User createUser(UserCreateDTO createDTO);

    /**
     * Create user (legacy method)
     * @param user User object
     * @return Created user
     */
    User createUser(User user);

    /**
     * Update user with DTO validation
     * @param updateDTO User update DTO
     * @return Updated user or null if not found
     */
    User updateUser(UserUpdateDTO updateDTO);

    /**
     * Update user (legacy method)
     * @param id User ID
     * @param user User object
     * @return Updated user or null if not found
     */
    User updateUser(Long id, User user);

    /**
     * Delete user by ID
     * @param id User ID
     * @return true if deleted, false if not found
     */
    boolean deleteUser(Long id);
}
