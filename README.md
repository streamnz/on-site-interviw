# User Management System

A modern user management system based on Spring Boot 3.2.5, featuring JWT authentication, RBAC permission control, and comprehensive user management functionality.

## 🚀 Features

- **🔐 JWT Authentication**: User authentication mechanism based on JWT tokens
- **👥 User Management**: Complete user CRUD operations with pagination
- **🎭 Role-based Access Control**: RBAC system for permission management
- **📊 Pagination & Search**: Support for conditional queries and pagination
- **📈 Performance Monitoring**: Request performance tracking and database connection pool monitoring
- **🛡️ Security Protection**: Input validation, exception handling, and security filters
- **📚 API Documentation**: Complete Swagger/OpenAPI 3.0 documentation
- **🔧 Development Tools**: Snowflake ID generator, date formatting, and utility tools

## 🛠️ Technology Stack

| Technology          | Version | Description         |
| ------------------- | ------- | ------------------- |
| **Spring Boot**     | 3.2.5   | Core framework      |
| **Spring Security** | 6.2.4   | Security framework  |
| **MyBatis-Plus**    | 3.5.6   | ORM framework       |
| **SQLite**          | 3.43.2  | Database            |
| **HikariCP**        | 5.0.1   | Connection pool     |
| **JWT**             | 0.12.3  | JWT support         |
| **OpenAPI**         | 2.3.0   | API documentation   |
| **Java**            | 21      | Runtime environment |

## 📋 Quick Start

### Prerequisites

- Java 21+
- Maven 3.6+

### Start Application

```bash
# Clone the project
git clone <repository-url>
cd on-site-interview

# Compile the project
mvn clean compile

# Start the application
mvn spring-boot:run
```

The application will start at `http://localhost:8080`.

### Default User Accounts

| Username | Password | Role  | Description          |
| -------- | -------- | ----- | -------------------- |
| `admin`  | `admin`  | ADMIN | System administrator |
| `user1`  | `admin`  | USER  | Regular user         |
| `user2`  | `admin`  | USER  | Regular user         |
| `guest`  | `admin`  | GUEST | Guest user           |

## 🧪 API Testing

### 1. Health Check

```bash
curl http://localhost:8080/actuator/health
```

### 2. Test Endpoints

```bash
# Hello World test
curl http://localhost:8080/api/test/hello

# Service health check
curl http://localhost:8080/api/test/health

# Snowflake ID generation test
curl http://localhost:8080/api/test/snowflake/generate
```

### 3. User Authentication

```bash
# User login
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"username":"admin","password":"admin"}'

# User registration
curl -X POST http://localhost:8080/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "username":"newuser",
    "password":"password123",
    "email":"newuser@example.com",
    "fullName":"New User"
  }'
```

### 4. User Management (Authentication Required)

```bash
# After obtaining JWT token, add to request header:
# Authorization: Bearer <your-jwt-token>

# Get user list
curl -H "Authorization: Bearer <token>" \
  http://localhost:8080/api/users

# Create user
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

## 📖 API Documentation

After starting the application, visit the following URLs to view complete API documentation:

- **Swagger UI**: http://localhost:8080/swagger-ui.html
- **OpenAPI JSON**: http://localhost:8080/v3/api-docs

## 🏗️ Project Structure

```
src/main/java/com/streamnz/
├── Main.java                    # Application entry point
├── annotation/                  # Custom annotations
├── config/                      # Configuration classes
│   ├── security/               # Security configuration
│   ├── database/               # Database configuration
│   ├── SwaggerConfig.java      # API documentation config
│   └── JacksonConfig.java      # JSON configuration
├── controller/                  # REST controllers
├── service/                     # Business logic layer
├── mapper/                      # Data access layer
├── model/                       # Data models
│   ├── entity/                 # Entity classes
│   ├── dto/                    # Data transfer objects
│   ├── vo/                     # View objects
│   └── security/               # Security-related models
├── filter/                      # Filters
├── interceptor/                 # Interceptors
├── exception/                   # Exception handling
├── util/                        # Utility classes
├── enums/                       # Enum classes
└── constant/                    # Constant classes
```

## 🔧 Configuration

### Database Configuration

The application uses SQLite database, with the database file located at `sql-lite/identifier.sqlite`.

### JWT Configuration

JWT-related configuration in `application.yml`:

```yaml
jwt:
  secret: your-secret-key-here-make-it-long-enough-for-security-at-least-256-bits
  expiration: 86400000 # 24 hours (milliseconds)
```

### Connection Pool Monitoring

Visit `http://localhost:8080/actuator/hikaricp` to view connection pool status.

## 🚨 Known Issues

1. **Authentication Issues**: Current login endpoint has 500 errors, possibly due to database initialization or authentication configuration issues
2. **User Passwords**: All default user passwords are `admin`, recommend changing for production environment

## 🔄 Development Status

- ✅ Basic framework setup completed
- ✅ Database model design completed
- ✅ API interface definitions completed
- ✅ Swagger documentation configuration completed
- ⚠️ User authentication functionality needs debugging
- ⚠️ Permission control needs comprehensive testing
- ⚠️ Unit tests need supplementation

## 📞 Support

If you encounter issues, please check:

1. Application log output
2. Swagger API documentation
3. Database initialization scripts

---

**Note**: This is a development version and is not recommended for direct production use.
