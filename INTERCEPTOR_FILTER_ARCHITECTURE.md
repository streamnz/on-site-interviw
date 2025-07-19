# 拦截器和过滤器架构说明

## 概述

本项目实现了完整的拦截器和过滤器架构，提供了请求处理、认证、性能监控等功能。

## 架构设计

### 📁 **包结构**

```
src/main/java/com/streamnz/
├── filter/                    # 过滤器包
│   ├── JwtAuthenticationFilter.java    # JWT认证过滤器
│   └── RequestLoggingFilter.java       # 请求日志过滤器
├── interceptor/               # 拦截器包
│   ├── AuthenticationInterceptor.java  # 认证拦截器
│   └── PerformanceInterceptor.java     # 性能监控拦截器
└── config/                   # 配置包
    ├── WebMvcConfig.java             # Web MVC配置
    └── security/
        └── SecurityConfig.java        # 安全配置
```

## 🔧 **过滤器 (Filters)**

### 1. JWT 认证过滤器

- **文件**: `src/main/java/com/streamnz/filter/JwtAuthenticationFilter.java`
- **功能**:
  - 解析 JWT 令牌
  - 验证用户身份
  - 设置 Spring Security 上下文
- **执行顺序**: 在 Spring Security 过滤器链中执行

### 2. 请求日志过滤器

- **文件**: `src/main/java/com/streamnz/filter/RequestLoggingFilter.java`
- **功能**:
  - 记录请求和响应详情
  - 生成唯一请求 ID
  - 计算请求处理时间
  - 记录请求体内容（非 GET 请求）

## 🎯 **拦截器 (Interceptors)**

### 1. 性能监控拦截器

- **文件**: `src/main/java/com/streamnz/interceptor/PerformanceInterceptor.java`
- **功能**:
  - 监控请求处理时间
  - 检测慢请求（>1000ms）
  - 记录性能指标
  - 提供详细的请求处理日志

### 2. 认证拦截器

- **文件**: `src/main/java/com/streamnz/interceptor/AuthenticationInterceptor.java`
- **功能**:
  - 提供额外的认证检查
  - 管理公开路径访问
  - 添加用户上下文信息到请求属性
  - 统一的未授权响应处理

## ⚙️ **配置类**

### 1. Web MVC 配置

- **文件**: `src/main/java/com/streamnz/config/WebMvcConfig.java`
- **功能**:
  - 注册拦截器
  - 配置拦截器路径匹配
  - 设置拦截器执行顺序

### 2. 安全配置

- **文件**: `src/main/java/com/streamnz/config/security/SecurityConfig.java`
- **功能**:
  - 配置过滤器链
  - 设置 CORS 支持
  - 管理认证提供者

## 🚀 **执行流程**

```
HTTP请求
    ↓
RequestLoggingFilter (记录请求)
    ↓
CorsFilter (CORS处理)
    ↓
JwtAuthenticationFilter (JWT认证)
    ↓
Spring Security过滤器链
    ↓
PerformanceInterceptor (性能监控)
    ↓
AuthenticationInterceptor (认证检查)
    ↓
Controller (业务逻辑)
    ↓
PerformanceInterceptor (完成监控)
    ↓
RequestLoggingFilter (记录响应)
    ↓
HTTP响应
```

## 📊 **功能特性**

### ✅ **过滤器特性**

- **JWT 认证**: 自动解析和验证 JWT 令牌
- **请求日志**: 完整的请求/响应日志记录
- **CORS 支持**: 跨域资源共享配置
- **内容缓存**: 支持请求体内容读取

### ✅ **拦截器特性**

- **性能监控**: 实时性能指标收集
- **慢请求检测**: 自动识别和处理慢请求
- **认证增强**: 额外的认证和授权检查
- **用户上下文**: 自动注入用户信息到请求

### ✅ **配置特性**

- **灵活路径匹配**: 支持通配符和排除路径
- **执行顺序控制**: 精确控制过滤器/拦截器顺序
- **条件执行**: 基于路径和条件的执行控制

## 🧪 **测试接口**

### 1. 性能监控测试

```bash
curl -s "http://localhost:8080/api/test/interceptor/performance"
```

### 2. 认证拦截器测试

```bash
curl -s "http://localhost:8080/api/test/interceptor/auth" \
  -H "Authorization: Bearer <jwt-token>"
```

### 3. 慢请求检测测试

```bash
curl -s "http://localhost:8080/api/test/interceptor/slow" \
  -H "Authorization: Bearer <jwt-token>"
```

## 📝 **日志示例**

### 请求日志

```
INFO  c.s.filter.RequestLoggingFilter - Request [b7a4f31a] GET /api/test/interceptor/performance from 0:0:0:0:0:0:0:1
INFO  c.s.filter.RequestLoggingFilter - Response [b7a4f31a] 200 /api/test/interceptor/performance - 195ms
```

### 性能监控日志

```
DEBUG c.s.i.PerformanceInterceptor - Starting request processing for: GET /api/test/interceptor/performance
DEBUG c.s.i.PerformanceInterceptor - Request completed: GET /api/test/interceptor/performance - 176ms - Status: 200
WARN  c.s.i.PerformanceInterceptor - Slow request detected: GET /api/test/interceptor/slow took 1506ms
```

### 认证日志

```
DEBUG c.s.i.AuthenticationInterceptor - Authenticated user 'admin' accessing: /api/test/interceptor/auth
INFO  c.s.c.InterceptorTestController - Authentication interceptor test - User: admin, Authorities: [ROLE_ADMIN]
```

## 🎯 **优势**

### 1. **架构清晰**

- 过滤器处理底层 HTTP 请求
- 拦截器处理业务逻辑层面
- 配置类统一管理

### 2. **功能完整**

- 认证和授权
- 性能监控
- 日志记录
- 错误处理

### 3. **易于扩展**

- 模块化设计
- 松耦合架构
- 标准化接口

### 4. **生产就绪**

- 完整的错误处理
- 详细的日志记录
- 性能优化
- 安全考虑

## 🔧 **配置说明**

### 拦截器路径配置

```java
// 性能监控拦截器 - 应用于所有请求
registry.addInterceptor(performanceInterceptor)
    .addPathPatterns("/**")
    .excludePathPatterns("/actuator/**", "/error");

// 认证拦截器 - 应用于API请求
registry.addInterceptor(authenticationInterceptor)
    .addPathPatterns("/api/**")
    .excludePathPatterns(
        "/api/auth/**",
        "/api/test/date-format/**",
        "/actuator/**"
    );
```

### 过滤器链配置

```java
.addFilterBefore(requestLoggingFilter, UsernamePasswordAuthenticationFilter.class)
.addFilterBefore(jwtAuthFilter, RequestLoggingFilter.class);
```

## 📈 **监控指标**

- **请求处理时间**: 毫秒级精度
- **慢请求检测**: 自动识别>1000ms 的请求
- **认证成功率**: 用户认证统计
- **错误率**: 请求失败统计
- **吞吐量**: 请求处理能力

## 🔒 **安全特性**

- **JWT 令牌验证**: 安全的身份认证
- **CORS 配置**: 跨域安全控制
- **路径保护**: 细粒度的访问控制
- **错误处理**: 安全的错误响应

这个架构为项目提供了完整的请求处理、监控和安全保障体系。
