package com.streamnz.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Snowflake;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.streamnz.mapper.UserMapper;
import com.streamnz.model.dto.UserCreateDTO;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.dto.UserUpdateDTO;
import com.streamnz.model.po.User;
import com.streamnz.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;

/**
 * Implementation of UserService interface
 * Uses Hutool's Snowflake for ID generation and BeanUtil for object copying
 */
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    private final Snowflake snowflake;

    @Override
    public Page<User> pageQueryWithConditions(Long current, Long size, UserQueryDTO queryDTO) {
        Page<User> page = new Page<>(current, size);
        LambdaQueryWrapper<User> queryWrapper = buildQueryWrapper(queryDTO);
        return userMapper.selectPage(page, queryWrapper);
    }

    private LambdaQueryWrapper<User> buildQueryWrapper(UserQueryDTO queryDTO) {
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        if (queryDTO == null) {
            return queryWrapper.orderByDesc(User::getCreatedAt);
        }
        queryWrapper.like(StringUtils.hasText(queryDTO.getUsername()), User::getUsername, queryDTO.getUsername())
                   .like(StringUtils.hasText(queryDTO.getEmail()), User::getEmail, queryDTO.getEmail())
                   .like(StringUtils.hasText(queryDTO.getFullName()), User::getFullName, queryDTO.getFullName())
                   .eq(queryDTO.getEnabled() != null, User::getEnabled, queryDTO.getEnabled())
                   .ge(queryDTO.getCreatedAtStartAsDateTime() != null, User::getCreatedAt, queryDTO.getCreatedAtStartAsDateTime())
                   .le(queryDTO.getCreatedAtEndAsDateTime() != null, User::getCreatedAt, queryDTO.getCreatedAtEndAsDateTime())
                   .ge(queryDTO.getUpdatedAtStartAsDateTime() != null, User::getUpdatedAt, queryDTO.getUpdatedAtStartAsDateTime())
                   .le(queryDTO.getUpdatedAtEndAsDateTime() != null, User::getUpdatedAt, queryDTO.getUpdatedAtEndAsDateTime())
                   .like(StringUtils.hasText(queryDTO.getEmailDomain()), User::getEmail, "@" + queryDTO.getEmailDomain())
                   .orderByDesc(User::getCreatedAt);
        return queryWrapper;
    }

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
        
        // Use Hutool BeanUtil to copy properties from DTO to PO
        User user = BeanUtil.copyProperties(createDTO, User.class);
        // Generate unique ID using Hutool Snowflake
        user.setId(snowflake.nextId());
        // Encode password
        user.setPassword(passwordEncoder.encode(createDTO.getPassword()));
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());
        
        userMapper.insert(user);
        return user;
    }

    @Override
    public User createUser(User user) {
        // Generate unique ID using Hutool Snowflake if not provided
        if (user.getId() == null) {
            user.setId(snowflake.nextId());
        }
        
        // Encode password before saving
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());

        if (user.getEnabled() == null) {
            user.setEnabled(true);
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
        
        // Use Hutool BeanUtil to copy non-null properties from DTO to existing User
        BeanUtil.copyProperties(updateDTO, existingUser, "id", "createdAt");
        
        // Handle password encoding if provided
        if (StringUtils.hasText(updateDTO.getPassword())) {
            existingUser.setPassword(passwordEncoder.encode(updateDTO.getPassword()));
        }
        
        existingUser.setUpdatedAt(LocalDateTime.now());
        
        userMapper.updateById(existingUser);
        return existingUser;
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
