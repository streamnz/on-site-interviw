package com.streamnz.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.lang.Snowflake;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.streamnz.exception.StreamNZException;
import com.streamnz.mapper.UserMapper;
import com.streamnz.model.dto.UserCreateDTO;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.dto.UserUpdateDTO;
import com.streamnz.model.po.User;
import com.streamnz.model.vo.PageVO;
import com.streamnz.model.vo.UserVO;
import com.streamnz.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.List;

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
    public PageVO<UserVO> pageQueryWithConditions(UserQueryDTO queryDTO) {
        Page<User> page = queryDTO.toMybatisPlusPage();
        LambdaQueryWrapper<User> queryWrapper = buildQueryWrapper(queryDTO);
        Page<User> userPage = userMapper.selectPage(page, queryWrapper);

        List<UserVO> userVOList = userPage.getRecords().stream()
            .map(UserVO::new)
            .toList();
        return new PageVO<>(
            userVOList,
            userPage.getTotal(),
            userPage.getCurrent(),
            userPage.getSize(),
            userPage.getPages()
        );
    }

    private LambdaQueryWrapper<User> buildQueryWrapper(UserQueryDTO queryDTO) {
        LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
        if (queryDTO == null) {
            return queryWrapper.orderByDesc(User::getCreatedAt);
        }
        
        // Build query conditions
        queryWrapper.like(StringUtils.hasText(queryDTO.getUsername()), User::getUsername, queryDTO.getUsername())
                   .like(StringUtils.hasText(queryDTO.getEmail()), User::getEmail, queryDTO.getEmail())
                   .like(StringUtils.hasText(queryDTO.getFullName()), User::getFullName, queryDTO.getFullName())
                   .eq(queryDTO.getEnabled() != null, User::getEnabled, queryDTO.getEnabled())
                   .ge(queryDTO.getCreatedAtStartAsDateTime() != null, User::getCreatedAt, queryDTO.getCreatedAtStartAsDateTime())
                   .le(queryDTO.getCreatedAtEndAsDateTime() != null, User::getCreatedAt, queryDTO.getCreatedAtEndAsDateTime())
                   .ge(queryDTO.getUpdatedAtStartAsDateTime() != null, User::getUpdatedAt, queryDTO.getUpdatedAtStartAsDateTime())
                   .le(queryDTO.getUpdatedAtEndAsDateTime() != null, User::getUpdatedAt, queryDTO.getUpdatedAtEndAsDateTime())
                   .like(StringUtils.hasText(queryDTO.getEmailDomain()), User::getEmail, "@" + queryDTO.getEmailDomain());
        
        // Apply sorting if no custom sorts are specified, use default
        if (!queryDTO.hasSorts()) {
            queryWrapper.orderByDesc(User::getCreatedAt);
        }
        // Note: Custom sorting is handled by MyBatis-Plus Page object in toMybatisPlusPage()
        
        return queryWrapper;
    }

    @Override
    public User findByUsername(String username) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        return userMapper.selectOne(queryWrapper);
    }

    @Override
    public User findByEmail(String email) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("email", email);
        return userMapper.selectOne(queryWrapper);
    }

    @Override
    public UserVO createUser(UserCreateDTO createDTO) {
        // Check username uniqueness
        User existingUser = findByUsername(createDTO.getUsername());
        if (existingUser != null) {
            throw new StreamNZException("Username already exists: " + createDTO.getUsername());
        }

        // Check email uniqueness
        User existingEmailUser = findByEmail(createDTO.getEmail());
        if (existingEmailUser != null) {
            throw new StreamNZException("Email already exists: " + createDTO.getEmail());
        }

        // DTO to PO
        User user = BeanUtil.copyProperties(createDTO, User.class);
        // Generate unique ID using Hutool Snowflake
        user.setId(snowflake.nextId());
        // Encode password
        user.setPassword(passwordEncoder.encode(createDTO.getPassword()));
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());
        user.setEnabled(true);

        userMapper.insert(user);
        return BeanUtil.copyProperties(user, UserVO.class);
    }

    @Override
    public UserVO updateUser(UserUpdateDTO updateDTO) {
        // Validate ID
        User existingUser = userMapper.selectById(updateDTO.getId());
        if (existingUser == null) {
            throw new StreamNZException("User not found with ID: " + updateDTO.getId());
        }

        // Check if any field is updated
        if (!updateDTO.hasAnyField()) {
            throw new StreamNZException("At least one field must be provided for update");
        }

        // Check username uniqueness (if updating username)
        if (StringUtils.hasText(updateDTO.getUsername()) && !updateDTO.getUsername().equals(existingUser.getUsername())) {
            User existingUsernameUser = findByUsername(updateDTO.getUsername());
            if (existingUsernameUser != null) {
                throw new StreamNZException("Username already exists: " + updateDTO.getUsername());
            }
        }

        // Check email uniqueness (if updating email)
        if (StringUtils.hasText(updateDTO.getEmail()) && !updateDTO.getEmail().equals(existingUser.getEmail())) {
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
        return BeanUtil.copyProperties(existingUser, UserVO.class);
    }


    @Override
    public boolean disableUser(Long id) {
        // Set enabled to false
        User user = new User();
        user.setId(id);
        user.setEnabled(false);
        user.setUpdatedAt(LocalDateTime.now());
        int result = userMapper.updateById(user);
        // If result is 0, user not found or not updated
        if (result == 0) {
            throw new StreamNZException("User not found or already disabled with ID: " + id);
        }
        return result > 0;
    }
}