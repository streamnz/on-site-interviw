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


    @Override
    public Page<User> pageQueryWithConditions(Long current, Long size, UserQueryDTO queryDTO) {
        Page<User> page = new Page<>(current, size);
        QueryWrapper<User> queryWrapper = userQueryBuilder.buildQueryWrapper(queryDTO);
        return userMapper.selectPage(page, queryWrapper);
    }

    // 查询构建逻辑已迁移到UserQueryBuilder类中，提高代码的可维护性和可测试性

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
        // 设置默认值
        createDTO.setDefaults();
        
        // 检查用户名是否已存在
        User existingUser = findByUsername(createDTO.getUsername());
        if (existingUser != null) {
            throw new IllegalArgumentException("用户名已存在: " + createDTO.getUsername());
        }
        
        // 检查邮箱是否已存在
        if (StringUtils.hasText(createDTO.getEmail())) {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("email", createDTO.getEmail());
            User existingEmailUser = userMapper.selectOne(queryWrapper);
            if (existingEmailUser != null) {
                throw new IllegalArgumentException("邮箱已存在: " + createDTO.getEmail());
            }
        }
        
        // 创建用户实体
        User user = new User();
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
        
        // 检查是否有任何字段被更新
        if (!updateDTO.hasAnyField()) {
            throw new IllegalArgumentException("至少需要提供一个要更新的字段");
        }
        
        // 检查用户名唯一性（如果更新用户名）
        if (StringUtils.hasText(updateDTO.getUsername()) && 
            !updateDTO.getUsername().equals(existingUser.getUsername())) {
            User existingUsernameUser = findByUsername(updateDTO.getUsername());
            if (existingUsernameUser != null) {
                throw new IllegalArgumentException("用户名已存在: " + updateDTO.getUsername());
            }
        }
        
        // 检查邮箱唯一性（如果更新邮箱）
        if (StringUtils.hasText(updateDTO.getEmail()) && 
            !updateDTO.getEmail().equals(existingUser.getEmail())) {
            QueryWrapper<User> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("email", updateDTO.getEmail());
            User existingEmailUser = userMapper.selectOne(queryWrapper);
            if (existingEmailUser != null) {
                throw new IllegalArgumentException("邮箱已存在: " + updateDTO.getEmail());
            }
        }
        
        // 更新用户信息
        User user = new User();
        user.setId(updateDTO.getId());
        
        // 只更新非空字段
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
