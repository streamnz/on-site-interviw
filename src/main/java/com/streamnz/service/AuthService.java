package com.streamnz.service;

import com.streamnz.model.dto.AuthResponse;
import com.streamnz.model.dto.LoginRequest;
import com.streamnz.model.dto.RegisterRequest;

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
} 