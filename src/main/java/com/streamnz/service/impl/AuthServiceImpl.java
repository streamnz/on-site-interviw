package com.streamnz.service.impl;

import com.streamnz.config.JwtUtils;
import com.streamnz.config.SnowflakeIdGenerator;
import com.streamnz.mapper.RoleMapper;
import com.streamnz.mapper.UserMapper;
import com.streamnz.mapper.UserRoleRelationMapper;
import com.streamnz.model.dto.AuthResponse;
import com.streamnz.model.dto.LoginRequest;
import com.streamnz.model.dto.RegisterRequest;
import com.streamnz.model.po.Role;
import com.streamnz.model.po.User;
import com.streamnz.model.po.UserRoleRelation;
import com.streamnz.service.AuthService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Authentication service implementation
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {

    private final AuthenticationManager authenticationManager;
    private final JwtUtils jwtUtils;
    private final UserMapper userMapper;
    private final RoleMapper roleMapper;
    private final UserRoleRelationMapper userRoleRelationMapper;
    private final PasswordEncoder passwordEncoder;
    private final SnowflakeIdGenerator snowflakeIdGenerator;

    @Override
    public AuthResponse login(LoginRequest loginRequest) {
        // Authenticate user
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getUsername(),
                        loginRequest.getPassword()
                )
        );

        // Generate JWT token
        String token = jwtUtils.generateToken(loginRequest.getUsername());

        // Get user information
        User user = userMapper.selectByUsername(loginRequest.getUsername());
        List<Role> roles = roleMapper.findRolesByUserId(user.getId());
        String[] roleNames = roles.stream().map(Role::getName).toArray(String[]::new);

        return AuthResponse.builder()
                .token(token)
                .tokenType("Bearer")
                .userInfo(AuthResponse.UserInfo.builder()
                        .id(user.getId())
                        .username(user.getUsername())
                        .email(user.getEmail())
                        .fullName(user.getFullName())
                        .roles(roleNames)
                        .build())
                .build();
    }

    @Override
    @Transactional
    public AuthResponse register(RegisterRequest registerRequest) {
        // Check if username already exists
        if (userMapper.selectByUsername(registerRequest.getUsername()) != null) {
            throw new RuntimeException("用户名已存在");
        }

        // Check if email already exists
        if (registerRequest.getEmail() != null && 
            userMapper.selectByEmail(registerRequest.getEmail()) != null) {
            throw new RuntimeException("邮箱已存在");
        }

        // Create new user
        User user = new User();
        user.setId(snowflakeIdGenerator.nextId());
        user.setUsername(registerRequest.getUsername());
        user.setPassword(passwordEncoder.encode(registerRequest.getPassword()));
        user.setEmail(registerRequest.getEmail());
        user.setFullName(registerRequest.getFullName());
        user.setEnabled(true);
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());

        userMapper.insert(user);

        // Assign default USER role
        Role userRole = roleMapper.findByName("USER");
        if (userRole != null) {
            UserRoleRelation relation = new UserRoleRelation();
            relation.setId(snowflakeIdGenerator.nextId());
            relation.setUserId(user.getId());
            relation.setRoleId(userRole.getId());
            relation.setCreatedAt(LocalDateTime.now());
            userRoleRelationMapper.insert(relation);
        }

        // Generate JWT token
        String token = jwtUtils.generateToken(user.getUsername());

        return AuthResponse.builder()
                .token(token)
                .tokenType("Bearer")
                .userInfo(AuthResponse.UserInfo.builder()
                        .id(user.getId())
                        .username(user.getUsername())
                        .email(user.getEmail())
                        .fullName(user.getFullName())
                        .roles(new String[]{"USER"})
                        .build())
                .build();
    }

    @Override
    public void logout(String token) {
        // In a stateless JWT implementation, logout is typically handled on the client side
        // by removing the token from storage. For server-side logout, you could implement
        // a token blacklist, but that's beyond the scope of this MVP.
        log.info("User logged out, token: {}", token.substring(0, Math.min(20, token.length())) + "...");
    }
} 