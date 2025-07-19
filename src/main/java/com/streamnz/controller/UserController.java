package com.streamnz.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.streamnz.model.po.User;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.vo.UserVO;
import com.streamnz.model.vo.PageVO;
import com.streamnz.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;


@RestController
@RequiredArgsConstructor
@RequestMapping("/api/users")
@Tag(name = "User Management", description = "API endpoints for user management")
@Validated
public class UserController {

    private final UserService userService;


    @PostMapping("/pageQuery")
    @Operation(summary = "Search users with conditions and pagination", 
               description = "Returns a paginated list of users based on search conditions including username, email, role, time range, etc.")
    public ResponseEntity<PageVO<UserVO>> pageQuery(@Valid @RequestBody UserQueryDTO queryDTO,
            @Parameter(description = "Current page number, starting from 1")
            @RequestParam(defaultValue = "1") Long current,
            @Parameter(description = "Number of records per page") 
            @RequestParam(defaultValue = "10") Long size) {
        
        Page<User> userPage = userService.pageQueryWithConditions(current, size, queryDTO);
        PageVO<UserVO> pageVO = new PageVO<>(userPage, UserVO::new);
        return ResponseEntity.ok(pageVO);
    }

    @GetMapping("/queryById")
    @Operation(summary = "Get user by ID", description = "Returns a user by their ID")
    public ResponseEntity<UserVO> getUserById(@PathVariable Long id) {
        User user = userService.findById(id);
        if (user == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(new UserVO(user));
    }

    @GetMapping("/username/{username}")
    @Operation(summary = "Get user by username", description = "Returns a user by their username")
    public ResponseEntity<UserVO> getUserByUsername(@PathVariable String username) {
        User user = userService.findByUsername(username);
        if (user == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(new UserVO(user));
    }

    @PostMapping
    @Operation(summary = "Create user", description = "Creates a new user")
    public ResponseEntity<UserVO> createUser(@RequestBody User user) {
        User createdUser = userService.createUser(user);
        return ResponseEntity.status(HttpStatus.CREATED).body(new UserVO(createdUser));
    }

    @PutMapping("/{id}")
    @Operation(summary = "Update user", description = "Updates an existing user")
    public ResponseEntity<UserVO> updateUser(@PathVariable Long id, @RequestBody User user) {
        User updatedUser = userService.updateUser(id, user);
        if (updatedUser == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(new UserVO(updatedUser));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Delete user", description = "Deletes a user by their ID")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        boolean deleted = userService.deleteUser(id);
        if (!deleted) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.noContent().build();
    }
}
