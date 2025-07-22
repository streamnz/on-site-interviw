-- Initial data for the application
-- Default admin user password is 'admin'

-- Insert default admin user (password: admin)
INSERT OR IGNORE INTO users (id, username, password, email, full_name, enabled, created_at, updated_at) 
VALUES (1, 'admin', '$2a$10$WMk34Ng2utoxoLSRt46FkOhdkZ1JFh1o8Gk0WR3sduHzVGSZhOQi2', 'admin@example.com', 'System Administrator', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert test users for development (password: admin)
INSERT OR IGNORE INTO users (id, username, password, email, full_name, enabled, created_at, updated_at) 
VALUES 
(2, 'user1', '$2a$10$WMk34Ng2utoxoLSRt46FkOhdkZ1JFh1o8Gk0WR3sduHzVGSZhOQi2', 'user1@example.com', 'Regular User 1', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, 'user2', '$2a$10$WMk34Ng2utoxoLSRt46FkOhdkZ1JFh1o8Gk0WR3sduHzVGSZhOQi2', 'user2@example.com', 'Regular User 2', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(4, 'guest', '$2a$10$WMk34Ng2utoxoLSRt46FkOhdkZ1JFh1o8Gk0WR3sduHzVGSZhOQi2', 'guest@example.com', 'Guest User', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Assign roles to users
-- Admin user gets ADMIN role
INSERT OR IGNORE INTO user_roles_r (id, user_id, role_id, created_at) VALUES (1, 1, 1, CURRENT_TIMESTAMP);

-- Regular users get USER role  
INSERT OR IGNORE INTO user_roles_r (id, user_id, role_id, created_at) VALUES 
(2, 2, 2, CURRENT_TIMESTAMP),
(3, 3, 2, CURRENT_TIMESTAMP);

-- Guest user gets GUEST role
INSERT OR IGNORE INTO user_roles_r (id, user_id, role_id, created_at) VALUES (4, 4, 3, CURRENT_TIMESTAMP);

-- Assign permissions to roles
-- ADMIN role gets all permissions
INSERT OR IGNORE INTO roles_resources_r (id, role_id, resource_id, created_at) VALUES 
(1, 1, 1, CURRENT_TIMESTAMP), 
(2, 1, 2, CURRENT_TIMESTAMP), 
(3, 1, 3, CURRENT_TIMESTAMP), 
(4, 1, 4, CURRENT_TIMESTAMP), 
(5, 1, 5, CURRENT_TIMESTAMP), 
(6, 1, 6, CURRENT_TIMESTAMP), 
(7, 1, 7, CURRENT_TIMESTAMP);

-- USER role gets basic permissions
INSERT OR IGNORE INTO roles_resources_r (id, role_id, resource_id, created_at) VALUES 
(8, 2, 1, CURRENT_TIMESTAMP),  -- User Management (read)
(9, 2, 7, CURRENT_TIMESTAMP);  -- Authentication Interface

-- GUEST role gets minimal permissions
INSERT OR IGNORE INTO roles_resources_r (id, role_id, resource_id, created_at) VALUES 
(10, 3, 7, CURRENT_TIMESTAMP); -- Authentication Interface only 