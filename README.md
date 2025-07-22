# 用户管理系统 (User Management System)

基于 Spring Boot 3.2.5 的现代化用户管理系统，支持 JWT 认证、RBAC 权限控制和完整的用户管理功能。

## 🚀 功能特性

- **🔐 JWT 认证**: 基于 JWT Token 的用户认证机制
- **👥 用户管理**: 完整的用户 CRUD 操作和分页查询
- **🎭 角色权限**: 基于角色的访问控制 (RBAC) 系统
- **📊 分页查询**: 支持条件查询和分页显示
- **📈 性能监控**: 请求性能追踪和数据库连接池监控
- **🛡️ 安全防护**: 输入验证、异常处理和安全过滤器
- **📚 API 文档**: 完整的 Swagger/OpenAPI 3.0 文档
- **🔧 开发工具**: 雪花 ID 生成器、日期格式化等实用工具

## 🛠️ 技术栈

| 技术                | 版本   | 说明     |
| ------------------- | ------ | -------- |
| **Spring Boot**     | 3.2.5  | 核心框架 |
| **Spring Security** | 6.2.4  | 安全框架 |
| **MyBatis-Plus**    | 3.5.6  | ORM 框架 |
| **SQLite**          | 3.43.2 | 数据库   |
| **HikariCP**        | 5.0.1  | 连接池   |
| **JWT**             | 0.12.3 | JWT 支持 |
| **OpenAPI**         | 2.3.0  | API 文档 |
| **Java**            | 21     | 运行环境 |

## 📋 快速开始

### 环境要求

- Java 21+
- Maven 3.6+

### 启动应用

```bash
# 克隆项目
git clone <repository-url>
cd on-site-interview

# 编译项目
mvn clean compile

# 启动应用
mvn spring-boot:run
```

应用将在 `http://localhost:8080` 启动。

### 默认用户账号

| 用户名  | 密码    | 角色  | 说明       |
| ------- | ------- | ----- | ---------- |
| `admin` | `admin` | ADMIN | 系统管理员 |
| `user1` | `admin` | USER  | 普通用户   |
| `user2` | `admin` | USER  | 普通用户   |
| `guest` | `admin` | GUEST | 访客用户   |

## 🧪 API 测试

### 1. 健康检查

```bash
curl http://localhost:8080/actuator/health
```

### 2. 测试端点

```bash
# Hello World 测试
curl http://localhost:8080/api/test/hello

# 服务健康检查
curl http://localhost:8080/api/test/health

# 雪花ID生成测试
curl http://localhost:8080/api/test/snowflake/generate
```

### 3. 用户认证

```bash
# 用户登录
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin"}'

# 用户注册
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username":"newuser",
    "password":"password123",
    "email":"newuser@example.com",
    "fullName":"New User"
  }'
```

### 4. 用户管理 (需要认证)

```bash
# 获取JWT Token后，在请求头中添加：
# Authorization: Bearer <your-jwt-token>

# 获取用户列表
curl -H "Authorization: Bearer <token>" \
  http://localhost:8080/api/users

# 创建用户
curl -X POST http://localhost:8080/api/users \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <token>" \
  -d '{
    "username":"testuser",
    "password":"password123",
    "email":"test@example.com",
    "fullName":"Test User"
  }'
```

## 📖 API 文档

启动应用后，访问以下地址查看完整的 API 文档：

- **Swagger UI**: http://localhost:8080/swagger-ui.html
- **OpenAPI JSON**: http://localhost:8080/v3/api-docs

## 🏗️ 项目结构

```
src/main/java/com/streamnz/
├── Main.java                    # 应用入口
├── annotation/                  # 自定义注解
├── config/                      # 配置类
│   ├── security/               # 安全配置
│   ├── database/               # 数据库配置
│   ├── SwaggerConfig.java      # API文档配置
│   └── JacksonConfig.java      # JSON配置
├── controller/                  # REST控制器
├── service/                     # 业务逻辑层
├── mapper/                      # 数据访问层
├── model/                       # 数据模型
│   ├── entity/                 # 实体类
│   ├── dto/                    # 数据传输对象
│   ├── vo/                     # 视图对象
│   └── security/               # 安全相关模型
├── filter/                      # 过滤器
├── interceptor/                 # 拦截器
├── exception/                   # 异常处理
├── util/                        # 工具类
├── enums/                       # 枚举类
└── constant/                    # 常量类
```

## 🔧 配置说明

### 数据库配置

应用使用 SQLite 数据库，数据库文件位于 `sql-lite/identifier.sqlite`。

### JWT 配置

JWT 相关配置在 `application.yml` 中：

```yaml
jwt:
  secret: your-secret-key-here-make-it-long-enough-for-security-at-least-256-bits
  expiration: 86400000 # 24小时 (毫秒)
```

### 连接池监控

访问 `http://localhost:8080/actuator/hikaricp` 查看连接池状态。

## 🚨 已知问题

1. **认证问题**: 当前登录接口存在 500 错误，可能是数据库初始化或认证配置问题
2. **用户密码**: 所有默认用户密码都是 `admin`，建议生产环境修改

## 🔄 开发状态

- ✅ 基础框架搭建完成
- ✅ 数据库模型设计完成
- ✅ API 接口定义完成
- ✅ Swagger 文档配置完成
- ⚠️ 用户认证功能需要调试
- ⚠️ 权限控制需要完善测试
- ⚠️ 单元测试需要补充

## 📞 支持

如有问题，请查看：

1. 应用日志输出
2. Swagger API 文档
3. 数据库初始化脚本

---

**注意**: 这是一个开发版本，不建议直接用于生产环境。
