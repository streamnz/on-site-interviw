package com.streamnz.service;

import com.streamnz.model.dto.response.AuthResponse;
import com.streamnz.model.dto.request.LoginRequest;
import com.streamnz.model.dto.request.RegisterRequest;

/**
 * Authentication service interface
 */
public interface AuthService {

    /**
     * User login
     */
    AuthResponse login(LoginRequest loginRequest);

    /**
     * User registration
     */
    AuthResponse register(RegisterRequest registerRequest);

    /**
     * User logout
     */
    void logout(String token);

    /**
     * Get current user info from token
     */
    AuthResponse.UserInfo getCurrentUser(String token);
} 