-- Users table schema
CREATE TABLE IF NOT EXISTS users (
    id BIGINT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    full_name VARCHAR(100),
    enabled BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Roles table schema
CREATE TABLE IF NOT EXISTS roles (
    id BIGINT PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Resources table schema
CREATE TABLE IF NOT EXISTS resources (
    id BIGINT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    path VARCHAR(200) NOT NULL,
    method VARCHAR(10) NOT NULL,
    description VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User-Role relation table
CREATE TABLE IF NOT EXISTS user_roles_r (
    id BIGINT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    UNIQUE(user_id, role_id)
);

-- Role-Resource relation table
CREATE TABLE IF NOT EXISTS roles_resources_r (
    id BIGINT PRIMARY KEY,
    role_id BIGINT NOT NULL,
    resource_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE,
    FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE,
    UNIQUE(role_id, resource_id)
);

-- Insert default roles
INSERT OR IGNORE INTO roles (id, name, description) VALUES 
(1, 'ADMIN', 'System Administrator'),
(2, 'USER', 'Regular User'),
(3, 'GUEST', 'Guest User');

-- Insert default resources
INSERT OR IGNORE INTO resources (id, name, path, method, description) VALUES 
(1, 'User Management', '/api/users/**', 'GET', 'User management related interfaces'),
(2, 'User Creation', '/api/users', 'POST', 'Create user'),
(3, 'User Update', '/api/users/**', 'PUT', 'Update user information'),
(4, 'User Deletion', '/api/users/**', 'DELETE', 'Delete user'),
(5, 'Role Management', '/api/roles/**', 'GET', 'Role management related interfaces'),
(6, 'Resource Management', '/api/resources/**', 'GET', 'Resource management related interfaces'),
(7, 'Authentication Interface', '/api/auth/**', 'POST', 'User authentication related interfaces');

-- Insert default admin user
INSERT OR IGNORE INTO users (id, username, password, email, full_name) 
VALUES (1, 'admin', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'admin@example.com', 'Admin User');

-- Assign admin role to admin user
INSERT OR IGNORE INTO user_roles_r (id, user_id, role_id) VALUES (1, 1, 1);

-- Assign all resources to admin role
INSERT OR IGNORE INTO roles_resources_r (id, role_id, resource_id) VALUES 
(1, 1, 1), (2, 1, 2), (3, 1, 3), (4, 1, 4), (5, 1, 5), (6, 1, 6), (7, 1, 7);
