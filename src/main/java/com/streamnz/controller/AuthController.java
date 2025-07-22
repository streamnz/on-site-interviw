package com.streamnz.controller;

import com.streamnz.model.dto.AuthResponse;
import com.streamnz.model.dto.LoginRequest;
import com.streamnz.model.dto.RegisterRequest;
import com.streamnz.service.AuthService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * Authentication controller
 * Provides endpoints for user authentication
 */
@Slf4j
@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
@Tag(name = "认证管理", description = "用户认证相关接口")
public class AuthController {

    private final AuthService authService;

    /**
     * User login
     */
    @PostMapping("/login")
    @Operation(summary = "用户登录", description = "用户登录并返回JWT令牌")
    public ResponseEntity<AuthResponse> login(@Valid @RequestBody LoginRequest loginRequest) {
        log.info("User login attempt: {}", loginRequest.getUsername());
        AuthResponse response = authService.login(loginRequest);
        return ResponseEntity.ok(response);
    }

    /**
     * User registration
     */
    @PostMapping("/register")
    @Operation(summary = "用户注册", description = "新用户注册")
    public ResponseEntity<AuthResponse> register(@Valid @RequestBody RegisterRequest registerRequest) {
        log.info("User registration attempt: {}", registerRequest.getUsername());
        AuthResponse response = authService.register(registerRequest);
        return ResponseEntity.ok(response);
    }

    /**
     * User logout
     */
    @PostMapping("/logout")
    @Operation(summary = "用户登出", description = "用户登出")
    public ResponseEntity<Void> logout(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);
            authService.logout(token);
        }
        return ResponseEntity.ok().build();
    }

    /**
     * Get current user info
     */
    @GetMapping("/me")
    @Operation(summary = "获取当前用户信息", description = "获取当前登录用户的信息")
    public ResponseEntity<AuthResponse.UserInfo> getCurrentUser(HttpServletRequest request) {
        // This would typically extract user info from the JWT token
        // For now, we'll return a simple response
        return ResponseEntity.ok(AuthResponse.UserInfo.builder()
                .username("current_user")
                .build());
    }
} 