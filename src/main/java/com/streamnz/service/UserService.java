package com.streamnz.service;

import com.streamnz.model.dto.UserCreateDTO;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.dto.UserUpdateDTO;
import com.streamnz.model.po.User;
import com.streamnz.model.vo.PageVO;
import com.streamnz.model.vo.UserVO;

/**
 * User service interface
 * Defines business operations for user management
 */
public interface UserService {

    /**
     * Search users with conditions and pagination
     * @param queryDTO Query conditions
     * @return PageVO of UserVO
     */
    PageVO<UserVO> pageQueryWithConditions(UserQueryDTO queryDTO);

    /**
     * Find user by username
     * @param username Username
     * @return User object or null if not found
     */
    User findByUsername(String username);

    /**
     * Find user by email
     * @param email email
     * @return User object or null if not found
     */
    User findByEmail(String email);

    /**
     * Create a user with DTO validation
     * @param createDTO User creation DTO
     * @return Created user
     */
    UserVO createUser(UserCreateDTO createDTO);

    /**
     * Update user with DTO validation
     * @param updateDTO User update DTO
     * @return Updated user or null if not found
     */
    UserVO updateUser(UserUpdateDTO updateDTO);


    /**
     * Delete user by ID
     * @param id User ID
     * @return true if deleted, false if not found
     */
    boolean disableUser(Long id);
}
