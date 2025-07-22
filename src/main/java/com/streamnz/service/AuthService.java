package com.streamnz.service;

import com.streamnz.model.dto.response.AuthResponse;
import com.streamnz.model.dto.request.LoginDTO;
import com.streamnz.model.dto.request.RegisterDTO;

/**
 * Authentication service interface
 */
public interface AuthService {

    /**
     * User login
     */
    AuthResponse login(LoginDTO loginDTO);

    /**
     * User registration
     */
    AuthResponse register(RegisterDTO registerDTO);

    /**
     * User logout
     */
    void logout(String token);

    /**
     * Get current user info from token
     */
    AuthResponse.UserInfo getCurrentUser(String token);
} 