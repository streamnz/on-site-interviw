package com.streamnz.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.streamnz.model.po.User;
import com.streamnz.mapper.UserMapper;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.dto.UserCreateDTO;
import com.streamnz.model.dto.UserUpdateDTO;
import com.streamnz.query.UserQueryBuilder;
import com.streamnz.service.UserService;
import com.streamnz.config.SnowflakeIdGenerator;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.List;

/**
 * Implementation of UserService interface
 */
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    private final UserQueryBuilder userQueryBuilder;
    private final SnowflakeIdGenerator snowflakeIdGenerator;


    @Override
    public Page<User> pageQueryWithConditions(Long current, Long size, UserQueryDTO queryDTO) {
        Page<User> page = new Page<>(current, size);
        QueryWrapper<User> queryWrapper = userQueryBuilder.buildQueryWrapper(queryDTO);
        return userMapper.selectPage(page, queryWrapper);
    }

    // Query building logic has been migrated to UserQueryBuilder class for better maintainability and testability

    @Override
    public User findById(Long id) {
        return userMapper.selectById(id);
    }

    @Override
    public User findByUsername(String username) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        return userMapper.selectOne(queryWrapper);
    }

    @Override
    public User createUser(UserCreateDTO createDTO) {
        // Set default values
        createDTO.setDefaults();
        
        // Check username uniqueness
        User existingUser = findByUsername(createDTO.getUsername());
        if (existingUser != null) {
            throw new IllegalArgumentException("Username already exists: " + createDTO.getUsername());
        }
        
        // Check email uniqueness
        if (StringUtils.hasText(createDTO.getEmail())) {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("email", createDTO.getEmail());
            User existingEmailUser = userMapper.selectOne(queryWrapper);
            if (existingEmailUser != null) {
                throw new IllegalArgumentException("Email already exists: " + createDTO.getEmail());
            }
        }
        
        // Create user entity
        User user = new User();
        // Generate unique ID using Snowflake algorithm
        user.setId(snowflakeIdGenerator.nextId());
        user.setUsername(createDTO.getUsername());
        user.setPassword(passwordEncoder.encode(createDTO.getPassword()));
        user.setEmail(createDTO.getEmail());
        user.setFullName(createDTO.getFullName());
        user.setRole(createDTO.getRole());
        user.setEnabled(createDTO.getEnabled());
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());
        
        userMapper.insert(user);
        return user;
    }

    @Override
    public User createUser(User user) {
        // Generate unique ID using Snowflake algorithm if not provided
        if (user.getId() == null) {
            user.setId(snowflakeIdGenerator.nextId());
        }
        
        // Encode password before saving
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());

        if (user.getEnabled() == null) {
            user.setEnabled(true);
        }

        if (user.getRole() == null || user.getRole().isEmpty()) {
            user.setRole("USER");
        }

        userMapper.insert(user);
        return user;
    }

    @Override
    public User updateUser(UserUpdateDTO updateDTO) {
        User existingUser = userMapper.selectById(updateDTO.getId());
        if (existingUser == null) {
            return null;
        }
        
        // Check if any field is updated
        if (!updateDTO.hasAnyField()) {
            throw new IllegalArgumentException("At least one field must be provided for update");
        }
        
        // Check username uniqueness (if updating username)
        if (StringUtils.hasText(updateDTO.getUsername()) && 
            !updateDTO.getUsername().equals(existingUser.getUsername())) {
            User existingUsernameUser = findByUsername(updateDTO.getUsername());
            if (existingUsernameUser != null) {
                throw new IllegalArgumentException("Username already exists: " + updateDTO.getUsername());
            }
        }
        
        // Check email uniqueness (if updating email)
        if (StringUtils.hasText(updateDTO.getEmail()) && 
            !updateDTO.getEmail().equals(existingUser.getEmail())) {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("email", updateDTO.getEmail());
            User existingEmailUser = userMapper.selectOne(queryWrapper);
            if (existingEmailUser != null) {
                throw new IllegalArgumentException("Email already exists: " + updateDTO.getEmail());
            }
        }
        
        // Update user information
        User user = new User();
        user.setId(updateDTO.getId());
        
        // Only update non-empty fields
        if (StringUtils.hasText(updateDTO.getUsername())) {
            user.setUsername(updateDTO.getUsername());
        } else {
            user.setUsername(existingUser.getUsername());
        }
        
        if (StringUtils.hasText(updateDTO.getPassword())) {
            user.setPassword(passwordEncoder.encode(updateDTO.getPassword()));
        } else {
            user.setPassword(existingUser.getPassword());
        }
        
        if (StringUtils.hasText(updateDTO.getEmail())) {
            user.setEmail(updateDTO.getEmail());
        } else {
            user.setEmail(existingUser.getEmail());
        }
        
        if (StringUtils.hasText(updateDTO.getFullName())) {
            user.setFullName(updateDTO.getFullName());
        } else {
            user.setFullName(existingUser.getFullName());
        }
        
        if (StringUtils.hasText(updateDTO.getRole())) {
            user.setRole(updateDTO.getRole());
        } else {
            user.setRole(existingUser.getRole());
        }
        
        if (updateDTO.getEnabled() != null) {
            user.setEnabled(updateDTO.getEnabled());
        } else {
            user.setEnabled(existingUser.getEnabled());
        }
        
        user.setCreatedAt(existingUser.getCreatedAt());
        user.setUpdatedAt(LocalDateTime.now());
        
        userMapper.updateById(user);
        return user;
    }

    @Override
    public User updateUser(Long id, User user) {
        User existingUser = userMapper.selectById(id);
        if (existingUser == null) {
            return null;
        }

        // Update fields
        user.setId(id);

        // Only encode password if it's provided and changed
        if (user.getPassword() != null && !user.getPassword().isEmpty() && 
            !user.getPassword().equals(existingUser.getPassword())) {
            user.setPassword(passwordEncoder.encode(user.getPassword()));
        } else {
            user.setPassword(existingUser.getPassword());
        }

        user.setUpdatedAt(LocalDateTime.now());
        user.setCreatedAt(existingUser.getCreatedAt());

        userMapper.updateById(user);
        return user;
    }

    @Override
    public boolean deleteUser(Long id) {
        int result = userMapper.deleteById(id);
        return result > 0;
    }
}
