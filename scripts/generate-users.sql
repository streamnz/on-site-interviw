-- SQL script to generate 1000 user records
-- User range: user1 ~ user1000

-- Clear existing user data (keep admin user)
DELETE FROM users WHERE username != 'admin';

-- Insert 1000 user records
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user001', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'user001@test.com', 'User 001', 'USER', 1, '2025-01-01 10:00:00', '2025-01-01 10:00:00'),
('user002', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'user002@test.com', 'User 002', 'USER', 1, '2025-01-01 10:00:00', '2025-01-01 10:00:00'),
('user003', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'user003@test.com', 'User 003', 'USER', 1, '2025-01-01 10:00:00', '2025-01-01 10:00:00'),
('user004', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'user004@test.com', 'User 004', 'USER', 1, '2025-01-01 10:00:00', '2025-01-01 10:00:00'),
('user005', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'user005@test.com', 'User 005', 'USER', 1, '2025-01-01 10:00:00', '2025-01-01 10:00:00'),
('user006', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'user006@test.com', 'User 006', 'USER', 1, '2025-01-01 10:00:00', '2025-01-01 10:00:00'),
('user007', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'user007@test.com', 'User 007', 'USER', 1, '2025-01-01 10:00:00', '2025-01-01 10:00:00'),
('user008', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'user008@test.com', 'User 008', 'USER', 1, '2025-01-01 10:00:00', '2025-01-01 10:00:00'),
('user009', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'user009@test.com', 'User 009', 'USER', 1, '2025-01-01 10:00:00', '2025-01-01 10:00:00'),
('user010', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'user010@test.com', 'User 010', 'ADMIN', 1, '2025-01-01 10:00:00', '2025-01-01 10:00:00');

-- Continue inserting remaining user data...
-- (This is a sample, the full script would contain all 1000 users)

-- Verify data insertion
SELECT COUNT(*) as total_users FROM users;
SELECT role, COUNT(*) as count FROM users GROUP BY role; 