package com.streamnz.controller;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.streamnz.model.dto.UserCreateDTO;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.dto.UserUpdateDTO;
import com.streamnz.model.po.User;
import com.streamnz.model.vo.PageVO;
import com.streamnz.model.vo.UserVO;
import com.streamnz.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * User Controller
 * Handles user-related HTTP requests with proper DTO validation
 * Uses Hutool BeanUtil for object conversion between PO and VO
 */
@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
@Tag(name = "User Management", description = "APIs for user CRUD operations with DTO validation")
public class UserController {

    private final UserService userService;

    @Operation(summary = "Create a new user", description = "Create a new user with comprehensive validation")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "201", description = "User created successfully"),
        @ApiResponse(responseCode = "400", description = "Invalid input data"),
        @ApiResponse(responseCode = "409", description = "Username or email already exists")
    })
    @PostMapping("/create")
    public ResponseEntity<UserVO> createUser(@Valid @RequestBody UserCreateDTO createDTO) {
        try {
            User user = userService.createUser(createDTO);
            // Use Hutool BeanUtil to convert PO to VO
            UserVO userVO = BeanUtil.copyProperties(user, UserVO.class);
            return new ResponseEntity<>(userVO, HttpStatus.CREATED);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }

    @Operation(summary = "Update user information", description = "Update user with partial data validation")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "User updated successfully"),
        @ApiResponse(responseCode = "400", description = "Invalid input data"),
        @ApiResponse(responseCode = "404", description = "User not found"),
        @ApiResponse(responseCode = "409", description = "Username or email already exists")
    })
    @PutMapping("/update")
    public ResponseEntity<UserVO> updateUser(@Valid @RequestBody UserUpdateDTO updateDTO) {
        try {
            User user = userService.updateUser(updateDTO);
            if (user == null) {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
            // Use Hutool BeanUtil to convert PO to VO
            UserVO userVO = BeanUtil.copyProperties(user, UserVO.class);
            return ResponseEntity.ok(userVO);
        } catch (IllegalArgumentException e) {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }

    @Operation(summary = "Get user by ID", description = "Retrieve user information by user ID")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "User found"),
        @ApiResponse(responseCode = "404", description = "User not found")
    })
    @GetMapping("/{id}")
    public ResponseEntity<UserVO> getUserById(
            @Parameter(description = "User ID", required = true)
            @PathVariable Long id) {
        User user = userService.findById(id);
        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        // Use Hutool BeanUtil to convert PO to VO
        UserVO userVO = BeanUtil.copyProperties(user, UserVO.class);
        return ResponseEntity.ok(userVO);
    }

    @Operation(summary = "Delete user", description = "Delete a user by ID")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "User deleted successfully"),
        @ApiResponse(responseCode = "404", description = "User not found")
    })
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(
            @Parameter(description = "User ID", required = true)
            @PathVariable Long id) {
        boolean deleted = userService.deleteUser(id);
        if (!deleted) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return ResponseEntity.ok().build();
    }

    @Operation(summary = "Search users with pagination", description = "Search users with multiple criteria and pagination")
    @ApiResponses(value = {
        @ApiResponse(responseCode = "200", description = "Search completed successfully"),
        @ApiResponse(responseCode = "400", description = "Invalid query parameters")
    })
    @PostMapping("/pageQuery")
    public ResponseEntity<PageVO<UserVO>> pageQuery(
            @Parameter(description = "Current page number (starting from 1)", example = "1")
            @RequestParam(defaultValue = "1") Long current,
            @Parameter(description = "Page size", example = "10")
            @RequestParam(defaultValue = "10") Long size,
            @Parameter(description = "Query conditions (optional)")
            @RequestBody(required = false) UserQueryDTO queryDTO) {
        
        Page<User> userPage = userService.pageQueryWithConditions(current, size, queryDTO);
        
        // Use Hutool BeanUtil to convert list of PO to list of VO
        List<UserVO> userVOList = BeanUtil.copyToList(userPage.getRecords(), UserVO.class);
        
        PageVO<UserVO> pageVO = new PageVO<>(
                userVOList,
                userPage.getTotal(),
                userPage.getCurrent(),
                userPage.getSize(),
                userPage.getPages()
        );
        
        return ResponseEntity.ok(pageVO);
    }
}
