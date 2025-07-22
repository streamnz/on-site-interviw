package com.streamnz.service.impl;

import com.streamnz.mapper.RoleMapper;
import com.streamnz.mapper.UserMapper;
import com.streamnz.model.entity.Role;
import com.streamnz.model.entity.User;
import com.streamnz.model.security.UserPrincipal;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * UserDetailsService implementation for Spring Security
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserDetailsServiceImpl implements UserDetailsService {

    private final UserMapper userMapper;
    private final RoleMapper roleMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.selectByUsername(username);
        
        if (user == null) {
            throw new UsernameNotFoundException("User does not exist: " + username);
        }

        if (!user.getEnabled()) {
            throw new UsernameNotFoundException("User is disabled: " + username);
        }

        // Get user roles
        List<Role> roles = roleMapper.findRolesByUserId(user.getId());
        List<String> roleNames = roles.stream()
                .map(Role::getName)
                .collect(Collectors.toList());

        log.debug("User {} loaded successfully, roles: {}", username, roleNames);

        return UserPrincipal.create(user, roleNames);
    }
} 