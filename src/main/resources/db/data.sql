-- Sample users data
INSERT OR IGNORE INTO users (username, password, email, full_name, role) 
VALUES 
('user1', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user1@example.com', 'User One', 'USER'),
('user2', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user2@example.com', 'User Two', 'USER');
