package com.streamnz.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.streamnz.model.po.User;
import com.streamnz.model.dto.UserQueryDTO;

import java.util.List;

/**
 * Service interface for User-related operations
 */
public interface UserService {

    /**
     * Conditional page query for users
     * @param current Current page number (starting from 1)
     * @param size Number of records per page
     * @param queryDTO Query conditions
     * @return Page object containing users and pagination info
     */
    Page<User> pageQueryWithConditions(Long current, Long size, UserQueryDTO queryDTO);

    /**
     * Find user by ID
     * @param id User ID
     * @return User object if found, null otherwise
     */
    User findById(Long id);

    /**
     * Find user by username
     * @param username Username to search for
     * @return User object if found, null otherwise
     */
    User findByUsername(String username);

    /**
     * Create a new user
     * @param user User object to create
     * @return Created user with ID populated
     */
    User createUser(User user);

    /**
     * Update an existing user
     * @param id User ID to update
     * @param user User object with updated fields
     * @return Updated user
     */
    User updateUser(Long id, User user);

    /**
     * Delete a user by ID
     * @param id User ID to delete
     * @return true if deleted, false otherwise
     */
    boolean deleteUser(Long id);
}
