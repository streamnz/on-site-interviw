# User Management System

A comprehensive Spring Boot application for user management with DTO validation and RESTful API endpoints.

## Features

- **User CRUD Operations**: Create, read, update, and delete users
- **DTO Validation**: Comprehensive validation using Jakarta Validation
- **RESTful API**: Clean and consistent API design
- **Pagination**: Efficient pagination with MyBatis-Plus
- **Conditional Queries**: Flexible search with multiple criteria
- **Security**: Password encoding with BCrypt
- **Documentation**: Swagger/OpenAPI documentation

## Technology Stack

- **Spring Boot 3.2.5**
- **Java 21**
- **MyBatis-Plus**: ORM framework
- **SQLite**: Database
- **Spring Security**: Security framework
- **Jakarta Validation**: Data validation
- **Lombok**: Boilerplate code reduction
- **Swagger/OpenAPI**: API documentation

## Project Structure

```
src/main/java/com/streamnz/
├── config/           # Configuration classes
├── controller/       # REST controllers
├── entity/          # Entity classes
├── mapper/          # MyBatis mappers
├── model/
│   ├── dto/         # Data Transfer Objects
│   └── vo/          # View Objects
├── query/           # Query builders
├── service/         # Business logic
└── exception/       # Exception handlers
```

## API Endpoints

### User Management

- `POST /api/users/create` - Create user with validation
- `PUT /api/users/update` - Update user with validation
- `GET /api/users/{id}` - Get user by ID
- `DELETE /api/users/{id}` - Delete user
- `POST /api/users/pageQuery` - Search users with pagination

### Legacy API (for backward compatibility)

- `POST /api/test/create` - Legacy user creation
- `PUT /api/test/{id}` - Legacy user update
- `GET /api/test/{id}` - Legacy user query
- `DELETE /api/test/{id}` - Legacy user deletion

## DTO Validation

### UserCreateDTO

- Username: 3-50 characters, alphanumeric + underscore
- Password: 6-100 characters, lowercase + uppercase + number
- Email: Valid format, whitelisted domains
- Full name: 2-100 characters, letters + spaces
- Role: ADMIN/MANAGER/USER only
- Custom validations: Password confirmation, sensitive word filtering

### UserUpdateDTO

- ID: Required, must be > 0
- All other fields optional
- At least one field must be provided for update
- Password confirmation required when password is updated

## Getting Started

### Prerequisites

- Java 21
- Maven 3.6+

### Running the Application

```bash
# Clone the repository
git clone <repository-url>

# Navigate to project directory
cd on-site-interview

# Build the project
mvn clean compile

# Run the application
mvn spring-boot:run
```

### Testing

```bash
# Run all tests
mvn test

# Run specific test class
mvn test -Dtest=UserControllerTest

# Run API test script
./src/test/scripts/test-user-controller-api.sh
```

### API Documentation

Access Swagger UI at: http://localhost:8080/swagger-ui.html

## Database

The application uses SQLite with the following schema:

```sql
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'USER',
    enabled INTEGER NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
```

## Configuration

Key configuration in `application.yml`:

- Server port: 8080
- Database: SQLite (identifier.sqlite)
- Logging: DEBUG level for application packages
- Swagger: Available at /swagger-ui.html

## Development

### Adding New Features

1. Create DTOs for data validation
2. Implement service layer business logic
3. Add controller endpoints
4. Write comprehensive tests
5. Update documentation

### Code Style

- Use English for all comments, messages, and documentation
- Follow Java naming conventions
- Use Lombok for boilerplate reduction
- Implement proper exception handling

## Testing

The project includes comprehensive test scripts:

- DTO validation testing
- Conditional query testing
- API endpoint testing
- Error handling validation

## Future Enhancements

- JWT Authentication
- Role-based Access Control
- Password Reset functionality
- Email Verification
- Audit Logging
- Rate Limiting

## License

This project is for demonstration purposes.
