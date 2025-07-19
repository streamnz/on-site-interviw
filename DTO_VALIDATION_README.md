# UserCreateDTO 和 UserUpdateDTO 实现文档

## 📋 概述

本文档详细说明了 `UserCreateDTO` 和 `UserUpdateDTO` 的实现，包括字段校验、自定义校验逻辑以及使用方式。

## 🏗️ 架构设计

### 设计原则

1. **数据验证分离**：将验证逻辑从实体类中分离到专门的 DTO 类中
2. **业务规则封装**：在 DTO 中封装业务校验规则
3. **向后兼容**：保留原有的 User 实体方法作为 legacy 接口
4. **RESTful 设计**：遵循 RESTful API 设计规范

### 类结构

```
com.streamnz.model.dto
├── UserCreateDTO.java    # 用户创建DTO
├── UserUpdateDTO.java    # 用户更新DTO
└── UserQueryDTO.java     # 用户查询DTO（已存在）
```

## 📝 UserCreateDTO 详细说明

### 字段定义

| 字段名            | 类型    | 必填 | 校验规则                         | 说明     |
| ----------------- | ------- | ---- | -------------------------------- | -------- |
| `username`        | String  | ✅   | 3-50 字符，字母数字下划线        | 用户名   |
| `password`        | String  | ✅   | 6-100 字符，包含大小写字母和数字 | 密码     |
| `confirmPassword` | String  | ✅   | 必须与 password 匹配             | 确认密码 |
| `email`           | String  | ✅   | 邮箱格式，最大 100 字符          | 邮箱地址 |
| `fullName`        | String  | ✅   | 2-100 字符，中文英文空格         | 全名     |
| `role`            | String  | ❌   | ADMIN/MANAGER/USER               | 用户角色 |
| `enabled`         | Boolean | ❌   | true/false                       | 启用状态 |

### 校验逻辑

#### 1. 基础字段校验

```java
@NotBlank(message = "用户名不能为空")
@Size(min = 3, max = 50, message = "用户名长度必须在3-50个字符之间")
@Pattern(regexp = "^[a-zA-Z0-9_]+$", message = "用户名只能包含字母、数字和下划线")
private String username;
```

#### 2. 密码强度校验

```java
@Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d@$!%*?&]{6,}$",
         message = "密码必须包含至少一个小写字母、一个大写字母和一个数字")
private String password;
```

#### 3. 自定义校验方法

##### 密码确认校验

```java
@AssertTrue(message = "密码和确认密码不匹配")
public boolean isPasswordConfirmed() {
    if (password == null || confirmPassword == null) {
        return false;
    }
    return password.equals(confirmPassword);
}
```

##### 用户名敏感词校验

```java
@AssertTrue(message = "用户名包含敏感词，请更换")
public boolean isUsernameNotSensitive() {
    if (username == null) {
        return true;
    }
    String lowerUsername = username.toLowerCase();
    String[] sensitiveWords = {"admin", "root", "system", "test", "guest"};
    for (String word : sensitiveWords) {
        if (lowerUsername.contains(word)) {
            return false;
        }
    }
    return true;
}
```

##### 邮箱域名校验

```java
@AssertTrue(message = "邮箱域名不被支持")
public boolean isEmailDomainValid() {
    if (email == null) {
        return true;
    }
    String[] validDomains = {"gmail.com", "yahoo.com", "hotmail.com", "outlook.com", "example.com"};
    String domain = email.substring(email.indexOf("@") + 1);
    for (String validDomain : validDomains) {
        if (domain.equals(validDomain)) {
            return true;
        }
    }
    return false;
}
```

### 默认值设置

```java
public void setDefaults() {
    if (role == null || role.trim().isEmpty()) {
        this.role = "USER";
    }
    if (enabled == null) {
        this.enabled = true;
    }
}
```

## 📝 UserUpdateDTO 详细说明

### 字段定义

| 字段名            | 类型    | 必填 | 校验规则                         | 说明            |
| ----------------- | ------- | ---- | -------------------------------- | --------------- |
| `id`              | Long    | ✅   | 大于 0 的整数                    | 用户 ID（必填） |
| `username`        | String  | ❌   | 3-50 字符，字母数字下划线        | 用户名          |
| `password`        | String  | ❌   | 6-100 字符，包含大小写字母和数字 | 密码            |
| `confirmPassword` | String  | ❌   | 必须与 password 匹配             | 确认密码        |
| `email`           | String  | ❌   | 邮箱格式，最大 100 字符          | 邮箱地址        |
| `fullName`        | String  | ❌   | 2-100 字符，中文英文空格         | 全名            |
| `role`            | String  | ❌   | ADMIN/MANAGER/USER               | 用户角色        |
| `enabled`         | Boolean | ❌   | true/false                       | 启用状态        |

### 特殊校验逻辑

#### 1. ID 字段必填校验

```java
@NotNull(message = "用户ID不能为空")
@Min(value = 1, message = "用户ID必须大于0")
private Long id;
```

#### 2. 条件性密码确认校验

```java
@AssertTrue(message = "密码和确认密码不匹配")
public boolean isPasswordConfirmed() {
    // 如果密码为空，则不需要确认密码
    if (password == null || password.trim().isEmpty()) {
        return true;
    }
    // 如果密码不为空，则确认密码也不能为空
    if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
        return false;
    }
    return password.equals(confirmPassword);
}
```

#### 3. 至少一个字段校验（除了 ID）

```java
@AssertTrue(message = "至少需要提供一个要更新的字段")
public boolean hasAtLeastOneField() {
    return (username != null && !username.trim().isEmpty()) ||
           (password != null && !password.trim().isEmpty()) ||
           (email != null && !email.trim().isEmpty()) ||
           (fullName != null && !fullName.trim().isEmpty()) ||
           (role != null && !role.trim().isEmpty()) ||
           (enabled != null);
}
```

#### 4. 用户名或邮箱必填校验

```java
@AssertTrue(message = "用户名和邮箱不能同时为空")
public boolean isUsernameOrEmailProvided() {
    boolean hasUsername = username != null && !username.trim().isEmpty();
    boolean hasEmail = email != null && !email.trim().isEmpty();
    return hasUsername || hasEmail;
}
```

## 🔧 Service 层实现

### UserService 接口扩展

```java
// 新增方法
User createUser(UserCreateDTO createDTO);
User updateUser(UserUpdateDTO updateDTO);  // 使用DTO中的ID

// 保留原有方法（向后兼容）
User createUser(User user);
User updateUser(Long id, User user);
```

### UserServiceImpl 实现要点

#### 1. 创建用户时的业务逻辑

```java
@Override
public User createUser(UserCreateDTO createDTO) {
    // 设置默认值
    createDTO.setDefaults();

    // 检查用户名唯一性
    User existingUser = findByUsername(createDTO.getUsername());
    if (existingUser != null) {
        throw new IllegalArgumentException("用户名已存在: " + createDTO.getUsername());
    }

    // 检查邮箱唯一性
    if (StringUtils.hasText(createDTO.getEmail())) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("email", createDTO.getEmail());
        User existingEmailUser = userMapper.selectOne(queryWrapper);
        if (existingEmailUser != null) {
            throw new IllegalArgumentException("邮箱已存在: " + createDTO.getEmail());
        }
    }

    // 创建用户实体并保存
    User user = new User();
    user.setUsername(createDTO.getUsername());
    user.setPassword(passwordEncoder.encode(createDTO.getPassword()));
    // ... 其他字段设置

    userMapper.insert(user);
    return user;
}
```

#### 2. 更新用户时的业务逻辑

```java
@Override
public User updateUser(UserUpdateDTO updateDTO) {
    User existingUser = userMapper.selectById(updateDTO.getId());  // 使用DTO中的ID
    if (existingUser == null) {
        return null;
    }

    // 检查是否有任何字段被更新
    if (!updateDTO.hasAnyField()) {
        throw new IllegalArgumentException("至少需要提供一个要更新的字段");
    }

    // 检查唯一性约束
    // ... 用户名和邮箱唯一性检查

    // 只更新非空字段
    User user = new User();
    user.setId(updateDTO.getId());  // 使用DTO中的ID

    if (StringUtils.hasText(updateDTO.getUsername())) {
        user.setUsername(updateDTO.getUsername());
    } else {
        user.setUsername(existingUser.getUsername());
    }
    // ... 其他字段处理

    userMapper.updateById(user);
    return user;
}
```

## 🌐 Controller 层实现

### RESTful API 设计

#### 新的 API 端点

```java
// 创建用户（带校验）
@PostMapping("/create")
public ResponseEntity<UserVO> createUser(@Valid @RequestBody UserCreateDTO createDTO)

// 更新用户（带校验）- 使用PUT /update，ID在请求体中
@PutMapping("/update")
public ResponseEntity<UserVO> updateUser(@Valid @RequestBody UserUpdateDTO updateDTO)

// 查询用户
@GetMapping("/{id}")
public ResponseEntity<UserVO> getUserById(@PathVariable Long id)

// 删除用户
@DeleteMapping("/{id}")
public ResponseEntity<Void> deleteUser(@PathVariable Long id)
```

#### Legacy API 端点（向后兼容）

```java
// 创建用户（legacy）
@PostMapping("/create/legacy")
public ResponseEntity<UserVO> createUserLegacy(@RequestBody User user)

// 更新用户（legacy）
@PutMapping("/{id}/legacy")
public ResponseEntity<UserVO> updateUserLegacy(@PathVariable Long id, @RequestBody User user)
```

### 异常处理

```java
try {
    User updatedUser = userService.updateUser(updateDTO);
    if (updatedUser == null) {
        return ResponseEntity.notFound().build();
    }
    return ResponseEntity.ok(new UserVO(updatedUser));
} catch (IllegalArgumentException e) {
    return ResponseEntity.badRequest().build();
}
```

## 🧪 测试用例

### 创建用户测试场景

1. **成功创建用户**

   ```json
   {
     "username": "testuser123",
     "password": "Password123",
     "confirmPassword": "Password123",
     "email": "testuser123@gmail.com",
     "fullName": "Test User",
     "role": "USER",
     "enabled": true
   }
   ```

2. **密码不匹配**

   ```json
   {
     "username": "testuser456",
     "password": "Password123",
     "confirmPassword": "Password456",
     "email": "testuser456@gmail.com",
     "fullName": "Test User 456"
   }
   ```

3. **用户名包含敏感词**

   ```json
   {
     "username": "adminuser",
     "password": "Password123",
     "confirmPassword": "Password123",
     "email": "adminuser@gmail.com",
     "fullName": "Admin User"
   }
   ```

4. **邮箱格式错误**
   ```json
   {
     "username": "testuser789",
     "password": "Password123",
     "confirmPassword": "Password123",
     "email": "invalid-email",
     "fullName": "Test User 789"
   }
   ```

### 更新用户测试场景

1. **成功更新用户**

   ```json
   {
     "id": 1,
     "fullName": "Updated User Name",
     "email": "updateduser@gmail.com",
     "role": "MANAGER"
   }
   ```

2. **缺少 ID 字段**

   ```json
   {
     "fullName": "Test Without ID",
     "email": "test@gmail.com"
   }
   ```

3. **ID 无效**

   ```json
   {
     "id": 99999,
     "fullName": "Test Invalid ID",
     "email": "test@gmail.com"
   }
   ```

4. **没有提供任何更新字段**

   ```json
   {
     "id": 1
   }
   ```

5. **密码不匹配**
   ```json
   {
     "id": 1,
     "password": "NewPassword123",
     "confirmPassword": "DifferentPassword123",
     "fullName": "Another Update"
   }
   ```

## 🚀 使用方法

### 1. 启动应用

```bash
mvn spring-boot:run
```

### 2. 运行测试脚本

```bash
./scripts/test-dto-validation.sh
```

### 3. 访问 Swagger 文档

```
http://localhost:8080/swagger-ui.html
```

## 📊 校验规则总结

### UserCreateDTO 校验规则

- ✅ 用户名：3-50 字符，字母数字下划线
- ✅ 密码：6-100 字符，包含大小写字母和数字
- ✅ 确认密码：必须与密码匹配
- ✅ 邮箱：有效邮箱格式，支持域名白名单
- ✅ 全名：2-100 字符，中文英文空格
- ✅ 角色：ADMIN/MANAGER/USER
- ✅ 用户名：不能包含敏感词
- ✅ 邮箱：域名必须在白名单中

### UserUpdateDTO 校验规则

- ✅ **ID 字段：必填，必须大于 0**
- ✅ 所有其他字段都是可选的
- ✅ 至少提供一个要更新的字段（除了 ID）
- ✅ 密码更新时必须提供确认密码
- ✅ 用户名和邮箱不能同时为空
- ✅ 用户名：不能包含敏感词
- ✅ 邮箱：域名必须在白名单中

## 🎯 面试价值

### 技术亮点

1. **分层架构**：DTO、Service、Controller 职责分离
2. **校验设计**：多层次校验（字段级、方法级、业务级）
3. **向后兼容**：保留原有接口，平滑迁移
4. **RESTful 设计**：遵循 REST 规范
5. **异常处理**：完善的异常处理机制
6. **ID 设计**：在 DTO 中包含 ID，避免路径参数

### 设计模式应用

1. **DTO 模式**：数据传输对象
2. **Builder 模式**：UserQueryBuilderV2
3. **Strategy 模式**：不同的校验策略
4. **Template 模式**：校验模板

### 最佳实践

1. **数据验证**：使用 Jakarta Validation
2. **业务规则**：在 DTO 中封装业务逻辑
3. **API 设计**：RESTful 和向后兼容
4. **测试覆盖**：全面的测试用例
5. **文档完善**：详细的 API 文档

### API 设计优势

1. **统一性**：所有更新操作都使用相同的端点
2. **安全性**：ID 在请求体中，便于添加额外校验
3. **扩展性**：便于添加批量更新等功能
4. **一致性**：与创建操作保持一致的请求体结构

这个实现展示了在 Spring Boot 项目中如何正确使用 DTO 模式进行数据验证和业务逻辑封装，特别是如何处理必填 ID 字段的设计，是面试中的**重要加分项**！
