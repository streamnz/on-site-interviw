package com.streamnz.controller;

import com.streamnz.model.dto.UserCreateDTO;
import com.streamnz.model.dto.UserQueryDTO;
import com.streamnz.model.dto.UserUpdateDTO;
import com.streamnz.model.vo.PageVO;
import com.streamnz.model.vo.UserVO;
import com.streamnz.service.UserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * User Controller
 * Handles user-related HTTP requests with proper DTO validation
 */
@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
@Tag(name = "User Management", description = "APIs for user CRUD operations with DTO validation")
public class UserController {

    private final UserService userService;

    @Operation(summary = "Create a new user", description = "Create a new user with comprehensive validation")
    @PostMapping("/create")
    public ResponseEntity<UserVO> createUser(@Valid @RequestBody UserCreateDTO createDTO) {
        UserVO user  = userService.createUser(createDTO);
        return new ResponseEntity<>(user, HttpStatus.CREATED);
    }

    @Operation(summary = "Update user information", description = "Update user with partial data validation")
    @PutMapping("/update")
    public ResponseEntity<UserVO> updateUser(@Valid @RequestBody UserUpdateDTO updateDTO) {
        UserVO user = userService.updateUser(updateDTO);
        return ResponseEntity.ok(user);
    }

    @Operation(summary = "Delete user", description = "Delete a user by ID")
    @PutMapping("/disable/{id}")
    public ResponseEntity<Void> deleteUser(
            @Parameter(description = "User ID String", required = true)
            @PathVariable String id) {
        userService.disableUser(Long.valueOf(id));
        return ResponseEntity.ok().build();
    }


    @Operation(summary = "Search users with pagination", description = "Search users with pagination and query conditions")
    @PostMapping("/pageQuery")
    public ResponseEntity<PageVO<UserVO>> pageQuery(@Valid @RequestBody UserQueryDTO queryDTO) {
        PageVO<UserVO> pageVO = userService.pageQueryWithConditions(queryDTO);
        return ResponseEntity.ok(pageVO);
    }
}
