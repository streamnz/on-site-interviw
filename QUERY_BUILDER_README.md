# 🏗️ 查询构建器架构重构总结

## 🤔 **问题分析：DTO 中是否应该包含查询逻辑？**

### ❌ **不建议放在 DTO 中的原因**

#### 1. **单一职责原则 (SRP)**

```java
// ❌ 错误做法：DTO包含查询逻辑
@Data
public class UserQueryDTO {
    private String username;
    private String email;

    // ❌ 违反单一职责原则
    public QueryWrapper<User> buildQueryWrapper() {
        // 查询构建逻辑不应该在DTO中
    }
}
```

#### 2. **依赖耦合问题**

```java
// ❌ DTO不应该依赖特定ORM框架
public class UserQueryDTO {
    // 这会创建对MyBatis-Plus的依赖
    public QueryWrapper<User> buildQueryWrapper() {
        // DTO与MyBatis-Plus框架耦合
    }
}
```

#### 3. **可测试性和可维护性**

```java
// ✅ 查询逻辑在Service层更容易测试
@Service
public class UserServiceImpl {
    // 更容易进行单元测试
    // 更容易进行集成测试
    // 更容易进行性能测试
}
```

## ✅ **推荐的架构设计**

### 方案 1：专门的 QueryBuilder 类

#### 1. **UserQueryBuilder** (`src/main/java/com/streamnz/query/UserQueryBuilder.java`)

```java
@Component
public class UserQueryBuilder {

    /**
     * 构建动态查询条件
     */
    public QueryWrapper<User> buildQueryWrapper(UserQueryDTO queryDTO) {
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();

        if (queryDTO == null) {
            return queryWrapper;
        }

        // 用户名模糊搜索
        if (StringUtils.hasText(queryDTO.getUsername())) {
            queryWrapper.like("username", queryDTO.getUsername());
        }

        // 邮箱模糊搜索
        if (StringUtils.hasText(queryDTO.getEmail())) {
            queryWrapper.like("email", queryDTO.getEmail());
        }

        // 全名模糊搜索
        if (StringUtils.hasText(queryDTO.getFullName())) {
            queryWrapper.like("full_name", queryDTO.getFullName());
        }

        // 角色精确匹配
        if (StringUtils.hasText(queryDTO.getRole())) {
            queryWrapper.eq("role", queryDTO.getRole());
        }

        // 启用状态精确匹配
        if (queryDTO.getEnabled() != null) {
            queryWrapper.eq("enabled", queryDTO.getEnabled());
        }

        // 创建时间范围查询
        if (queryDTO.getCreatedAtStart() != null) {
            queryWrapper.ge("created_at", queryDTO.getCreatedAtStart());
        }
        if (queryDTO.getCreatedAtEnd() != null) {
            queryWrapper.le("created_at", queryDTO.getCreatedAtEnd());
        }

        // 更新时间范围查询
        if (queryDTO.getUpdatedAtStart() != null) {
            queryWrapper.ge("updated_at", queryDTO.getUpdatedAtStart());
        }
        if (queryDTO.getUpdatedAtEnd() != null) {
            queryWrapper.le("updated_at", queryDTO.getUpdatedAtEnd());
        }

        // 邮箱域名筛选
        if (StringUtils.hasText(queryDTO.getEmailDomain())) {
            queryWrapper.like("email", "@" + queryDTO.getEmailDomain());
        }

        // 默认按创建时间降序排列
        queryWrapper.orderByDesc("created_at");

        return queryWrapper;
    }
}
```

### 方案 2：Builder 模式的更优雅实现

#### 2. **UserQueryBuilderV2** (`src/main/java/com/streamnz/query/UserQueryBuilderV2.java`)

```java
public class UserQueryBuilderV2 {

    private final QueryWrapper<User> queryWrapper;
    private final UserQueryDTO queryDTO;

    public UserQueryBuilderV2(UserQueryDTO queryDTO) {
        this.queryWrapper = new QueryWrapper<>();
        this.queryDTO = queryDTO;
    }

    /**
     * 添加用户名模糊搜索条件
     */
    public UserQueryBuilderV2 withUsername() {
        if (StringUtils.hasText(queryDTO.getUsername())) {
            queryWrapper.like("username", queryDTO.getUsername());
        }
        return this;
    }

    /**
     * 添加邮箱模糊搜索条件
     */
    public UserQueryBuilderV2 withEmail() {
        if (StringUtils.hasText(queryDTO.getEmail())) {
            queryWrapper.like("email", queryDTO.getEmail());
        }
        return this;
    }

    /**
     * 构建完整的查询条件
     */
    public UserQueryBuilderV2 buildAll() {
        return this
                .withUsername()
                .withEmail()
                .withFullName()
                .withRole()
                .withEnabled()
                .withCreatedAtRange()
                .withUpdatedAtRange()
                .withEmailDomain()
                .withDefaultOrder();
    }

    /**
     * 获取QueryWrapper
     */
    public QueryWrapper<User> build() {
        return queryWrapper;
    }

    /**
     * 静态工厂方法
     */
    public static UserQueryBuilderV2 from(UserQueryDTO queryDTO) {
        return new UserQueryBuilderV2(queryDTO);
    }
}
```

### 更新 Service 层

#### 3. **UserServiceImpl** 重构

```java
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;
    private final UserQueryBuilder userQueryBuilder; // 注入QueryBuilder

    @Override
    public Page<User> pageQueryWithConditions(Long current, Long size, UserQueryDTO queryDTO) {
        Page<User> page = new Page<>(current, size);
        // 使用QueryBuilder构建查询条件
        QueryWrapper<User> queryWrapper = userQueryBuilder.buildQueryWrapper(queryDTO);
        return userMapper.selectPage(page, queryWrapper);
    }

    // 查询构建逻辑已迁移到UserQueryBuilder类中，提高代码的可维护性和可测试性
}
```

## 📊 **架构对比**

### 🔄 **重构前后对比**

| 方面         | 重构前                    | 重构后                     |
| ------------ | ------------------------- | -------------------------- |
| **职责分离** | ❌ Service 层包含查询逻辑 | ✅ 专门的 QueryBuilder 类  |
| **可测试性** | ❌ 查询逻辑难以单独测试   | ✅ QueryBuilder 可独立测试 |
| **可维护性** | ❌ 查询逻辑与业务逻辑混合 | ✅ 查询逻辑独立维护        |
| **可扩展性** | ❌ 难以扩展新的查询条件   | ✅ 易于添加新的查询方法    |
| **依赖关系** | ❌ DTO 与 ORM 框架耦合    | ✅ 清晰的依赖关系          |

### 🎯 **设计原则遵循**

#### 1. **单一职责原则 (SRP)**

```java
// ✅ DTO只负责数据传输
@Data
public class UserQueryDTO {
    private String username;
    private String email;
    // 只包含数据字段和校验逻辑
}

// ✅ QueryBuilder只负责查询构建
@Component
public class UserQueryBuilder {
    public QueryWrapper<User> buildQueryWrapper(UserQueryDTO queryDTO) {
        // 只包含查询构建逻辑
    }
}
```

#### 2. **依赖倒置原则 (DIP)**

```java
// ✅ Service层依赖抽象，不依赖具体实现
@Service
public class UserServiceImpl {
    private final UserQueryBuilder userQueryBuilder; // 依赖注入

    public Page<User> pageQueryWithConditions(UserQueryDTO queryDTO) {
        // 使用QueryBuilder，不直接构建QueryWrapper
    }
}
```

#### 3. **开闭原则 (OCP)**

```java
// ✅ 易于扩展新的查询条件
public class UserQueryBuilderV2 {
    public UserQueryBuilderV2 withCustomCondition() {
        // 可以轻松添加新的查询条件
        return this;
    }
}
```

## 🧪 **功能测试**

### 基础分页查询测试

```bash
curl "http://localhost:8080/api/users/pageQuery?current=1&size=3"
```

**响应结果:**

```json
{
  "total": 1001,
  "size": 3,
  "current": 1,
  "users": ["admin", "user001", "user002"]
}
```

### 条件查询测试

```bash
curl -X POST "http://localhost:8080/api/users/search?current=1&size=5" \
  -H "Content-Type: application/json" \
  -d '{"username":"user00","role":"USER"}'
```

**响应结果:**

```json
{
  "total": 9,
  "size": 5,
  "current": 1,
  "users": ["user001", "user002", "user003", "user004", "user005"]
}
```

## 🎯 **架构优势**

### 1. **职责清晰**

- **DTO**: 只负责数据传输和校验
- **QueryBuilder**: 只负责查询条件构建
- **Service**: 只负责业务逻辑协调

### 2. **易于测试**

```java
@Test
public void testUserQueryBuilder() {
    UserQueryDTO queryDTO = new UserQueryDTO();
    queryDTO.setUsername("user00");
    queryDTO.setRole("USER");

    UserQueryBuilder builder = new UserQueryBuilder();
    QueryWrapper<User> wrapper = builder.buildQueryWrapper(queryDTO);

    // 可以独立测试查询构建逻辑
    assertNotNull(wrapper);
}
```

### 3. **易于维护**

- 查询逻辑集中在一个类中
- 修改查询条件不影响其他代码
- 添加新的查询条件很简单

### 4. **易于扩展**

```java
// 可以轻松添加新的查询方法
public UserQueryBuilderV2 withCustomField() {
    if (StringUtils.hasText(queryDTO.getCustomField())) {
        queryWrapper.like("custom_field", queryDTO.getCustomField());
    }
    return this;
}
```

## 🚀 **使用建议**

### 1. **选择 QueryBuilder 方案**

- **简单项目**: 使用 `UserQueryBuilder`
- **复杂项目**: 使用 `UserQueryBuilderV2` (Builder 模式)

### 2. **测试策略**

```java
// 单元测试QueryBuilder
@Test
public void testQueryBuilder() {
    // 测试各种查询条件组合
}

// 集成测试Service
@Test
public void testServiceWithQueryBuilder() {
    // 测试Service与QueryBuilder的集成
}
```

### 3. **扩展建议**

- 为不同的查询场景创建专门的 QueryBuilder
- 使用工厂模式管理不同的 QueryBuilder
- 考虑使用策略模式处理不同的查询策略

## 🎉 **总结**

通过这次重构，我们成功实现了：

- ✅ **职责分离**: DTO、QueryBuilder、Service 各司其职
- ✅ **可测试性**: 查询逻辑可以独立测试
- ✅ **可维护性**: 查询逻辑集中管理，易于维护
- ✅ **可扩展性**: 易于添加新的查询条件和功能
- ✅ **设计原则**: 遵循 SOLID 原则，代码质量更高

这种架构设计特别适合企业级项目，展示了良好的软件工程实践和架构设计能力！
