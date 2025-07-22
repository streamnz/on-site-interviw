package com.streamnz.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.streamnz.model.entity.User;
import com.streamnz.model.dto.request.UserQueryDTO;
import com.streamnz.model.dto.request.UserCreateDTO;
import com.streamnz.model.dto.request.UserUpdateDTO;
import com.streamnz.model.vo.ApiResponse;
import com.streamnz.model.vo.PageVO;
import com.streamnz.model.vo.UserVO;
import com.streamnz.service.UserService;
import com.streamnz.mapper.RoleMapper;
import com.streamnz.model.entity.Role;
import java.util.List;
import java.util.stream.Collectors;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/users")
@Tag(name = "User Management", description = "API endpoints for user management")
@Validated
public class UserController {

    private final UserService userService;
    private final RoleMapper roleMapper;

    @GetMapping
    @Operation(summary = "Query users with pagination", 
               description = "Returns a paginated list of users with optional filtering")
    public ResponseEntity<ApiResponse<PageVO<UserVO>>> getUsers(
            @Parameter(description = "Current page number, starting from 1")
            @RequestParam(defaultValue = "1") Long current,
            @Parameter(description = "Number of records per page") 
            @RequestParam(defaultValue = "10") Long size,
            @Parameter(description = "Username filter (optional)")
            @RequestParam(required = false) String username,
            @Parameter(description = "Email filter (optional)")
            @RequestParam(required = false) String email) {
        
        // Create a query DTO with the provided filters
        UserQueryDTO queryDTO = new UserQueryDTO();
        queryDTO.setUsername(username);
        queryDTO.setEmail(email);
        
        Page<User> userPage = userService.pageQueryWithConditions(current, size, queryDTO);
        // Query roles when constructing UserVO
        PageVO<UserVO> pageVO = new PageVO<>(userPage, user -> {
            List<Role> roles = roleMapper.findRolesByUserId(user.getId());
            String[] roleArr = roles.stream().map(Role::getName).toArray(String[]::new);
            return new UserVO(user, roleArr);
        });
        return ResponseEntity.ok(ApiResponse.success("Users queried successfully", pageVO));
    }

    @PostMapping("/pageQuery")
    @Operation(summary = "Search users with conditions and pagination", 
               description = "Returns a paginated list of users based on search conditions including username, email, role, time range, etc.")
    public ResponseEntity<ApiResponse<PageVO<UserVO>>> pageQuery(@Valid @RequestBody UserQueryDTO queryDTO,
            @Parameter(description = "Current page number, starting from 1")
            @RequestParam(defaultValue = "1") Long current,
            @Parameter(description = "Number of records per page") 
            @RequestParam(defaultValue = "10") Long size) {
        
        Page<User> userPage = userService.pageQueryWithConditions(current, size, queryDTO);
        PageVO<UserVO> pageVO = new PageVO<>(userPage, UserVO::new);
        return ResponseEntity.ok(ApiResponse.success("Users queried successfully", pageVO));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Query user by ID", description = "Returns a user by their ID")
    public ResponseEntity<ApiResponse<UserVO>> getUserById(@PathVariable Long id) {
        User user = userService.findById(id);
        if (user == null) {
            return ResponseEntity.notFound().build();
        }
        List<Role> roles = roleMapper.findRolesByUserId(user.getId());
        String[] roleArr = roles.stream().map(Role::getName).toArray(String[]::new);
        return ResponseEntity.ok(ApiResponse.success("User information retrieved successfully", new UserVO(user, roleArr)));
    }

    @PostMapping("/create")
    @Operation(summary = "Create user with validation", 
               description = "Creates a new user with comprehensive validation using UserCreateDTO")
    public ResponseEntity<ApiResponse<UserVO>> createUser(@Valid @RequestBody UserCreateDTO createDTO) {
        User createdUser = userService.createUser(createDTO);
        List<Role> roles = roleMapper.findRolesByUserId(createdUser.getId());
        String[] roleArr = roles.stream().map(Role::getName).toArray(String[]::new);
        return ResponseEntity.status(HttpStatus.CREATED).body(ApiResponse.success("User created successfully", new UserVO(createdUser, roleArr)));
    }

    @PutMapping("/update")
    @Operation(summary = "Update user with validation", 
               description = "Updates an existing user with comprehensive validation using UserUpdateDTO")
    public ResponseEntity<ApiResponse<UserVO>> updateUser(@Valid @RequestBody UserUpdateDTO updateDTO) {
        User updatedUser = userService.updateUser(updateDTO);
        if (updatedUser == null) {
            return ResponseEntity.notFound().build();
        }
        List<Role> roles = roleMapper.findRolesByUserId(updatedUser.getId());
        String[] roleArr = roles.stream().map(Role::getName).toArray(String[]::new);
        return ResponseEntity.ok(ApiResponse.success("User updated successfully", new UserVO(updatedUser, roleArr)));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete user", description = "Deletes a user by their ID")
    public ResponseEntity<ApiResponse<Void>> deleteUser(@PathVariable Long id) {
        boolean deleted = userService.deleteUser(id);
        if (!deleted) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(ApiResponse.success("User deleted successfully", null));
    }
}
