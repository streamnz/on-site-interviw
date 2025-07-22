# RBAC (Role-Based Access Control) 系统实现

## 📋 概述

本项目实现了一个完整的基于角色的访问控制（RBAC）系统，包括 JWT 认证、用户管理、角色管理和权限控制。

## 🏗️ 系统架构

### 数据库设计

#### 核心表结构

1. **users** - 用户表

   ```sql
   CREATE TABLE users (
       id BIGINT PRIMARY KEY,
       username VARCHAR(50) NOT NULL UNIQUE,
       password VARCHAR(100) NOT NULL,
       email VARCHAR(100) UNIQUE,
       full_name VARCHAR(100),
       enabled BOOLEAN NOT NULL DEFAULT TRUE,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );
   ```

2. **roles** - 角色表

   ```sql
   CREATE TABLE roles (
       id BIGINT PRIMARY KEY,
       name VARCHAR(50) NOT NULL UNIQUE,
       description VARCHAR(200),
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );
   ```

3. **resources** - 资源表

   ```sql
   CREATE TABLE resources (
       id BIGINT PRIMARY KEY,
       name VARCHAR(100) NOT NULL UNIQUE,
       path VARCHAR(200) NOT NULL,
       method VARCHAR(10) NOT NULL,
       description VARCHAR(200),
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );
   ```

4. **user_roles_r** - 用户角色关系表

   ```sql
   CREATE TABLE user_roles_r (
       id BIGINT PRIMARY KEY,
       user_id BIGINT NOT NULL,
       role_id BIGINT NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
       FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
       UNIQUE(user_id, role_id)
   );
   ```

5. **roles_resources_r** - 角色资源关系表
   ```sql
   CREATE TABLE roles_resources_r (
       id BIGINT PRIMARY KEY,
       role_id BIGINT NOT NULL,
       resource_id BIGINT NOT NULL,
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
       FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE,
       UNIQUE(role_id, resource_id)
   );
   ```

### 默认数据

系统预置了以下默认数据：

- **角色**: ADMIN（系统管理员）、USER（普通用户）、GUEST（访客用户）
- **资源**: 用户管理、角色管理、资源管理等 API 接口
- **管理员用户**: admin/password
- **权限分配**: ADMIN 角色拥有所有资源的访问权限

## 🔐 认证机制

### JWT (JSON Web Token)

系统使用 JWT 进行无状态认证：

- **令牌生成**: 用户登录成功后生成 JWT 令牌
- **令牌验证**: 每个请求通过 JWT 过滤器验证令牌
- **令牌过期**: 默认 24 小时过期时间
- **安全配置**: 使用 HMAC-SHA256 算法签名

### 认证流程

1. **用户登录** → 验证用户名密码 → 生成 JWT 令牌
2. **API 访问** → 验证 JWT 令牌 → 检查用户权限
3. **权限控制** → 基于角色和资源进行访问控制

## 🛡️ 安全配置

### Spring Security 配置

```java
@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {
    // JWT过滤器
    // 无状态会话管理
    // 密码加密（BCrypt）
    // 认证提供者配置
}
```

### 密码加密

使用 BCrypt 算法进行密码加密：

- 默认管理员密码: `password` → `$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi`

## 📡 API 接口

### 认证接口

#### 用户登录

```http
POST /api/auth/login
Content-Type: application/json

{
    "username": "admin",
    "password": "password"
}
```

#### 用户注册

```http
POST /api/auth/register
Content-Type: application/json

{
    "username": "newuser",
    "password": "password123",
    "email": "user@example.com",
    "fullName": "张三"
}
```

#### 用户登出

```http
POST /api/auth/logout
Authorization: Bearer <token>
```

#### 获取当前用户信息

```http
GET /api/auth/me
Authorization: Bearer <token>
```

### 响应格式

```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "tokenType": "Bearer",
  "userInfo": {
    "id": 1,
    "username": "admin",
    "email": "admin@example.com",
    "fullName": "Admin User",
    "roles": ["ADMIN"]
  }
}
```

## 🔧 技术栈

### 后端技术

- **Spring Boot 3.2.5** - 主框架
- **Spring Security** - 安全框架
- **JWT** - 无状态认证
- **MyBatis-Plus** - ORM 框架
- **SQLite** - 数据库
- **BCrypt** - 密码加密
- **Swagger/OpenAPI** - API 文档

### 核心组件

1. **JwtUtils** - JWT 工具类
2. **JwtAuthenticationFilter** - JWT 认证过滤器
3. **UserDetailsServiceImpl** - 用户详情服务
4. **AuthService** - 认证服务
5. **SecurityConfig** - 安全配置

## 🚀 快速开始

### 1. 启动应用

```bash
mvn spring-boot:run
```

### 2. 访问 Swagger 文档

```
http://localhost:8080/swagger-ui.html
```

### 3. 运行测试脚本

```bash
./scripts/test-rbac.sh
```

### 4. 测试认证流程

#### 注册新用户

```bash
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser",
    "password": "password123",
    "email": "test@example.com",
    "fullName": "Test User"
  }'
```

#### 用户登录

```bash
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "username": "admin",
    "password": "password"
  }'
```

#### 访问受保护的接口

```bash
curl -X GET http://localhost:8080/api/auth/me \
  -H "Authorization: Bearer <your-jwt-token>"
```

## 📊 数据库查询示例

### 查询用户角色

```sql
SELECT r.name
FROM roles r
INNER JOIN user_roles_r urr ON r.id = urr.role_id
WHERE urr.user_id = 1;
```

### 查询角色权限

```sql
SELECT res.name, res.path, res.method
FROM resources res
INNER JOIN roles_resources_r rrr ON res.id = rrr.resource_id
WHERE rrr.role_id = 1;
```

### 查询用户权限

```sql
SELECT DISTINCT res.name, res.path, res.method
FROM resources res
INNER JOIN roles_resources_r rrr ON res.id = rrr.resource_id
INNER JOIN user_roles_r urr ON rrr.role_id = urr.role_id
WHERE urr.user_id = 1;
```

## 🔍 权限控制

### 基于角色的访问控制

1. **用户** → **角色** → **资源**
2. **多对多关系**: 用户可以拥有多个角色，角色可以访问多个资源
3. **权限继承**: 用户继承其所有角色的权限

### 权限检查流程

1. 用户请求 API
2. JWT 过滤器验证令牌
3. 加载用户角色和权限
4. 检查用户是否有访问该资源的权限
5. 允许或拒绝访问

## 📝 开发说明

### 添加新的受保护接口

1. 在 Controller 方法上添加`@PreAuthorize`注解
2. 在 resources 表中添加对应的资源记录
3. 在 roles_resources_r 表中分配权限

### 添加新的角色

1. 在 roles 表中插入新角色
2. 在 resources 表中定义该角色可访问的资源
3. 在 roles_resources_r 表中建立关联

### 自定义权限检查

```java
@PreAuthorize("hasRole('ADMIN')")
@GetMapping("/admin-only")
public ResponseEntity<String> adminOnly() {
    return ResponseEntity.ok("Admin only content");
}
```

## 🧪 测试

### 自动化测试脚本

- `scripts/test-rbac.sh` - 完整的 RBAC 功能测试

### 手动测试

1. 使用 Swagger UI 进行 API 测试
2. 使用 Postman 进行接口调试
3. 使用 curl 命令行工具

## 🔒 安全最佳实践

1. **JWT 密钥**: 使用足够长的随机密钥
2. **密码策略**: 强制使用强密码
3. **令牌过期**: 设置合理的过期时间
4. **HTTPS**: 生产环境使用 HTTPS
5. **输入验证**: 所有输入都进行验证
6. **SQL 注入防护**: 使用参数化查询

## 📈 扩展功能

### 可扩展的功能

1. **权限组**: 将权限组织成权限组
2. **动态权限**: 运行时动态调整权限
3. **审计日志**: 记录用户操作日志
4. **会话管理**: 管理用户会话
5. **多租户**: 支持多租户架构

### 性能优化

1. **缓存**: 缓存用户权限信息
2. **索引**: 为常用查询添加数据库索引
3. **分页**: 大数据量查询使用分页
4. **连接池**: 优化数据库连接池配置

## 🐛 故障排除

### 常见问题

1. **JWT 令牌无效**

   - 检查令牌是否过期
   - 验证令牌签名是否正确

2. **权限不足**

   - 检查用户角色配置
   - 验证资源权限分配

3. **数据库连接问题**
   - 检查 SQLite 文件权限
   - 验证数据库文件路径

### 日志调试

启用 DEBUG 日志级别：

```yaml
logging:
  level:
    com.streamnz: DEBUG
    org.springframework.security: DEBUG
```

## 📚 参考资料

- [Spring Security 官方文档](https://docs.spring.io/spring-security/reference/)
- [JWT 官方文档](https://jwt.io/)
- [MyBatis-Plus 官方文档](https://baomidou.com/pages/24112f/)
- [RBAC 模型](https://en.wikipedia.org/wiki/Role-based_access_control)
