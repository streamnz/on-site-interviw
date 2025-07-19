# User DTO Validation System

## Overview

This project implements a comprehensive user management system with DTO (Data Transfer Object) validation using Jakarta Validation (javax.validation) annotations. The system provides robust validation for user creation and update operations.

## Features

### UserCreateDTO

- **Username validation**: 3-50 characters, alphanumeric and underscores only
- **Password validation**: 6-100 characters, must contain lowercase, uppercase, and number
- **Email validation**: Format validation and domain whitelist
- **Full name validation**: 2-100 characters, letters and spaces only
- **Role validation**: ADMIN, MANAGER, or USER only
- **Custom validations**: Password confirmation, sensitive word filtering, email domain validation

### UserUpdateDTO

- **Mandatory ID field**: Required for all update operations
- **Optional field updates**: Only provided fields are updated
- **Password confirmation**: Required when password is updated
- **Uniqueness checks**: Username and email uniqueness validation
- **At least one field**: Ensures at least one field is provided for update

## API Endpoints

### Create User

```http
POST /api/users/create
Content-Type: application/json

{
  "username": "john_doe",
  "password": "Password123",
  "confirmPassword": "Password123",
  "email": "john.doe@gmail.com",
  "fullName": "John Doe",
  "role": "USER",
  "enabled": true
}
```

### Update User

```http
PUT /api/users/update
Content-Type: application/json

{
  "id": 1,
  "fullName": "John Updated",
  "email": "john.updated@gmail.com",
  "role": "MANAGER"
}
```

## Validation Rules

### UserCreateDTO Validation

| Field           | Rules                                                                |
| --------------- | -------------------------------------------------------------------- |
| username        | Not blank, 3-50 chars, alphanumeric + underscore, no sensitive words |
| password        | Not blank, 6-100 chars, lowercase + uppercase + number               |
| confirmPassword | Must match password                                                  |
| email           | Not blank, valid format, whitelisted domain                          |
| fullName        | Not blank, 2-100 chars, letters + spaces                             |
| role            | ADMIN/MANAGER/USER only                                              |
| enabled         | Boolean, defaults to true                                            |

### UserUpdateDTO Validation

| Field           | Rules                          |
| --------------- | ------------------------------ |
| id              | Required, must be > 0          |
| username        | Optional, same rules as create |
| password        | Optional, same rules as create |
| confirmPassword | Required if password provided  |
| email           | Optional, same rules as create |
| fullName        | Optional, same rules as create |
| role            | Optional, same rules as create |
| enabled         | Optional boolean               |

## Service Layer Design

### UserService Interface

```java
public interface UserService {
    User createUser(UserCreateDTO createDTO);
    User updateUser(UserUpdateDTO updateDTO);
    // ... other methods
}
```

### UserServiceImpl Implementation

- **Create user**: Validates uniqueness, encodes password, sets defaults
- **Update user**: Validates existence, checks uniqueness, updates only provided fields
- **Error handling**: Throws IllegalArgumentException with descriptive messages

## Controller Design

### UserController

- **POST /create**: Accepts UserCreateDTO with validation
- **PUT /update**: Accepts UserUpdateDTO with validation (ID in request body)
- **Error responses**: Returns appropriate HTTP status codes
- **Success responses**: Returns UserVO objects

## Testing

### Test Script

Run the validation test script:

```bash
chmod +x scripts/test-dto-validation.sh
./scripts/test-dto-validation.sh
```

### Test Cases

1. **Create user - Success case**
2. **Create user - Password mismatch**
3. **Create user - Username contains sensitive words**
4. **Create user - Invalid email format**
5. **Create user - Weak password**
6. **Create user - Unsupported email domain**
7. **Update user - Success case**
8. **Update user - No fields provided**
9. **Update user - Password mismatch**
10. **Update user - Username contains sensitive words**
11. **Update user - Missing ID field**
12. **Update user - Invalid ID**

## Error Handling

### Global Exception Handler

- **MethodArgumentNotValidException**: Parameter validation errors
- **ConstraintViolationException**: Constraint validation errors
- **Generic Exception**: Internal server errors

### Error Response Format

```json
{
  "message": "Parameter validation failed",
  "errors": {
    "username": "Username cannot be empty",
    "password": "Password must contain at least one lowercase letter, one uppercase letter and one number"
  },
  "status": 400
}
```

## Configuration

### Dependencies

```xml
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-validation</artifactId>
</dependency>
```

### Validation Configuration

- **@Valid**: Method-level validation
- **@Validated**: Controller-level validation
- **Custom validators**: @AssertTrue methods for complex validation logic

## Usage Examples

### Creating a User

```bash
curl -X POST "http://localhost:8080/api/users/create" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser",
    "password": "Password123",
    "confirmPassword": "Password123",
    "email": "testuser@gmail.com",
    "fullName": "Test User",
    "role": "USER"
  }'
```

### Updating a User

```bash
curl -X PUT "http://localhost:8080/api/users/update" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1,
    "fullName": "Updated Name",
    "email": "updated@gmail.com"
  }'
```

## Benefits

1. **Comprehensive Validation**: Multiple validation layers ensure data integrity
2. **Clear Error Messages**: Descriptive validation messages help users understand issues
3. **Flexible Updates**: Only provided fields are updated in UserUpdateDTO
4. **Security**: Password encoding, sensitive word filtering, domain validation
5. **Maintainability**: Clean separation of concerns with DTOs and validation
6. **Testability**: Comprehensive test coverage for all validation scenarios

## Future Enhancements

1. **JWT Authentication**: Add JWT token-based authentication
2. **Role-based Access Control**: Implement RBAC for different user roles
3. **Password Reset**: Add password reset functionality
4. **Email Verification**: Implement email verification for new users
5. **Audit Logging**: Add comprehensive audit logging for user operations
