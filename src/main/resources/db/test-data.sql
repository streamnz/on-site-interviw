-- 测试数据脚本：插入1000条用户数据
-- 密码统一为: "password123" (BCrypt加密后)
-- 生成用户名格式: user001, user002, ... user1000
-- 邮箱格式: user001@test.com, user002@test.com, ...
-- 全名格式: Test User 001, Test User 002, ...

-- 使用递归CTE生成1000条数据
CREATE TABLE IF NOT EXISTS users (
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

WITH RECURSIVE user_generator(n) AS (
  SELECT 1
  UNION ALL
  SELECT n + 1 FROM user_generator WHERE n < 1000
)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at)
SELECT
    'user' || printf('%03d', n) as username,
    '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.' as password,
    'user' || printf('%03d', n) || '@test.com' as email,
    'Test User ' || printf('%03d', n) as full_name,
    CASE
        WHEN n <= 10 THEN 'ADMIN'
        WHEN n <= 50 THEN 'MANAGER'
        ELSE 'USER'
    END as role,
    1 as enabled,
    datetime('now') as created_at,
    datetime('now') as updated_at
FROM user_generator username,
    '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.' as password,
    'user' || printf('%03d', n) || '@test.com' as email,
    'Test User ' || printf('%03d', n) as full_name,
    CASE 
        WHEN n <= 10 THEN 'ADMIN'
        WHEN n <= 50 THEN 'MANAGER'
        ELSE 'USER'
    END as role,
    1 as enabled,
    datetime('now') as created_at,
    datetime('now') as updated_at
FROM user_generator;

-- 验证插入的数据数量
SELECT COUNT(*) as total_users FROM users;
SELECT role, COUNT(*) as count FROM users GROUP BY role; 