package com.streamnz.controller;

import com.streamnz.model.dto.response.AuthResponse;
import com.streamnz.model.dto.request.LoginRequest;
import com.streamnz.model.dto.request.RegisterRequest;
import com.streamnz.model.vo.ApiResponse;
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
@Tag(name = "Authentication Management", description = "User authentication related interfaces")
public class AuthController {

    private final AuthService authService;

    /**
     * User login
     */
    @PostMapping("/login")
    @Operation(summary = "User Login", description = "User login and return JWT token")
    public ResponseEntity<ApiResponse<AuthResponse>> login(@Valid @RequestBody LoginRequest loginRequest) {
        log.info("User login attempt: {}", loginRequest.getUsername());
        AuthResponse response = authService.login(loginRequest);
        return ResponseEntity.ok(ApiResponse.success("Login successful", response));
    }

    /**
     * User registration
     */
    @PostMapping("/register")
    @Operation(summary = "User Registration", description = "New user registration")
    public ResponseEntity<ApiResponse<AuthResponse>> register(@Valid @RequestBody RegisterRequest registerRequest) {
        log.info("User registration attempt: {}", registerRequest.getUsername());
        AuthResponse response = authService.register(registerRequest);
        return ResponseEntity.ok(ApiResponse.success("Registration successful", response));
    }

    /**
     * User logout
     */
    @PostMapping("/logout")
    @Operation(summary = "User Logout", description = "User logout")
    public ResponseEntity<ApiResponse<Void>> logout(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (authHeader != null && authHeader.startsWith("Bearer ")) {
            String token = authHeader.substring(7);
            authService.logout(token);
        }
        return ResponseEntity.ok(ApiResponse.success("Logout successful", null));
    }

    /**
     * Get current user info
     */
    @GetMapping("/me")
    @Operation(summary = "Get Current User Info", description = "Get current logged in user information")
    public ResponseEntity<ApiResponse<AuthResponse.UserInfo>> getCurrentUser(HttpServletRequest request) {
        String authHeader = request.getHeader("Authorization");
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            return ResponseEntity.ok(ApiResponse.error("No valid token provided"));
        }
        
        String token = authHeader.substring(7);
        AuthResponse.UserInfo userInfo = authService.getCurrentUser(token);
        return ResponseEntity.ok(ApiResponse.success("Current user information retrieved successfully", userInfo));
    }
} 