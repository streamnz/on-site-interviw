-- Test data for integration tests
-- This file contains sample data for testing purposes

-- Insert test users for integration tests
INSERT OR IGNORE INTO users (username, password, email, full_name, enabled) 
VALUES 
('testuser1', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'testuser1@example.com', 'Test User 1', 1),
('testuser2', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'testuser2@example.com', 'Test User 2', 1),
('testuser3', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'testuser3@example.com', 'Test User 3', 1),
('searchuser', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'searchuser@example.com', 'Search Test User', 1),
('paginationuser', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'paginationuser@example.com', 'Pagination Test User', 1); 