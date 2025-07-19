-- 生成1000条用户数据的SQL脚本
-- 用户范围：user001 ~ user1000

-- 清空现有用户数据（保留admin）
DELETE FROM users WHERE username != 'admin';

-- 开始插入1000条用户数据
-- 第1批数据 (用户 1-100)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user001', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user001@test.com', 'User 001', 'USER', 1, datetime('now'), datetime('now'))
,
('user002', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user002@test.com', 'User 002', 'USER', 1, datetime('now'), datetime('now'))
,
('user003', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user003@test.com', 'User 003', 'USER', 1, datetime('now'), datetime('now'))
,
('user004', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user004@test.com', 'User 004', 'USER', 1, datetime('now'), datetime('now'))
,
('user005', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user005@test.com', 'User 005', 'USER', 1, datetime('now'), datetime('now'))
,
('user006', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user006@test.com', 'User 006', 'USER', 1, datetime('now'), datetime('now'))
,
('user007', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user007@test.com', 'User 007', 'USER', 1, datetime('now'), datetime('now'))
,
('user008', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user008@test.com', 'User 008', 'USER', 1, datetime('now'), datetime('now'))
,
('user009', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user009@test.com', 'User 009', 'USER', 1, datetime('now'), datetime('now'))
,
('user010', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user010@test.com', 'User 010', 'USER', 1, datetime('now'), datetime('now'))
,
('user011', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user011@test.com', 'User 011', 'USER', 1, datetime('now'), datetime('now'))
,
('user012', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user012@test.com', 'User 012', 'USER', 1, datetime('now'), datetime('now'))
,
('user013', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user013@test.com', 'User 013', 'USER', 1, datetime('now'), datetime('now'))
,
('user014', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user014@test.com', 'User 014', 'USER', 1, datetime('now'), datetime('now'))
,
('user015', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user015@test.com', 'User 015', 'USER', 1, datetime('now'), datetime('now'))
,
('user016', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user016@test.com', 'User 016', 'USER', 1, datetime('now'), datetime('now'))
,
('user017', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user017@test.com', 'User 017', 'USER', 1, datetime('now'), datetime('now'))
,
('user018', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user018@test.com', 'User 018', 'USER', 1, datetime('now'), datetime('now'))
,
('user019', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user019@test.com', 'User 019', 'USER', 1, datetime('now'), datetime('now'))
,
('user020', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user020@test.com', 'User 020', 'USER', 1, datetime('now'), datetime('now'))
,
('user021', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user021@test.com', 'User 021', 'USER', 1, datetime('now'), datetime('now'))
,
('user022', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user022@test.com', 'User 022', 'USER', 1, datetime('now'), datetime('now'))
,
('user023', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user023@test.com', 'User 023', 'USER', 1, datetime('now'), datetime('now'))
,
('user024', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user024@test.com', 'User 024', 'USER', 1, datetime('now'), datetime('now'))
,
('user025', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user025@test.com', 'User 025', 'USER', 1, datetime('now'), datetime('now'))
,
('user026', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user026@test.com', 'User 026', 'USER', 1, datetime('now'), datetime('now'))
,
('user027', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user027@test.com', 'User 027', 'USER', 1, datetime('now'), datetime('now'))
,
('user028', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user028@test.com', 'User 028', 'USER', 1, datetime('now'), datetime('now'))
,
('user029', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user029@test.com', 'User 029', 'USER', 1, datetime('now'), datetime('now'))
,
('user030', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user030@test.com', 'User 030', 'USER', 1, datetime('now'), datetime('now'))
,
('user031', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user031@test.com', 'User 031', 'USER', 1, datetime('now'), datetime('now'))
,
('user032', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user032@test.com', 'User 032', 'USER', 1, datetime('now'), datetime('now'))
,
('user033', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user033@test.com', 'User 033', 'USER', 1, datetime('now'), datetime('now'))
,
('user034', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user034@test.com', 'User 034', 'USER', 1, datetime('now'), datetime('now'))
,
('user035', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user035@test.com', 'User 035', 'USER', 1, datetime('now'), datetime('now'))
,
('user036', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user036@test.com', 'User 036', 'USER', 1, datetime('now'), datetime('now'))
,
('user037', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user037@test.com', 'User 037', 'USER', 1, datetime('now'), datetime('now'))
,
('user038', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user038@test.com', 'User 038', 'USER', 1, datetime('now'), datetime('now'))
,
('user039', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user039@test.com', 'User 039', 'USER', 1, datetime('now'), datetime('now'))
,
('user040', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user040@test.com', 'User 040', 'USER', 1, datetime('now'), datetime('now'))
,
('user041', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user041@test.com', 'User 041', 'USER', 1, datetime('now'), datetime('now'))
,
('user042', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user042@test.com', 'User 042', 'USER', 1, datetime('now'), datetime('now'))
,
('user043', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user043@test.com', 'User 043', 'USER', 1, datetime('now'), datetime('now'))
,
('user044', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user044@test.com', 'User 044', 'USER', 1, datetime('now'), datetime('now'))
,
('user045', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user045@test.com', 'User 045', 'USER', 1, datetime('now'), datetime('now'))
,
('user046', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user046@test.com', 'User 046', 'USER', 1, datetime('now'), datetime('now'))
,
('user047', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user047@test.com', 'User 047', 'USER', 1, datetime('now'), datetime('now'))
,
('user048', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user048@test.com', 'User 048', 'USER', 1, datetime('now'), datetime('now'))
,
('user049', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user049@test.com', 'User 049', 'USER', 1, datetime('now'), datetime('now'))
,
('user050', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user050@test.com', 'User 050', 'USER', 1, datetime('now'), datetime('now'))
,
('user051', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user051@test.com', 'User 051', 'USER', 1, datetime('now'), datetime('now'))
,
('user052', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user052@test.com', 'User 052', 'USER', 1, datetime('now'), datetime('now'))
,
('user053', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user053@test.com', 'User 053', 'USER', 1, datetime('now'), datetime('now'))
,
('user054', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user054@test.com', 'User 054', 'USER', 1, datetime('now'), datetime('now'))
,
('user055', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user055@test.com', 'User 055', 'USER', 1, datetime('now'), datetime('now'))
,
('user056', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user056@test.com', 'User 056', 'USER', 1, datetime('now'), datetime('now'))
,
('user057', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user057@test.com', 'User 057', 'USER', 1, datetime('now'), datetime('now'))
,
('user058', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user058@test.com', 'User 058', 'USER', 1, datetime('now'), datetime('now'))
,
('user059', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user059@test.com', 'User 059', 'USER', 1, datetime('now'), datetime('now'))
,
('user060', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user060@test.com', 'User 060', 'USER', 1, datetime('now'), datetime('now'))
,
('user061', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user061@test.com', 'User 061', 'USER', 1, datetime('now'), datetime('now'))
,
('user062', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user062@test.com', 'User 062', 'USER', 1, datetime('now'), datetime('now'))
,
('user063', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user063@test.com', 'User 063', 'USER', 1, datetime('now'), datetime('now'))
,
('user064', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user064@test.com', 'User 064', 'USER', 1, datetime('now'), datetime('now'))
,
('user065', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user065@test.com', 'User 065', 'USER', 1, datetime('now'), datetime('now'))
,
('user066', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user066@test.com', 'User 066', 'USER', 1, datetime('now'), datetime('now'))
,
('user067', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user067@test.com', 'User 067', 'USER', 1, datetime('now'), datetime('now'))
,
('user068', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user068@test.com', 'User 068', 'USER', 1, datetime('now'), datetime('now'))
,
('user069', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user069@test.com', 'User 069', 'USER', 1, datetime('now'), datetime('now'))
,
('user070', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user070@test.com', 'User 070', 'USER', 1, datetime('now'), datetime('now'))
,
('user071', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user071@test.com', 'User 071', 'USER', 1, datetime('now'), datetime('now'))
,
('user072', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user072@test.com', 'User 072', 'USER', 1, datetime('now'), datetime('now'))
,
('user073', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user073@test.com', 'User 073', 'USER', 1, datetime('now'), datetime('now'))
,
('user074', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user074@test.com', 'User 074', 'USER', 1, datetime('now'), datetime('now'))
,
('user075', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user075@test.com', 'User 075', 'USER', 1, datetime('now'), datetime('now'))
,
('user076', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user076@test.com', 'User 076', 'USER', 1, datetime('now'), datetime('now'))
,
('user077', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user077@test.com', 'User 077', 'USER', 1, datetime('now'), datetime('now'))
,
('user078', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user078@test.com', 'User 078', 'USER', 1, datetime('now'), datetime('now'))
,
('user079', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user079@test.com', 'User 079', 'USER', 1, datetime('now'), datetime('now'))
,
('user080', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user080@test.com', 'User 080', 'USER', 1, datetime('now'), datetime('now'))
,
('user081', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user081@test.com', 'User 081', 'USER', 1, datetime('now'), datetime('now'))
,
('user082', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user082@test.com', 'User 082', 'USER', 1, datetime('now'), datetime('now'))
,
('user083', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user083@test.com', 'User 083', 'USER', 1, datetime('now'), datetime('now'))
,
('user084', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user084@test.com', 'User 084', 'USER', 1, datetime('now'), datetime('now'))
,
('user085', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user085@test.com', 'User 085', 'USER', 1, datetime('now'), datetime('now'))
,
('user086', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user086@test.com', 'User 086', 'USER', 1, datetime('now'), datetime('now'))
,
('user087', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user087@test.com', 'User 087', 'USER', 1, datetime('now'), datetime('now'))
,
('user088', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user088@test.com', 'User 088', 'USER', 1, datetime('now'), datetime('now'))
,
('user089', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user089@test.com', 'User 089', 'USER', 1, datetime('now'), datetime('now'))
,
('user090', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user090@test.com', 'User 090', 'USER', 1, datetime('now'), datetime('now'))
,
('user091', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user091@test.com', 'User 091', 'USER', 1, datetime('now'), datetime('now'))
,
('user092', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user092@test.com', 'User 092', 'USER', 1, datetime('now'), datetime('now'))
,
('user093', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user093@test.com', 'User 093', 'USER', 1, datetime('now'), datetime('now'))
,
('user094', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user094@test.com', 'User 094', 'USER', 1, datetime('now'), datetime('now'))
,
('user095', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user095@test.com', 'User 095', 'USER', 1, datetime('now'), datetime('now'))
,
('user096', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user096@test.com', 'User 096', 'USER', 1, datetime('now'), datetime('now'))
,
('user097', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user097@test.com', 'User 097', 'USER', 1, datetime('now'), datetime('now'))
,
('user098', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user098@test.com', 'User 098', 'USER', 1, datetime('now'), datetime('now'))
,
('user099', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user099@test.com', 'User 099', 'USER', 1, datetime('now'), datetime('now'))
,
('user100', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user100@test.com', 'User 100', 'USER', 1, datetime('now'), datetime('now'))
;

-- 第2批数据 (用户 101-200)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user101', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user101@test.com', 'User 101', 'USER', 1, datetime('now'), datetime('now'))
,
('user102', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user102@test.com', 'User 102', 'USER', 1, datetime('now'), datetime('now'))
,
('user103', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user103@test.com', 'User 103', 'USER', 1, datetime('now'), datetime('now'))
,
('user104', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user104@test.com', 'User 104', 'USER', 1, datetime('now'), datetime('now'))
,
('user105', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user105@test.com', 'User 105', 'USER', 1, datetime('now'), datetime('now'))
,
('user106', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user106@test.com', 'User 106', 'USER', 1, datetime('now'), datetime('now'))
,
('user107', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user107@test.com', 'User 107', 'USER', 1, datetime('now'), datetime('now'))
,
('user108', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user108@test.com', 'User 108', 'USER', 1, datetime('now'), datetime('now'))
,
('user109', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user109@test.com', 'User 109', 'USER', 1, datetime('now'), datetime('now'))
,
('user110', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user110@test.com', 'User 110', 'USER', 1, datetime('now'), datetime('now'))
,
('user111', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user111@test.com', 'User 111', 'USER', 1, datetime('now'), datetime('now'))
,
('user112', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user112@test.com', 'User 112', 'USER', 1, datetime('now'), datetime('now'))
,
('user113', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user113@test.com', 'User 113', 'USER', 1, datetime('now'), datetime('now'))
,
('user114', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user114@test.com', 'User 114', 'USER', 1, datetime('now'), datetime('now'))
,
('user115', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user115@test.com', 'User 115', 'USER', 1, datetime('now'), datetime('now'))
,
('user116', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user116@test.com', 'User 116', 'USER', 1, datetime('now'), datetime('now'))
,
('user117', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user117@test.com', 'User 117', 'USER', 1, datetime('now'), datetime('now'))
,
('user118', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user118@test.com', 'User 118', 'USER', 1, datetime('now'), datetime('now'))
,
('user119', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user119@test.com', 'User 119', 'USER', 1, datetime('now'), datetime('now'))
,
('user120', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user120@test.com', 'User 120', 'USER', 1, datetime('now'), datetime('now'))
,
('user121', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user121@test.com', 'User 121', 'USER', 1, datetime('now'), datetime('now'))
,
('user122', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user122@test.com', 'User 122', 'USER', 1, datetime('now'), datetime('now'))
,
('user123', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user123@test.com', 'User 123', 'USER', 1, datetime('now'), datetime('now'))
,
('user124', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user124@test.com', 'User 124', 'USER', 1, datetime('now'), datetime('now'))
,
('user125', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user125@test.com', 'User 125', 'USER', 1, datetime('now'), datetime('now'))
,
('user126', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user126@test.com', 'User 126', 'USER', 1, datetime('now'), datetime('now'))
,
('user127', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user127@test.com', 'User 127', 'USER', 1, datetime('now'), datetime('now'))
,
('user128', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user128@test.com', 'User 128', 'USER', 1, datetime('now'), datetime('now'))
,
('user129', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user129@test.com', 'User 129', 'USER', 1, datetime('now'), datetime('now'))
,
('user130', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user130@test.com', 'User 130', 'USER', 1, datetime('now'), datetime('now'))
,
('user131', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user131@test.com', 'User 131', 'USER', 1, datetime('now'), datetime('now'))
,
('user132', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user132@test.com', 'User 132', 'USER', 1, datetime('now'), datetime('now'))
,
('user133', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user133@test.com', 'User 133', 'USER', 1, datetime('now'), datetime('now'))
,
('user134', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user134@test.com', 'User 134', 'USER', 1, datetime('now'), datetime('now'))
,
('user135', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user135@test.com', 'User 135', 'USER', 1, datetime('now'), datetime('now'))
,
('user136', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user136@test.com', 'User 136', 'USER', 1, datetime('now'), datetime('now'))
,
('user137', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user137@test.com', 'User 137', 'USER', 1, datetime('now'), datetime('now'))
,
('user138', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user138@test.com', 'User 138', 'USER', 1, datetime('now'), datetime('now'))
,
('user139', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user139@test.com', 'User 139', 'USER', 1, datetime('now'), datetime('now'))
,
('user140', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user140@test.com', 'User 140', 'USER', 1, datetime('now'), datetime('now'))
,
('user141', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user141@test.com', 'User 141', 'USER', 1, datetime('now'), datetime('now'))
,
('user142', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user142@test.com', 'User 142', 'USER', 1, datetime('now'), datetime('now'))
,
('user143', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user143@test.com', 'User 143', 'USER', 1, datetime('now'), datetime('now'))
,
('user144', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user144@test.com', 'User 144', 'USER', 1, datetime('now'), datetime('now'))
,
('user145', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user145@test.com', 'User 145', 'USER', 1, datetime('now'), datetime('now'))
,
('user146', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user146@test.com', 'User 146', 'USER', 1, datetime('now'), datetime('now'))
,
('user147', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user147@test.com', 'User 147', 'USER', 1, datetime('now'), datetime('now'))
,
('user148', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user148@test.com', 'User 148', 'USER', 1, datetime('now'), datetime('now'))
,
('user149', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user149@test.com', 'User 149', 'USER', 1, datetime('now'), datetime('now'))
,
('user150', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user150@test.com', 'User 150', 'USER', 1, datetime('now'), datetime('now'))
,
('user151', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user151@test.com', 'User 151', 'USER', 1, datetime('now'), datetime('now'))
,
('user152', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user152@test.com', 'User 152', 'USER', 1, datetime('now'), datetime('now'))
,
('user153', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user153@test.com', 'User 153', 'USER', 1, datetime('now'), datetime('now'))
,
('user154', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user154@test.com', 'User 154', 'USER', 1, datetime('now'), datetime('now'))
,
('user155', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user155@test.com', 'User 155', 'USER', 1, datetime('now'), datetime('now'))
,
('user156', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user156@test.com', 'User 156', 'USER', 1, datetime('now'), datetime('now'))
,
('user157', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user157@test.com', 'User 157', 'USER', 1, datetime('now'), datetime('now'))
,
('user158', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user158@test.com', 'User 158', 'USER', 1, datetime('now'), datetime('now'))
,
('user159', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user159@test.com', 'User 159', 'USER', 1, datetime('now'), datetime('now'))
,
('user160', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user160@test.com', 'User 160', 'USER', 1, datetime('now'), datetime('now'))
,
('user161', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user161@test.com', 'User 161', 'USER', 1, datetime('now'), datetime('now'))
,
('user162', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user162@test.com', 'User 162', 'USER', 1, datetime('now'), datetime('now'))
,
('user163', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user163@test.com', 'User 163', 'USER', 1, datetime('now'), datetime('now'))
,
('user164', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user164@test.com', 'User 164', 'USER', 1, datetime('now'), datetime('now'))
,
('user165', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user165@test.com', 'User 165', 'USER', 1, datetime('now'), datetime('now'))
,
('user166', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user166@test.com', 'User 166', 'USER', 1, datetime('now'), datetime('now'))
,
('user167', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user167@test.com', 'User 167', 'USER', 1, datetime('now'), datetime('now'))
,
('user168', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user168@test.com', 'User 168', 'USER', 1, datetime('now'), datetime('now'))
,
('user169', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user169@test.com', 'User 169', 'USER', 1, datetime('now'), datetime('now'))
,
('user170', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user170@test.com', 'User 170', 'USER', 1, datetime('now'), datetime('now'))
,
('user171', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user171@test.com', 'User 171', 'USER', 1, datetime('now'), datetime('now'))
,
('user172', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user172@test.com', 'User 172', 'USER', 1, datetime('now'), datetime('now'))
,
('user173', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user173@test.com', 'User 173', 'USER', 1, datetime('now'), datetime('now'))
,
('user174', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user174@test.com', 'User 174', 'USER', 1, datetime('now'), datetime('now'))
,
('user175', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user175@test.com', 'User 175', 'USER', 1, datetime('now'), datetime('now'))
,
('user176', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user176@test.com', 'User 176', 'USER', 1, datetime('now'), datetime('now'))
,
('user177', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user177@test.com', 'User 177', 'USER', 1, datetime('now'), datetime('now'))
,
('user178', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user178@test.com', 'User 178', 'USER', 1, datetime('now'), datetime('now'))
,
('user179', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user179@test.com', 'User 179', 'USER', 1, datetime('now'), datetime('now'))
,
('user180', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user180@test.com', 'User 180', 'USER', 1, datetime('now'), datetime('now'))
,
('user181', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user181@test.com', 'User 181', 'USER', 1, datetime('now'), datetime('now'))
,
('user182', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user182@test.com', 'User 182', 'USER', 1, datetime('now'), datetime('now'))
,
('user183', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user183@test.com', 'User 183', 'USER', 1, datetime('now'), datetime('now'))
,
('user184', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user184@test.com', 'User 184', 'USER', 1, datetime('now'), datetime('now'))
,
('user185', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user185@test.com', 'User 185', 'USER', 1, datetime('now'), datetime('now'))
,
('user186', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user186@test.com', 'User 186', 'USER', 1, datetime('now'), datetime('now'))
,
('user187', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user187@test.com', 'User 187', 'USER', 1, datetime('now'), datetime('now'))
,
('user188', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user188@test.com', 'User 188', 'USER', 1, datetime('now'), datetime('now'))
,
('user189', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user189@test.com', 'User 189', 'USER', 1, datetime('now'), datetime('now'))
,
('user190', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user190@test.com', 'User 190', 'USER', 1, datetime('now'), datetime('now'))
,
('user191', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user191@test.com', 'User 191', 'USER', 1, datetime('now'), datetime('now'))
,
('user192', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user192@test.com', 'User 192', 'USER', 1, datetime('now'), datetime('now'))
,
('user193', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user193@test.com', 'User 193', 'USER', 1, datetime('now'), datetime('now'))
,
('user194', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user194@test.com', 'User 194', 'USER', 1, datetime('now'), datetime('now'))
,
('user195', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user195@test.com', 'User 195', 'USER', 1, datetime('now'), datetime('now'))
,
('user196', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user196@test.com', 'User 196', 'USER', 1, datetime('now'), datetime('now'))
,
('user197', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user197@test.com', 'User 197', 'USER', 1, datetime('now'), datetime('now'))
,
('user198', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user198@test.com', 'User 198', 'USER', 1, datetime('now'), datetime('now'))
,
('user199', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user199@test.com', 'User 199', 'USER', 1, datetime('now'), datetime('now'))
,
('user200', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user200@test.com', 'User 200', 'USER', 1, datetime('now'), datetime('now'))
;

-- 第3批数据 (用户 201-300)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user201', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user201@test.com', 'User 201', 'USER', 1, datetime('now'), datetime('now'))
,
('user202', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user202@test.com', 'User 202', 'USER', 1, datetime('now'), datetime('now'))
,
('user203', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user203@test.com', 'User 203', 'USER', 1, datetime('now'), datetime('now'))
,
('user204', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user204@test.com', 'User 204', 'USER', 1, datetime('now'), datetime('now'))
,
('user205', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user205@test.com', 'User 205', 'USER', 1, datetime('now'), datetime('now'))
,
('user206', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user206@test.com', 'User 206', 'USER', 1, datetime('now'), datetime('now'))
,
('user207', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user207@test.com', 'User 207', 'USER', 1, datetime('now'), datetime('now'))
,
('user208', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user208@test.com', 'User 208', 'USER', 1, datetime('now'), datetime('now'))
,
('user209', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user209@test.com', 'User 209', 'USER', 1, datetime('now'), datetime('now'))
,
('user210', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user210@test.com', 'User 210', 'USER', 1, datetime('now'), datetime('now'))
,
('user211', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user211@test.com', 'User 211', 'USER', 1, datetime('now'), datetime('now'))
,
('user212', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user212@test.com', 'User 212', 'USER', 1, datetime('now'), datetime('now'))
,
('user213', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user213@test.com', 'User 213', 'USER', 1, datetime('now'), datetime('now'))
,
('user214', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user214@test.com', 'User 214', 'USER', 1, datetime('now'), datetime('now'))
,
('user215', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user215@test.com', 'User 215', 'USER', 1, datetime('now'), datetime('now'))
,
('user216', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user216@test.com', 'User 216', 'USER', 1, datetime('now'), datetime('now'))
,
('user217', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user217@test.com', 'User 217', 'USER', 1, datetime('now'), datetime('now'))
,
('user218', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user218@test.com', 'User 218', 'USER', 1, datetime('now'), datetime('now'))
,
('user219', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user219@test.com', 'User 219', 'USER', 1, datetime('now'), datetime('now'))
,
('user220', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user220@test.com', 'User 220', 'USER', 1, datetime('now'), datetime('now'))
,
('user221', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user221@test.com', 'User 221', 'USER', 1, datetime('now'), datetime('now'))
,
('user222', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user222@test.com', 'User 222', 'USER', 1, datetime('now'), datetime('now'))
,
('user223', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user223@test.com', 'User 223', 'USER', 1, datetime('now'), datetime('now'))
,
('user224', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user224@test.com', 'User 224', 'USER', 1, datetime('now'), datetime('now'))
,
('user225', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user225@test.com', 'User 225', 'USER', 1, datetime('now'), datetime('now'))
,
('user226', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user226@test.com', 'User 226', 'USER', 1, datetime('now'), datetime('now'))
,
('user227', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user227@test.com', 'User 227', 'USER', 1, datetime('now'), datetime('now'))
,
('user228', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user228@test.com', 'User 228', 'USER', 1, datetime('now'), datetime('now'))
,
('user229', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user229@test.com', 'User 229', 'USER', 1, datetime('now'), datetime('now'))
,
('user230', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user230@test.com', 'User 230', 'USER', 1, datetime('now'), datetime('now'))
,
('user231', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user231@test.com', 'User 231', 'USER', 1, datetime('now'), datetime('now'))
,
('user232', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user232@test.com', 'User 232', 'USER', 1, datetime('now'), datetime('now'))
,
('user233', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user233@test.com', 'User 233', 'USER', 1, datetime('now'), datetime('now'))
,
('user234', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user234@test.com', 'User 234', 'USER', 1, datetime('now'), datetime('now'))
,
('user235', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user235@test.com', 'User 235', 'USER', 1, datetime('now'), datetime('now'))
,
('user236', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user236@test.com', 'User 236', 'USER', 1, datetime('now'), datetime('now'))
,
('user237', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user237@test.com', 'User 237', 'USER', 1, datetime('now'), datetime('now'))
,
('user238', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user238@test.com', 'User 238', 'USER', 1, datetime('now'), datetime('now'))
,
('user239', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user239@test.com', 'User 239', 'USER', 1, datetime('now'), datetime('now'))
,
('user240', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user240@test.com', 'User 240', 'USER', 1, datetime('now'), datetime('now'))
,
('user241', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user241@test.com', 'User 241', 'USER', 1, datetime('now'), datetime('now'))
,
('user242', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user242@test.com', 'User 242', 'USER', 1, datetime('now'), datetime('now'))
,
('user243', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user243@test.com', 'User 243', 'USER', 1, datetime('now'), datetime('now'))
,
('user244', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user244@test.com', 'User 244', 'USER', 1, datetime('now'), datetime('now'))
,
('user245', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user245@test.com', 'User 245', 'USER', 1, datetime('now'), datetime('now'))
,
('user246', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user246@test.com', 'User 246', 'USER', 1, datetime('now'), datetime('now'))
,
('user247', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user247@test.com', 'User 247', 'USER', 1, datetime('now'), datetime('now'))
,
('user248', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user248@test.com', 'User 248', 'USER', 1, datetime('now'), datetime('now'))
,
('user249', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user249@test.com', 'User 249', 'USER', 1, datetime('now'), datetime('now'))
,
('user250', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user250@test.com', 'User 250', 'USER', 1, datetime('now'), datetime('now'))
,
('user251', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user251@test.com', 'User 251', 'USER', 1, datetime('now'), datetime('now'))
,
('user252', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user252@test.com', 'User 252', 'USER', 1, datetime('now'), datetime('now'))
,
('user253', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user253@test.com', 'User 253', 'USER', 1, datetime('now'), datetime('now'))
,
('user254', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user254@test.com', 'User 254', 'USER', 1, datetime('now'), datetime('now'))
,
('user255', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user255@test.com', 'User 255', 'USER', 1, datetime('now'), datetime('now'))
,
('user256', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user256@test.com', 'User 256', 'USER', 1, datetime('now'), datetime('now'))
,
('user257', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user257@test.com', 'User 257', 'USER', 1, datetime('now'), datetime('now'))
,
('user258', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user258@test.com', 'User 258', 'USER', 1, datetime('now'), datetime('now'))
,
('user259', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user259@test.com', 'User 259', 'USER', 1, datetime('now'), datetime('now'))
,
('user260', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user260@test.com', 'User 260', 'USER', 1, datetime('now'), datetime('now'))
,
('user261', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user261@test.com', 'User 261', 'USER', 1, datetime('now'), datetime('now'))
,
('user262', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user262@test.com', 'User 262', 'USER', 1, datetime('now'), datetime('now'))
,
('user263', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user263@test.com', 'User 263', 'USER', 1, datetime('now'), datetime('now'))
,
('user264', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user264@test.com', 'User 264', 'USER', 1, datetime('now'), datetime('now'))
,
('user265', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user265@test.com', 'User 265', 'USER', 1, datetime('now'), datetime('now'))
,
('user266', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user266@test.com', 'User 266', 'USER', 1, datetime('now'), datetime('now'))
,
('user267', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user267@test.com', 'User 267', 'USER', 1, datetime('now'), datetime('now'))
,
('user268', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user268@test.com', 'User 268', 'USER', 1, datetime('now'), datetime('now'))
,
('user269', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user269@test.com', 'User 269', 'USER', 1, datetime('now'), datetime('now'))
,
('user270', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user270@test.com', 'User 270', 'USER', 1, datetime('now'), datetime('now'))
,
('user271', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user271@test.com', 'User 271', 'USER', 1, datetime('now'), datetime('now'))
,
('user272', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user272@test.com', 'User 272', 'USER', 1, datetime('now'), datetime('now'))
,
('user273', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user273@test.com', 'User 273', 'USER', 1, datetime('now'), datetime('now'))
,
('user274', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user274@test.com', 'User 274', 'USER', 1, datetime('now'), datetime('now'))
,
('user275', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user275@test.com', 'User 275', 'USER', 1, datetime('now'), datetime('now'))
,
('user276', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user276@test.com', 'User 276', 'USER', 1, datetime('now'), datetime('now'))
,
('user277', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user277@test.com', 'User 277', 'USER', 1, datetime('now'), datetime('now'))
,
('user278', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user278@test.com', 'User 278', 'USER', 1, datetime('now'), datetime('now'))
,
('user279', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user279@test.com', 'User 279', 'USER', 1, datetime('now'), datetime('now'))
,
('user280', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user280@test.com', 'User 280', 'USER', 1, datetime('now'), datetime('now'))
,
('user281', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user281@test.com', 'User 281', 'USER', 1, datetime('now'), datetime('now'))
,
('user282', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user282@test.com', 'User 282', 'USER', 1, datetime('now'), datetime('now'))
,
('user283', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user283@test.com', 'User 283', 'USER', 1, datetime('now'), datetime('now'))
,
('user284', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user284@test.com', 'User 284', 'USER', 1, datetime('now'), datetime('now'))
,
('user285', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user285@test.com', 'User 285', 'USER', 1, datetime('now'), datetime('now'))
,
('user286', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user286@test.com', 'User 286', 'USER', 1, datetime('now'), datetime('now'))
,
('user287', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user287@test.com', 'User 287', 'USER', 1, datetime('now'), datetime('now'))
,
('user288', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user288@test.com', 'User 288', 'USER', 1, datetime('now'), datetime('now'))
,
('user289', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user289@test.com', 'User 289', 'USER', 1, datetime('now'), datetime('now'))
,
('user290', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user290@test.com', 'User 290', 'USER', 1, datetime('now'), datetime('now'))
,
('user291', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user291@test.com', 'User 291', 'USER', 1, datetime('now'), datetime('now'))
,
('user292', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user292@test.com', 'User 292', 'USER', 1, datetime('now'), datetime('now'))
,
('user293', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user293@test.com', 'User 293', 'USER', 1, datetime('now'), datetime('now'))
,
('user294', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user294@test.com', 'User 294', 'USER', 1, datetime('now'), datetime('now'))
,
('user295', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user295@test.com', 'User 295', 'USER', 1, datetime('now'), datetime('now'))
,
('user296', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user296@test.com', 'User 296', 'USER', 1, datetime('now'), datetime('now'))
,
('user297', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user297@test.com', 'User 297', 'USER', 1, datetime('now'), datetime('now'))
,
('user298', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user298@test.com', 'User 298', 'USER', 1, datetime('now'), datetime('now'))
,
('user299', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user299@test.com', 'User 299', 'USER', 1, datetime('now'), datetime('now'))
,
('user300', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user300@test.com', 'User 300', 'USER', 1, datetime('now'), datetime('now'))
;

-- 第4批数据 (用户 301-400)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user301', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user301@test.com', 'User 301', 'USER', 1, datetime('now'), datetime('now'))
,
('user302', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user302@test.com', 'User 302', 'USER', 1, datetime('now'), datetime('now'))
,
('user303', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user303@test.com', 'User 303', 'USER', 1, datetime('now'), datetime('now'))
,
('user304', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user304@test.com', 'User 304', 'USER', 1, datetime('now'), datetime('now'))
,
('user305', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user305@test.com', 'User 305', 'USER', 1, datetime('now'), datetime('now'))
,
('user306', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user306@test.com', 'User 306', 'USER', 1, datetime('now'), datetime('now'))
,
('user307', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user307@test.com', 'User 307', 'USER', 1, datetime('now'), datetime('now'))
,
('user308', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user308@test.com', 'User 308', 'USER', 1, datetime('now'), datetime('now'))
,
('user309', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user309@test.com', 'User 309', 'USER', 1, datetime('now'), datetime('now'))
,
('user310', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user310@test.com', 'User 310', 'USER', 1, datetime('now'), datetime('now'))
,
('user311', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user311@test.com', 'User 311', 'USER', 1, datetime('now'), datetime('now'))
,
('user312', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user312@test.com', 'User 312', 'USER', 1, datetime('now'), datetime('now'))
,
('user313', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user313@test.com', 'User 313', 'USER', 1, datetime('now'), datetime('now'))
,
('user314', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user314@test.com', 'User 314', 'USER', 1, datetime('now'), datetime('now'))
,
('user315', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user315@test.com', 'User 315', 'USER', 1, datetime('now'), datetime('now'))
,
('user316', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user316@test.com', 'User 316', 'USER', 1, datetime('now'), datetime('now'))
,
('user317', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user317@test.com', 'User 317', 'USER', 1, datetime('now'), datetime('now'))
,
('user318', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user318@test.com', 'User 318', 'USER', 1, datetime('now'), datetime('now'))
,
('user319', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user319@test.com', 'User 319', 'USER', 1, datetime('now'), datetime('now'))
,
('user320', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user320@test.com', 'User 320', 'USER', 1, datetime('now'), datetime('now'))
,
('user321', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user321@test.com', 'User 321', 'USER', 1, datetime('now'), datetime('now'))
,
('user322', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user322@test.com', 'User 322', 'USER', 1, datetime('now'), datetime('now'))
,
('user323', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user323@test.com', 'User 323', 'USER', 1, datetime('now'), datetime('now'))
,
('user324', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user324@test.com', 'User 324', 'USER', 1, datetime('now'), datetime('now'))
,
('user325', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user325@test.com', 'User 325', 'USER', 1, datetime('now'), datetime('now'))
,
('user326', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user326@test.com', 'User 326', 'USER', 1, datetime('now'), datetime('now'))
,
('user327', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user327@test.com', 'User 327', 'USER', 1, datetime('now'), datetime('now'))
,
('user328', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user328@test.com', 'User 328', 'USER', 1, datetime('now'), datetime('now'))
,
('user329', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user329@test.com', 'User 329', 'USER', 1, datetime('now'), datetime('now'))
,
('user330', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user330@test.com', 'User 330', 'USER', 1, datetime('now'), datetime('now'))
,
('user331', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user331@test.com', 'User 331', 'USER', 1, datetime('now'), datetime('now'))
,
('user332', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user332@test.com', 'User 332', 'USER', 1, datetime('now'), datetime('now'))
,
('user333', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user333@test.com', 'User 333', 'USER', 1, datetime('now'), datetime('now'))
,
('user334', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user334@test.com', 'User 334', 'USER', 1, datetime('now'), datetime('now'))
,
('user335', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user335@test.com', 'User 335', 'USER', 1, datetime('now'), datetime('now'))
,
('user336', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user336@test.com', 'User 336', 'USER', 1, datetime('now'), datetime('now'))
,
('user337', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user337@test.com', 'User 337', 'USER', 1, datetime('now'), datetime('now'))
,
('user338', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user338@test.com', 'User 338', 'USER', 1, datetime('now'), datetime('now'))
,
('user339', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user339@test.com', 'User 339', 'USER', 1, datetime('now'), datetime('now'))
,
('user340', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user340@test.com', 'User 340', 'USER', 1, datetime('now'), datetime('now'))
,
('user341', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user341@test.com', 'User 341', 'USER', 1, datetime('now'), datetime('now'))
,
('user342', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user342@test.com', 'User 342', 'USER', 1, datetime('now'), datetime('now'))
,
('user343', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user343@test.com', 'User 343', 'USER', 1, datetime('now'), datetime('now'))
,
('user344', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user344@test.com', 'User 344', 'USER', 1, datetime('now'), datetime('now'))
,
('user345', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user345@test.com', 'User 345', 'USER', 1, datetime('now'), datetime('now'))
,
('user346', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user346@test.com', 'User 346', 'USER', 1, datetime('now'), datetime('now'))
,
('user347', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user347@test.com', 'User 347', 'USER', 1, datetime('now'), datetime('now'))
,
('user348', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user348@test.com', 'User 348', 'USER', 1, datetime('now'), datetime('now'))
,
('user349', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user349@test.com', 'User 349', 'USER', 1, datetime('now'), datetime('now'))
,
('user350', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user350@test.com', 'User 350', 'USER', 1, datetime('now'), datetime('now'))
,
('user351', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user351@test.com', 'User 351', 'USER', 1, datetime('now'), datetime('now'))
,
('user352', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user352@test.com', 'User 352', 'USER', 1, datetime('now'), datetime('now'))
,
('user353', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user353@test.com', 'User 353', 'USER', 1, datetime('now'), datetime('now'))
,
('user354', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user354@test.com', 'User 354', 'USER', 1, datetime('now'), datetime('now'))
,
('user355', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user355@test.com', 'User 355', 'USER', 1, datetime('now'), datetime('now'))
,
('user356', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user356@test.com', 'User 356', 'USER', 1, datetime('now'), datetime('now'))
,
('user357', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user357@test.com', 'User 357', 'USER', 1, datetime('now'), datetime('now'))
,
('user358', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user358@test.com', 'User 358', 'USER', 1, datetime('now'), datetime('now'))
,
('user359', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user359@test.com', 'User 359', 'USER', 1, datetime('now'), datetime('now'))
,
('user360', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user360@test.com', 'User 360', 'USER', 1, datetime('now'), datetime('now'))
,
('user361', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user361@test.com', 'User 361', 'USER', 1, datetime('now'), datetime('now'))
,
('user362', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user362@test.com', 'User 362', 'USER', 1, datetime('now'), datetime('now'))
,
('user363', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user363@test.com', 'User 363', 'USER', 1, datetime('now'), datetime('now'))
,
('user364', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user364@test.com', 'User 364', 'USER', 1, datetime('now'), datetime('now'))
,
('user365', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user365@test.com', 'User 365', 'USER', 1, datetime('now'), datetime('now'))
,
('user366', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user366@test.com', 'User 366', 'USER', 1, datetime('now'), datetime('now'))
,
('user367', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user367@test.com', 'User 367', 'USER', 1, datetime('now'), datetime('now'))
,
('user368', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user368@test.com', 'User 368', 'USER', 1, datetime('now'), datetime('now'))
,
('user369', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user369@test.com', 'User 369', 'USER', 1, datetime('now'), datetime('now'))
,
('user370', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user370@test.com', 'User 370', 'USER', 1, datetime('now'), datetime('now'))
,
('user371', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user371@test.com', 'User 371', 'USER', 1, datetime('now'), datetime('now'))
,
('user372', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user372@test.com', 'User 372', 'USER', 1, datetime('now'), datetime('now'))
,
('user373', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user373@test.com', 'User 373', 'USER', 1, datetime('now'), datetime('now'))
,
('user374', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user374@test.com', 'User 374', 'USER', 1, datetime('now'), datetime('now'))
,
('user375', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user375@test.com', 'User 375', 'USER', 1, datetime('now'), datetime('now'))
,
('user376', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user376@test.com', 'User 376', 'USER', 1, datetime('now'), datetime('now'))
,
('user377', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user377@test.com', 'User 377', 'USER', 1, datetime('now'), datetime('now'))
,
('user378', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user378@test.com', 'User 378', 'USER', 1, datetime('now'), datetime('now'))
,
('user379', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user379@test.com', 'User 379', 'USER', 1, datetime('now'), datetime('now'))
,
('user380', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user380@test.com', 'User 380', 'USER', 1, datetime('now'), datetime('now'))
,
('user381', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user381@test.com', 'User 381', 'USER', 1, datetime('now'), datetime('now'))
,
('user382', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user382@test.com', 'User 382', 'USER', 1, datetime('now'), datetime('now'))
,
('user383', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user383@test.com', 'User 383', 'USER', 1, datetime('now'), datetime('now'))
,
('user384', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user384@test.com', 'User 384', 'USER', 1, datetime('now'), datetime('now'))
,
('user385', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user385@test.com', 'User 385', 'USER', 1, datetime('now'), datetime('now'))
,
('user386', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user386@test.com', 'User 386', 'USER', 1, datetime('now'), datetime('now'))
,
('user387', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user387@test.com', 'User 387', 'USER', 1, datetime('now'), datetime('now'))
,
('user388', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user388@test.com', 'User 388', 'USER', 1, datetime('now'), datetime('now'))
,
('user389', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user389@test.com', 'User 389', 'USER', 1, datetime('now'), datetime('now'))
,
('user390', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user390@test.com', 'User 390', 'USER', 1, datetime('now'), datetime('now'))
,
('user391', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user391@test.com', 'User 391', 'USER', 1, datetime('now'), datetime('now'))
,
('user392', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user392@test.com', 'User 392', 'USER', 1, datetime('now'), datetime('now'))
,
('user393', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user393@test.com', 'User 393', 'USER', 1, datetime('now'), datetime('now'))
,
('user394', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user394@test.com', 'User 394', 'USER', 1, datetime('now'), datetime('now'))
,
('user395', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user395@test.com', 'User 395', 'USER', 1, datetime('now'), datetime('now'))
,
('user396', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user396@test.com', 'User 396', 'USER', 1, datetime('now'), datetime('now'))
,
('user397', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user397@test.com', 'User 397', 'USER', 1, datetime('now'), datetime('now'))
,
('user398', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user398@test.com', 'User 398', 'USER', 1, datetime('now'), datetime('now'))
,
('user399', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user399@test.com', 'User 399', 'USER', 1, datetime('now'), datetime('now'))
,
('user400', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user400@test.com', 'User 400', 'USER', 1, datetime('now'), datetime('now'))
;

-- 第5批数据 (用户 401-500)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user401', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user401@test.com', 'User 401', 'USER', 1, datetime('now'), datetime('now'))
,
('user402', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user402@test.com', 'User 402', 'USER', 1, datetime('now'), datetime('now'))
,
('user403', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user403@test.com', 'User 403', 'USER', 1, datetime('now'), datetime('now'))
,
('user404', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user404@test.com', 'User 404', 'USER', 1, datetime('now'), datetime('now'))
,
('user405', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user405@test.com', 'User 405', 'USER', 1, datetime('now'), datetime('now'))
,
('user406', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user406@test.com', 'User 406', 'USER', 1, datetime('now'), datetime('now'))
,
('user407', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user407@test.com', 'User 407', 'USER', 1, datetime('now'), datetime('now'))
,
('user408', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user408@test.com', 'User 408', 'USER', 1, datetime('now'), datetime('now'))
,
('user409', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user409@test.com', 'User 409', 'USER', 1, datetime('now'), datetime('now'))
,
('user410', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user410@test.com', 'User 410', 'USER', 1, datetime('now'), datetime('now'))
,
('user411', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user411@test.com', 'User 411', 'USER', 1, datetime('now'), datetime('now'))
,
('user412', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user412@test.com', 'User 412', 'USER', 1, datetime('now'), datetime('now'))
,
('user413', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user413@test.com', 'User 413', 'USER', 1, datetime('now'), datetime('now'))
,
('user414', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user414@test.com', 'User 414', 'USER', 1, datetime('now'), datetime('now'))
,
('user415', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user415@test.com', 'User 415', 'USER', 1, datetime('now'), datetime('now'))
,
('user416', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user416@test.com', 'User 416', 'USER', 1, datetime('now'), datetime('now'))
,
('user417', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user417@test.com', 'User 417', 'USER', 1, datetime('now'), datetime('now'))
,
('user418', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user418@test.com', 'User 418', 'USER', 1, datetime('now'), datetime('now'))
,
('user419', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user419@test.com', 'User 419', 'USER', 1, datetime('now'), datetime('now'))
,
('user420', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user420@test.com', 'User 420', 'USER', 1, datetime('now'), datetime('now'))
,
('user421', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user421@test.com', 'User 421', 'USER', 1, datetime('now'), datetime('now'))
,
('user422', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user422@test.com', 'User 422', 'USER', 1, datetime('now'), datetime('now'))
,
('user423', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user423@test.com', 'User 423', 'USER', 1, datetime('now'), datetime('now'))
,
('user424', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user424@test.com', 'User 424', 'USER', 1, datetime('now'), datetime('now'))
,
('user425', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user425@test.com', 'User 425', 'USER', 1, datetime('now'), datetime('now'))
,
('user426', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user426@test.com', 'User 426', 'USER', 1, datetime('now'), datetime('now'))
,
('user427', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user427@test.com', 'User 427', 'USER', 1, datetime('now'), datetime('now'))
,
('user428', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user428@test.com', 'User 428', 'USER', 1, datetime('now'), datetime('now'))
,
('user429', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user429@test.com', 'User 429', 'USER', 1, datetime('now'), datetime('now'))
,
('user430', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user430@test.com', 'User 430', 'USER', 1, datetime('now'), datetime('now'))
,
('user431', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user431@test.com', 'User 431', 'USER', 1, datetime('now'), datetime('now'))
,
('user432', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user432@test.com', 'User 432', 'USER', 1, datetime('now'), datetime('now'))
,
('user433', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user433@test.com', 'User 433', 'USER', 1, datetime('now'), datetime('now'))
,
('user434', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user434@test.com', 'User 434', 'USER', 1, datetime('now'), datetime('now'))
,
('user435', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user435@test.com', 'User 435', 'USER', 1, datetime('now'), datetime('now'))
,
('user436', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user436@test.com', 'User 436', 'USER', 1, datetime('now'), datetime('now'))
,
('user437', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user437@test.com', 'User 437', 'USER', 1, datetime('now'), datetime('now'))
,
('user438', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user438@test.com', 'User 438', 'USER', 1, datetime('now'), datetime('now'))
,
('user439', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user439@test.com', 'User 439', 'USER', 1, datetime('now'), datetime('now'))
,
('user440', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user440@test.com', 'User 440', 'USER', 1, datetime('now'), datetime('now'))
,
('user441', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user441@test.com', 'User 441', 'USER', 1, datetime('now'), datetime('now'))
,
('user442', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user442@test.com', 'User 442', 'USER', 1, datetime('now'), datetime('now'))
,
('user443', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user443@test.com', 'User 443', 'USER', 1, datetime('now'), datetime('now'))
,
('user444', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user444@test.com', 'User 444', 'USER', 1, datetime('now'), datetime('now'))
,
('user445', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user445@test.com', 'User 445', 'USER', 1, datetime('now'), datetime('now'))
,
('user446', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user446@test.com', 'User 446', 'USER', 1, datetime('now'), datetime('now'))
,
('user447', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user447@test.com', 'User 447', 'USER', 1, datetime('now'), datetime('now'))
,
('user448', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user448@test.com', 'User 448', 'USER', 1, datetime('now'), datetime('now'))
,
('user449', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user449@test.com', 'User 449', 'USER', 1, datetime('now'), datetime('now'))
,
('user450', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user450@test.com', 'User 450', 'USER', 1, datetime('now'), datetime('now'))
,
('user451', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user451@test.com', 'User 451', 'USER', 1, datetime('now'), datetime('now'))
,
('user452', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user452@test.com', 'User 452', 'USER', 1, datetime('now'), datetime('now'))
,
('user453', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user453@test.com', 'User 453', 'USER', 1, datetime('now'), datetime('now'))
,
('user454', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user454@test.com', 'User 454', 'USER', 1, datetime('now'), datetime('now'))
,
('user455', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user455@test.com', 'User 455', 'USER', 1, datetime('now'), datetime('now'))
,
('user456', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user456@test.com', 'User 456', 'USER', 1, datetime('now'), datetime('now'))
,
('user457', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user457@test.com', 'User 457', 'USER', 1, datetime('now'), datetime('now'))
,
('user458', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user458@test.com', 'User 458', 'USER', 1, datetime('now'), datetime('now'))
,
('user459', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user459@test.com', 'User 459', 'USER', 1, datetime('now'), datetime('now'))
,
('user460', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user460@test.com', 'User 460', 'USER', 1, datetime('now'), datetime('now'))
,
('user461', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user461@test.com', 'User 461', 'USER', 1, datetime('now'), datetime('now'))
,
('user462', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user462@test.com', 'User 462', 'USER', 1, datetime('now'), datetime('now'))
,
('user463', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user463@test.com', 'User 463', 'USER', 1, datetime('now'), datetime('now'))
,
('user464', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user464@test.com', 'User 464', 'USER', 1, datetime('now'), datetime('now'))
,
('user465', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user465@test.com', 'User 465', 'USER', 1, datetime('now'), datetime('now'))
,
('user466', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user466@test.com', 'User 466', 'USER', 1, datetime('now'), datetime('now'))
,
('user467', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user467@test.com', 'User 467', 'USER', 1, datetime('now'), datetime('now'))
,
('user468', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user468@test.com', 'User 468', 'USER', 1, datetime('now'), datetime('now'))
,
('user469', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user469@test.com', 'User 469', 'USER', 1, datetime('now'), datetime('now'))
,
('user470', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user470@test.com', 'User 470', 'USER', 1, datetime('now'), datetime('now'))
,
('user471', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user471@test.com', 'User 471', 'USER', 1, datetime('now'), datetime('now'))
,
('user472', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user472@test.com', 'User 472', 'USER', 1, datetime('now'), datetime('now'))
,
('user473', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user473@test.com', 'User 473', 'USER', 1, datetime('now'), datetime('now'))
,
('user474', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user474@test.com', 'User 474', 'USER', 1, datetime('now'), datetime('now'))
,
('user475', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user475@test.com', 'User 475', 'USER', 1, datetime('now'), datetime('now'))
,
('user476', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user476@test.com', 'User 476', 'USER', 1, datetime('now'), datetime('now'))
,
('user477', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user477@test.com', 'User 477', 'USER', 1, datetime('now'), datetime('now'))
,
('user478', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user478@test.com', 'User 478', 'USER', 1, datetime('now'), datetime('now'))
,
('user479', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user479@test.com', 'User 479', 'USER', 1, datetime('now'), datetime('now'))
,
('user480', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user480@test.com', 'User 480', 'USER', 1, datetime('now'), datetime('now'))
,
('user481', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user481@test.com', 'User 481', 'USER', 1, datetime('now'), datetime('now'))
,
('user482', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user482@test.com', 'User 482', 'USER', 1, datetime('now'), datetime('now'))
,
('user483', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user483@test.com', 'User 483', 'USER', 1, datetime('now'), datetime('now'))
,
('user484', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user484@test.com', 'User 484', 'USER', 1, datetime('now'), datetime('now'))
,
('user485', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user485@test.com', 'User 485', 'USER', 1, datetime('now'), datetime('now'))
,
('user486', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user486@test.com', 'User 486', 'USER', 1, datetime('now'), datetime('now'))
,
('user487', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user487@test.com', 'User 487', 'USER', 1, datetime('now'), datetime('now'))
,
('user488', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user488@test.com', 'User 488', 'USER', 1, datetime('now'), datetime('now'))
,
('user489', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user489@test.com', 'User 489', 'USER', 1, datetime('now'), datetime('now'))
,
('user490', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user490@test.com', 'User 490', 'USER', 1, datetime('now'), datetime('now'))
,
('user491', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user491@test.com', 'User 491', 'USER', 1, datetime('now'), datetime('now'))
,
('user492', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user492@test.com', 'User 492', 'USER', 1, datetime('now'), datetime('now'))
,
('user493', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user493@test.com', 'User 493', 'USER', 1, datetime('now'), datetime('now'))
,
('user494', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user494@test.com', 'User 494', 'USER', 1, datetime('now'), datetime('now'))
,
('user495', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user495@test.com', 'User 495', 'USER', 1, datetime('now'), datetime('now'))
,
('user496', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user496@test.com', 'User 496', 'USER', 1, datetime('now'), datetime('now'))
,
('user497', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user497@test.com', 'User 497', 'USER', 1, datetime('now'), datetime('now'))
,
('user498', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user498@test.com', 'User 498', 'USER', 1, datetime('now'), datetime('now'))
,
('user499', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user499@test.com', 'User 499', 'USER', 1, datetime('now'), datetime('now'))
,
('user500', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user500@test.com', 'User 500', 'USER', 1, datetime('now'), datetime('now'))
;

-- 第6批数据 (用户 501-600)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user501', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user501@test.com', 'User 501', 'USER', 1, datetime('now'), datetime('now'))
,
('user502', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user502@test.com', 'User 502', 'USER', 1, datetime('now'), datetime('now'))
,
('user503', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user503@test.com', 'User 503', 'USER', 1, datetime('now'), datetime('now'))
,
('user504', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user504@test.com', 'User 504', 'USER', 1, datetime('now'), datetime('now'))
,
('user505', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user505@test.com', 'User 505', 'USER', 1, datetime('now'), datetime('now'))
,
('user506', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user506@test.com', 'User 506', 'USER', 1, datetime('now'), datetime('now'))
,
('user507', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user507@test.com', 'User 507', 'USER', 1, datetime('now'), datetime('now'))
,
('user508', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user508@test.com', 'User 508', 'USER', 1, datetime('now'), datetime('now'))
,
('user509', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user509@test.com', 'User 509', 'USER', 1, datetime('now'), datetime('now'))
,
('user510', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user510@test.com', 'User 510', 'USER', 1, datetime('now'), datetime('now'))
,
('user511', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user511@test.com', 'User 511', 'USER', 1, datetime('now'), datetime('now'))
,
('user512', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user512@test.com', 'User 512', 'USER', 1, datetime('now'), datetime('now'))
,
('user513', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user513@test.com', 'User 513', 'USER', 1, datetime('now'), datetime('now'))
,
('user514', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user514@test.com', 'User 514', 'USER', 1, datetime('now'), datetime('now'))
,
('user515', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user515@test.com', 'User 515', 'USER', 1, datetime('now'), datetime('now'))
,
('user516', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user516@test.com', 'User 516', 'USER', 1, datetime('now'), datetime('now'))
,
('user517', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user517@test.com', 'User 517', 'USER', 1, datetime('now'), datetime('now'))
,
('user518', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user518@test.com', 'User 518', 'USER', 1, datetime('now'), datetime('now'))
,
('user519', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user519@test.com', 'User 519', 'USER', 1, datetime('now'), datetime('now'))
,
('user520', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user520@test.com', 'User 520', 'USER', 1, datetime('now'), datetime('now'))
,
('user521', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user521@test.com', 'User 521', 'USER', 1, datetime('now'), datetime('now'))
,
('user522', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user522@test.com', 'User 522', 'USER', 1, datetime('now'), datetime('now'))
,
('user523', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user523@test.com', 'User 523', 'USER', 1, datetime('now'), datetime('now'))
,
('user524', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user524@test.com', 'User 524', 'USER', 1, datetime('now'), datetime('now'))
,
('user525', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user525@test.com', 'User 525', 'USER', 1, datetime('now'), datetime('now'))
,
('user526', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user526@test.com', 'User 526', 'USER', 1, datetime('now'), datetime('now'))
,
('user527', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user527@test.com', 'User 527', 'USER', 1, datetime('now'), datetime('now'))
,
('user528', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user528@test.com', 'User 528', 'USER', 1, datetime('now'), datetime('now'))
,
('user529', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user529@test.com', 'User 529', 'USER', 1, datetime('now'), datetime('now'))
,
('user530', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user530@test.com', 'User 530', 'USER', 1, datetime('now'), datetime('now'))
,
('user531', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user531@test.com', 'User 531', 'USER', 1, datetime('now'), datetime('now'))
,
('user532', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user532@test.com', 'User 532', 'USER', 1, datetime('now'), datetime('now'))
,
('user533', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user533@test.com', 'User 533', 'USER', 1, datetime('now'), datetime('now'))
,
('user534', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user534@test.com', 'User 534', 'USER', 1, datetime('now'), datetime('now'))
,
('user535', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user535@test.com', 'User 535', 'USER', 1, datetime('now'), datetime('now'))
,
('user536', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user536@test.com', 'User 536', 'USER', 1, datetime('now'), datetime('now'))
,
('user537', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user537@test.com', 'User 537', 'USER', 1, datetime('now'), datetime('now'))
,
('user538', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user538@test.com', 'User 538', 'USER', 1, datetime('now'), datetime('now'))
,
('user539', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user539@test.com', 'User 539', 'USER', 1, datetime('now'), datetime('now'))
,
('user540', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user540@test.com', 'User 540', 'USER', 1, datetime('now'), datetime('now'))
,
('user541', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user541@test.com', 'User 541', 'USER', 1, datetime('now'), datetime('now'))
,
('user542', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user542@test.com', 'User 542', 'USER', 1, datetime('now'), datetime('now'))
,
('user543', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user543@test.com', 'User 543', 'USER', 1, datetime('now'), datetime('now'))
,
('user544', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user544@test.com', 'User 544', 'USER', 1, datetime('now'), datetime('now'))
,
('user545', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user545@test.com', 'User 545', 'USER', 1, datetime('now'), datetime('now'))
,
('user546', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user546@test.com', 'User 546', 'USER', 1, datetime('now'), datetime('now'))
,
('user547', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user547@test.com', 'User 547', 'USER', 1, datetime('now'), datetime('now'))
,
('user548', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user548@test.com', 'User 548', 'USER', 1, datetime('now'), datetime('now'))
,
('user549', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user549@test.com', 'User 549', 'USER', 1, datetime('now'), datetime('now'))
,
('user550', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user550@test.com', 'User 550', 'USER', 1, datetime('now'), datetime('now'))
,
('user551', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user551@test.com', 'User 551', 'USER', 1, datetime('now'), datetime('now'))
,
('user552', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user552@test.com', 'User 552', 'USER', 1, datetime('now'), datetime('now'))
,
('user553', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user553@test.com', 'User 553', 'USER', 1, datetime('now'), datetime('now'))
,
('user554', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user554@test.com', 'User 554', 'USER', 1, datetime('now'), datetime('now'))
,
('user555', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user555@test.com', 'User 555', 'USER', 1, datetime('now'), datetime('now'))
,
('user556', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user556@test.com', 'User 556', 'USER', 1, datetime('now'), datetime('now'))
,
('user557', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user557@test.com', 'User 557', 'USER', 1, datetime('now'), datetime('now'))
,
('user558', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user558@test.com', 'User 558', 'USER', 1, datetime('now'), datetime('now'))
,
('user559', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user559@test.com', 'User 559', 'USER', 1, datetime('now'), datetime('now'))
,
('user560', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user560@test.com', 'User 560', 'USER', 1, datetime('now'), datetime('now'))
,
('user561', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user561@test.com', 'User 561', 'USER', 1, datetime('now'), datetime('now'))
,
('user562', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user562@test.com', 'User 562', 'USER', 1, datetime('now'), datetime('now'))
,
('user563', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user563@test.com', 'User 563', 'USER', 1, datetime('now'), datetime('now'))
,
('user564', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user564@test.com', 'User 564', 'USER', 1, datetime('now'), datetime('now'))
,
('user565', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user565@test.com', 'User 565', 'USER', 1, datetime('now'), datetime('now'))
,
('user566', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user566@test.com', 'User 566', 'USER', 1, datetime('now'), datetime('now'))
,
('user567', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user567@test.com', 'User 567', 'USER', 1, datetime('now'), datetime('now'))
,
('user568', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user568@test.com', 'User 568', 'USER', 1, datetime('now'), datetime('now'))
,
('user569', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user569@test.com', 'User 569', 'USER', 1, datetime('now'), datetime('now'))
,
('user570', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user570@test.com', 'User 570', 'USER', 1, datetime('now'), datetime('now'))
,
('user571', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user571@test.com', 'User 571', 'USER', 1, datetime('now'), datetime('now'))
,
('user572', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user572@test.com', 'User 572', 'USER', 1, datetime('now'), datetime('now'))
,
('user573', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user573@test.com', 'User 573', 'USER', 1, datetime('now'), datetime('now'))
,
('user574', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user574@test.com', 'User 574', 'USER', 1, datetime('now'), datetime('now'))
,
('user575', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user575@test.com', 'User 575', 'USER', 1, datetime('now'), datetime('now'))
,
('user576', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user576@test.com', 'User 576', 'USER', 1, datetime('now'), datetime('now'))
,
('user577', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user577@test.com', 'User 577', 'USER', 1, datetime('now'), datetime('now'))
,
('user578', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user578@test.com', 'User 578', 'USER', 1, datetime('now'), datetime('now'))
,
('user579', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user579@test.com', 'User 579', 'USER', 1, datetime('now'), datetime('now'))
,
('user580', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user580@test.com', 'User 580', 'USER', 1, datetime('now'), datetime('now'))
,
('user581', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user581@test.com', 'User 581', 'USER', 1, datetime('now'), datetime('now'))
,
('user582', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user582@test.com', 'User 582', 'USER', 1, datetime('now'), datetime('now'))
,
('user583', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user583@test.com', 'User 583', 'USER', 1, datetime('now'), datetime('now'))
,
('user584', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user584@test.com', 'User 584', 'USER', 1, datetime('now'), datetime('now'))
,
('user585', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user585@test.com', 'User 585', 'USER', 1, datetime('now'), datetime('now'))
,
('user586', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user586@test.com', 'User 586', 'USER', 1, datetime('now'), datetime('now'))
,
('user587', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user587@test.com', 'User 587', 'USER', 1, datetime('now'), datetime('now'))
,
('user588', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user588@test.com', 'User 588', 'USER', 1, datetime('now'), datetime('now'))
,
('user589', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user589@test.com', 'User 589', 'USER', 1, datetime('now'), datetime('now'))
,
('user590', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user590@test.com', 'User 590', 'USER', 1, datetime('now'), datetime('now'))
,
('user591', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user591@test.com', 'User 591', 'USER', 1, datetime('now'), datetime('now'))
,
('user592', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user592@test.com', 'User 592', 'USER', 1, datetime('now'), datetime('now'))
,
('user593', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user593@test.com', 'User 593', 'USER', 1, datetime('now'), datetime('now'))
,
('user594', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user594@test.com', 'User 594', 'USER', 1, datetime('now'), datetime('now'))
,
('user595', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user595@test.com', 'User 595', 'USER', 1, datetime('now'), datetime('now'))
,
('user596', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user596@test.com', 'User 596', 'USER', 1, datetime('now'), datetime('now'))
,
('user597', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user597@test.com', 'User 597', 'USER', 1, datetime('now'), datetime('now'))
,
('user598', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user598@test.com', 'User 598', 'USER', 1, datetime('now'), datetime('now'))
,
('user599', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user599@test.com', 'User 599', 'USER', 1, datetime('now'), datetime('now'))
,
('user600', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user600@test.com', 'User 600', 'USER', 1, datetime('now'), datetime('now'))
;

-- 第7批数据 (用户 601-700)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user601', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user601@test.com', 'User 601', 'USER', 1, datetime('now'), datetime('now'))
,
('user602', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user602@test.com', 'User 602', 'USER', 1, datetime('now'), datetime('now'))
,
('user603', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user603@test.com', 'User 603', 'USER', 1, datetime('now'), datetime('now'))
,
('user604', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user604@test.com', 'User 604', 'USER', 1, datetime('now'), datetime('now'))
,
('user605', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user605@test.com', 'User 605', 'USER', 1, datetime('now'), datetime('now'))
,
('user606', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user606@test.com', 'User 606', 'USER', 1, datetime('now'), datetime('now'))
,
('user607', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user607@test.com', 'User 607', 'USER', 1, datetime('now'), datetime('now'))
,
('user608', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user608@test.com', 'User 608', 'USER', 1, datetime('now'), datetime('now'))
,
('user609', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user609@test.com', 'User 609', 'USER', 1, datetime('now'), datetime('now'))
,
('user610', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user610@test.com', 'User 610', 'USER', 1, datetime('now'), datetime('now'))
,
('user611', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user611@test.com', 'User 611', 'USER', 1, datetime('now'), datetime('now'))
,
('user612', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user612@test.com', 'User 612', 'USER', 1, datetime('now'), datetime('now'))
,
('user613', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user613@test.com', 'User 613', 'USER', 1, datetime('now'), datetime('now'))
,
('user614', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user614@test.com', 'User 614', 'USER', 1, datetime('now'), datetime('now'))
,
('user615', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user615@test.com', 'User 615', 'USER', 1, datetime('now'), datetime('now'))
,
('user616', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user616@test.com', 'User 616', 'USER', 1, datetime('now'), datetime('now'))
,
('user617', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user617@test.com', 'User 617', 'USER', 1, datetime('now'), datetime('now'))
,
('user618', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user618@test.com', 'User 618', 'USER', 1, datetime('now'), datetime('now'))
,
('user619', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user619@test.com', 'User 619', 'USER', 1, datetime('now'), datetime('now'))
,
('user620', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user620@test.com', 'User 620', 'USER', 1, datetime('now'), datetime('now'))
,
('user621', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user621@test.com', 'User 621', 'USER', 1, datetime('now'), datetime('now'))
,
('user622', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user622@test.com', 'User 622', 'USER', 1, datetime('now'), datetime('now'))
,
('user623', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user623@test.com', 'User 623', 'USER', 1, datetime('now'), datetime('now'))
,
('user624', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user624@test.com', 'User 624', 'USER', 1, datetime('now'), datetime('now'))
,
('user625', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user625@test.com', 'User 625', 'USER', 1, datetime('now'), datetime('now'))
,
('user626', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user626@test.com', 'User 626', 'USER', 1, datetime('now'), datetime('now'))
,
('user627', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user627@test.com', 'User 627', 'USER', 1, datetime('now'), datetime('now'))
,
('user628', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user628@test.com', 'User 628', 'USER', 1, datetime('now'), datetime('now'))
,
('user629', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user629@test.com', 'User 629', 'USER', 1, datetime('now'), datetime('now'))
,
('user630', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user630@test.com', 'User 630', 'USER', 1, datetime('now'), datetime('now'))
,
('user631', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user631@test.com', 'User 631', 'USER', 1, datetime('now'), datetime('now'))
,
('user632', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user632@test.com', 'User 632', 'USER', 1, datetime('now'), datetime('now'))
,
('user633', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user633@test.com', 'User 633', 'USER', 1, datetime('now'), datetime('now'))
,
('user634', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user634@test.com', 'User 634', 'USER', 1, datetime('now'), datetime('now'))
,
('user635', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user635@test.com', 'User 635', 'USER', 1, datetime('now'), datetime('now'))
,
('user636', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user636@test.com', 'User 636', 'USER', 1, datetime('now'), datetime('now'))
,
('user637', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user637@test.com', 'User 637', 'USER', 1, datetime('now'), datetime('now'))
,
('user638', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user638@test.com', 'User 638', 'USER', 1, datetime('now'), datetime('now'))
,
('user639', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user639@test.com', 'User 639', 'USER', 1, datetime('now'), datetime('now'))
,
('user640', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user640@test.com', 'User 640', 'USER', 1, datetime('now'), datetime('now'))
,
('user641', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user641@test.com', 'User 641', 'USER', 1, datetime('now'), datetime('now'))
,
('user642', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user642@test.com', 'User 642', 'USER', 1, datetime('now'), datetime('now'))
,
('user643', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user643@test.com', 'User 643', 'USER', 1, datetime('now'), datetime('now'))
,
('user644', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user644@test.com', 'User 644', 'USER', 1, datetime('now'), datetime('now'))
,
('user645', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user645@test.com', 'User 645', 'USER', 1, datetime('now'), datetime('now'))
,
('user646', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user646@test.com', 'User 646', 'USER', 1, datetime('now'), datetime('now'))
,
('user647', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user647@test.com', 'User 647', 'USER', 1, datetime('now'), datetime('now'))
,
('user648', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user648@test.com', 'User 648', 'USER', 1, datetime('now'), datetime('now'))
,
('user649', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user649@test.com', 'User 649', 'USER', 1, datetime('now'), datetime('now'))
,
('user650', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user650@test.com', 'User 650', 'USER', 1, datetime('now'), datetime('now'))
,
('user651', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user651@test.com', 'User 651', 'USER', 1, datetime('now'), datetime('now'))
,
('user652', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user652@test.com', 'User 652', 'USER', 1, datetime('now'), datetime('now'))
,
('user653', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user653@test.com', 'User 653', 'USER', 1, datetime('now'), datetime('now'))
,
('user654', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user654@test.com', 'User 654', 'USER', 1, datetime('now'), datetime('now'))
,
('user655', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user655@test.com', 'User 655', 'USER', 1, datetime('now'), datetime('now'))
,
('user656', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user656@test.com', 'User 656', 'USER', 1, datetime('now'), datetime('now'))
,
('user657', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user657@test.com', 'User 657', 'USER', 1, datetime('now'), datetime('now'))
,
('user658', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user658@test.com', 'User 658', 'USER', 1, datetime('now'), datetime('now'))
,
('user659', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user659@test.com', 'User 659', 'USER', 1, datetime('now'), datetime('now'))
,
('user660', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user660@test.com', 'User 660', 'USER', 1, datetime('now'), datetime('now'))
,
('user661', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user661@test.com', 'User 661', 'USER', 1, datetime('now'), datetime('now'))
,
('user662', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user662@test.com', 'User 662', 'USER', 1, datetime('now'), datetime('now'))
,
('user663', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user663@test.com', 'User 663', 'USER', 1, datetime('now'), datetime('now'))
,
('user664', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user664@test.com', 'User 664', 'USER', 1, datetime('now'), datetime('now'))
,
('user665', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user665@test.com', 'User 665', 'USER', 1, datetime('now'), datetime('now'))
,
('user666', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user666@test.com', 'User 666', 'USER', 1, datetime('now'), datetime('now'))
,
('user667', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user667@test.com', 'User 667', 'USER', 1, datetime('now'), datetime('now'))
,
('user668', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user668@test.com', 'User 668', 'USER', 1, datetime('now'), datetime('now'))
,
('user669', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user669@test.com', 'User 669', 'USER', 1, datetime('now'), datetime('now'))
,
('user670', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user670@test.com', 'User 670', 'USER', 1, datetime('now'), datetime('now'))
,
('user671', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user671@test.com', 'User 671', 'USER', 1, datetime('now'), datetime('now'))
,
('user672', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user672@test.com', 'User 672', 'USER', 1, datetime('now'), datetime('now'))
,
('user673', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user673@test.com', 'User 673', 'USER', 1, datetime('now'), datetime('now'))
,
('user674', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user674@test.com', 'User 674', 'USER', 1, datetime('now'), datetime('now'))
,
('user675', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user675@test.com', 'User 675', 'USER', 1, datetime('now'), datetime('now'))
,
('user676', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user676@test.com', 'User 676', 'USER', 1, datetime('now'), datetime('now'))
,
('user677', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user677@test.com', 'User 677', 'USER', 1, datetime('now'), datetime('now'))
,
('user678', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user678@test.com', 'User 678', 'USER', 1, datetime('now'), datetime('now'))
,
('user679', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user679@test.com', 'User 679', 'USER', 1, datetime('now'), datetime('now'))
,
('user680', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user680@test.com', 'User 680', 'USER', 1, datetime('now'), datetime('now'))
,
('user681', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user681@test.com', 'User 681', 'USER', 1, datetime('now'), datetime('now'))
,
('user682', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user682@test.com', 'User 682', 'USER', 1, datetime('now'), datetime('now'))
,
('user683', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user683@test.com', 'User 683', 'USER', 1, datetime('now'), datetime('now'))
,
('user684', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user684@test.com', 'User 684', 'USER', 1, datetime('now'), datetime('now'))
,
('user685', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user685@test.com', 'User 685', 'USER', 1, datetime('now'), datetime('now'))
,
('user686', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user686@test.com', 'User 686', 'USER', 1, datetime('now'), datetime('now'))
,
('user687', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user687@test.com', 'User 687', 'USER', 1, datetime('now'), datetime('now'))
,
('user688', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user688@test.com', 'User 688', 'USER', 1, datetime('now'), datetime('now'))
,
('user689', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user689@test.com', 'User 689', 'USER', 1, datetime('now'), datetime('now'))
,
('user690', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user690@test.com', 'User 690', 'USER', 1, datetime('now'), datetime('now'))
,
('user691', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user691@test.com', 'User 691', 'USER', 1, datetime('now'), datetime('now'))
,
('user692', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user692@test.com', 'User 692', 'USER', 1, datetime('now'), datetime('now'))
,
('user693', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user693@test.com', 'User 693', 'USER', 1, datetime('now'), datetime('now'))
,
('user694', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user694@test.com', 'User 694', 'USER', 1, datetime('now'), datetime('now'))
,
('user695', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user695@test.com', 'User 695', 'USER', 1, datetime('now'), datetime('now'))
,
('user696', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user696@test.com', 'User 696', 'USER', 1, datetime('now'), datetime('now'))
,
('user697', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user697@test.com', 'User 697', 'USER', 1, datetime('now'), datetime('now'))
,
('user698', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user698@test.com', 'User 698', 'USER', 1, datetime('now'), datetime('now'))
,
('user699', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user699@test.com', 'User 699', 'USER', 1, datetime('now'), datetime('now'))
,
('user700', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user700@test.com', 'User 700', 'USER', 1, datetime('now'), datetime('now'))
;

-- 第8批数据 (用户 701-800)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user701', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user701@test.com', 'User 701', 'USER', 1, datetime('now'), datetime('now'))
,
('user702', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user702@test.com', 'User 702', 'USER', 1, datetime('now'), datetime('now'))
,
('user703', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user703@test.com', 'User 703', 'USER', 1, datetime('now'), datetime('now'))
,
('user704', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user704@test.com', 'User 704', 'USER', 1, datetime('now'), datetime('now'))
,
('user705', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user705@test.com', 'User 705', 'USER', 1, datetime('now'), datetime('now'))
,
('user706', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user706@test.com', 'User 706', 'USER', 1, datetime('now'), datetime('now'))
,
('user707', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user707@test.com', 'User 707', 'USER', 1, datetime('now'), datetime('now'))
,
('user708', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user708@test.com', 'User 708', 'USER', 1, datetime('now'), datetime('now'))
,
('user709', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user709@test.com', 'User 709', 'USER', 1, datetime('now'), datetime('now'))
,
('user710', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user710@test.com', 'User 710', 'USER', 1, datetime('now'), datetime('now'))
,
('user711', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user711@test.com', 'User 711', 'USER', 1, datetime('now'), datetime('now'))
,
('user712', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user712@test.com', 'User 712', 'USER', 1, datetime('now'), datetime('now'))
,
('user713', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user713@test.com', 'User 713', 'USER', 1, datetime('now'), datetime('now'))
,
('user714', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user714@test.com', 'User 714', 'USER', 1, datetime('now'), datetime('now'))
,
('user715', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user715@test.com', 'User 715', 'USER', 1, datetime('now'), datetime('now'))
,
('user716', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user716@test.com', 'User 716', 'USER', 1, datetime('now'), datetime('now'))
,
('user717', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user717@test.com', 'User 717', 'USER', 1, datetime('now'), datetime('now'))
,
('user718', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user718@test.com', 'User 718', 'USER', 1, datetime('now'), datetime('now'))
,
('user719', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user719@test.com', 'User 719', 'USER', 1, datetime('now'), datetime('now'))
,
('user720', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user720@test.com', 'User 720', 'USER', 1, datetime('now'), datetime('now'))
,
('user721', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user721@test.com', 'User 721', 'USER', 1, datetime('now'), datetime('now'))
,
('user722', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user722@test.com', 'User 722', 'USER', 1, datetime('now'), datetime('now'))
,
('user723', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user723@test.com', 'User 723', 'USER', 1, datetime('now'), datetime('now'))
,
('user724', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user724@test.com', 'User 724', 'USER', 1, datetime('now'), datetime('now'))
,
('user725', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user725@test.com', 'User 725', 'USER', 1, datetime('now'), datetime('now'))
,
('user726', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user726@test.com', 'User 726', 'USER', 1, datetime('now'), datetime('now'))
,
('user727', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user727@test.com', 'User 727', 'USER', 1, datetime('now'), datetime('now'))
,
('user728', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user728@test.com', 'User 728', 'USER', 1, datetime('now'), datetime('now'))
,
('user729', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user729@test.com', 'User 729', 'USER', 1, datetime('now'), datetime('now'))
,
('user730', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user730@test.com', 'User 730', 'USER', 1, datetime('now'), datetime('now'))
,
('user731', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user731@test.com', 'User 731', 'USER', 1, datetime('now'), datetime('now'))
,
('user732', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user732@test.com', 'User 732', 'USER', 1, datetime('now'), datetime('now'))
,
('user733', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user733@test.com', 'User 733', 'USER', 1, datetime('now'), datetime('now'))
,
('user734', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user734@test.com', 'User 734', 'USER', 1, datetime('now'), datetime('now'))
,
('user735', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user735@test.com', 'User 735', 'USER', 1, datetime('now'), datetime('now'))
,
('user736', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user736@test.com', 'User 736', 'USER', 1, datetime('now'), datetime('now'))
,
('user737', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user737@test.com', 'User 737', 'USER', 1, datetime('now'), datetime('now'))
,
('user738', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user738@test.com', 'User 738', 'USER', 1, datetime('now'), datetime('now'))
,
('user739', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user739@test.com', 'User 739', 'USER', 1, datetime('now'), datetime('now'))
,
('user740', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user740@test.com', 'User 740', 'USER', 1, datetime('now'), datetime('now'))
,
('user741', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user741@test.com', 'User 741', 'USER', 1, datetime('now'), datetime('now'))
,
('user742', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user742@test.com', 'User 742', 'USER', 1, datetime('now'), datetime('now'))
,
('user743', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user743@test.com', 'User 743', 'USER', 1, datetime('now'), datetime('now'))
,
('user744', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user744@test.com', 'User 744', 'USER', 1, datetime('now'), datetime('now'))
,
('user745', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user745@test.com', 'User 745', 'USER', 1, datetime('now'), datetime('now'))
,
('user746', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user746@test.com', 'User 746', 'USER', 1, datetime('now'), datetime('now'))
,
('user747', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user747@test.com', 'User 747', 'USER', 1, datetime('now'), datetime('now'))
,
('user748', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user748@test.com', 'User 748', 'USER', 1, datetime('now'), datetime('now'))
,
('user749', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user749@test.com', 'User 749', 'USER', 1, datetime('now'), datetime('now'))
,
('user750', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user750@test.com', 'User 750', 'USER', 1, datetime('now'), datetime('now'))
,
('user751', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user751@test.com', 'User 751', 'USER', 1, datetime('now'), datetime('now'))
,
('user752', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user752@test.com', 'User 752', 'USER', 1, datetime('now'), datetime('now'))
,
('user753', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user753@test.com', 'User 753', 'USER', 1, datetime('now'), datetime('now'))
,
('user754', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user754@test.com', 'User 754', 'USER', 1, datetime('now'), datetime('now'))
,
('user755', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user755@test.com', 'User 755', 'USER', 1, datetime('now'), datetime('now'))
,
('user756', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user756@test.com', 'User 756', 'USER', 1, datetime('now'), datetime('now'))
,
('user757', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user757@test.com', 'User 757', 'USER', 1, datetime('now'), datetime('now'))
,
('user758', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user758@test.com', 'User 758', 'USER', 1, datetime('now'), datetime('now'))
,
('user759', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user759@test.com', 'User 759', 'USER', 1, datetime('now'), datetime('now'))
,
('user760', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user760@test.com', 'User 760', 'USER', 1, datetime('now'), datetime('now'))
,
('user761', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user761@test.com', 'User 761', 'USER', 1, datetime('now'), datetime('now'))
,
('user762', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user762@test.com', 'User 762', 'USER', 1, datetime('now'), datetime('now'))
,
('user763', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user763@test.com', 'User 763', 'USER', 1, datetime('now'), datetime('now'))
,
('user764', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user764@test.com', 'User 764', 'USER', 1, datetime('now'), datetime('now'))
,
('user765', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user765@test.com', 'User 765', 'USER', 1, datetime('now'), datetime('now'))
,
('user766', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user766@test.com', 'User 766', 'USER', 1, datetime('now'), datetime('now'))
,
('user767', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user767@test.com', 'User 767', 'USER', 1, datetime('now'), datetime('now'))
,
('user768', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user768@test.com', 'User 768', 'USER', 1, datetime('now'), datetime('now'))
,
('user769', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user769@test.com', 'User 769', 'USER', 1, datetime('now'), datetime('now'))
,
('user770', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user770@test.com', 'User 770', 'USER', 1, datetime('now'), datetime('now'))
,
('user771', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user771@test.com', 'User 771', 'USER', 1, datetime('now'), datetime('now'))
,
('user772', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user772@test.com', 'User 772', 'USER', 1, datetime('now'), datetime('now'))
,
('user773', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user773@test.com', 'User 773', 'USER', 1, datetime('now'), datetime('now'))
,
('user774', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user774@test.com', 'User 774', 'USER', 1, datetime('now'), datetime('now'))
,
('user775', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user775@test.com', 'User 775', 'USER', 1, datetime('now'), datetime('now'))
,
('user776', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user776@test.com', 'User 776', 'USER', 1, datetime('now'), datetime('now'))
,
('user777', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user777@test.com', 'User 777', 'USER', 1, datetime('now'), datetime('now'))
,
('user778', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user778@test.com', 'User 778', 'USER', 1, datetime('now'), datetime('now'))
,
('user779', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user779@test.com', 'User 779', 'USER', 1, datetime('now'), datetime('now'))
,
('user780', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user780@test.com', 'User 780', 'USER', 1, datetime('now'), datetime('now'))
,
('user781', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user781@test.com', 'User 781', 'USER', 1, datetime('now'), datetime('now'))
,
('user782', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user782@test.com', 'User 782', 'USER', 1, datetime('now'), datetime('now'))
,
('user783', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user783@test.com', 'User 783', 'USER', 1, datetime('now'), datetime('now'))
,
('user784', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user784@test.com', 'User 784', 'USER', 1, datetime('now'), datetime('now'))
,
('user785', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user785@test.com', 'User 785', 'USER', 1, datetime('now'), datetime('now'))
,
('user786', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user786@test.com', 'User 786', 'USER', 1, datetime('now'), datetime('now'))
,
('user787', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user787@test.com', 'User 787', 'USER', 1, datetime('now'), datetime('now'))
,
('user788', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user788@test.com', 'User 788', 'USER', 1, datetime('now'), datetime('now'))
,
('user789', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user789@test.com', 'User 789', 'USER', 1, datetime('now'), datetime('now'))
,
('user790', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user790@test.com', 'User 790', 'USER', 1, datetime('now'), datetime('now'))
,
('user791', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user791@test.com', 'User 791', 'USER', 1, datetime('now'), datetime('now'))
,
('user792', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user792@test.com', 'User 792', 'USER', 1, datetime('now'), datetime('now'))
,
('user793', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user793@test.com', 'User 793', 'USER', 1, datetime('now'), datetime('now'))
,
('user794', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user794@test.com', 'User 794', 'USER', 1, datetime('now'), datetime('now'))
,
('user795', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user795@test.com', 'User 795', 'USER', 1, datetime('now'), datetime('now'))
,
('user796', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user796@test.com', 'User 796', 'USER', 1, datetime('now'), datetime('now'))
,
('user797', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user797@test.com', 'User 797', 'USER', 1, datetime('now'), datetime('now'))
,
('user798', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user798@test.com', 'User 798', 'USER', 1, datetime('now'), datetime('now'))
,
('user799', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user799@test.com', 'User 799', 'USER', 1, datetime('now'), datetime('now'))
,
('user800', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user800@test.com', 'User 800', 'USER', 1, datetime('now'), datetime('now'))
;

-- 第9批数据 (用户 801-900)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user801', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user801@test.com', 'User 801', 'USER', 1, datetime('now'), datetime('now'))
,
('user802', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user802@test.com', 'User 802', 'USER', 1, datetime('now'), datetime('now'))
,
('user803', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user803@test.com', 'User 803', 'USER', 1, datetime('now'), datetime('now'))
,
('user804', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user804@test.com', 'User 804', 'USER', 1, datetime('now'), datetime('now'))
,
('user805', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user805@test.com', 'User 805', 'USER', 1, datetime('now'), datetime('now'))
,
('user806', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user806@test.com', 'User 806', 'USER', 1, datetime('now'), datetime('now'))
,
('user807', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user807@test.com', 'User 807', 'USER', 1, datetime('now'), datetime('now'))
,
('user808', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user808@test.com', 'User 808', 'USER', 1, datetime('now'), datetime('now'))
,
('user809', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user809@test.com', 'User 809', 'USER', 1, datetime('now'), datetime('now'))
,
('user810', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user810@test.com', 'User 810', 'USER', 1, datetime('now'), datetime('now'))
,
('user811', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user811@test.com', 'User 811', 'USER', 1, datetime('now'), datetime('now'))
,
('user812', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user812@test.com', 'User 812', 'USER', 1, datetime('now'), datetime('now'))
,
('user813', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user813@test.com', 'User 813', 'USER', 1, datetime('now'), datetime('now'))
,
('user814', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user814@test.com', 'User 814', 'USER', 1, datetime('now'), datetime('now'))
,
('user815', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user815@test.com', 'User 815', 'USER', 1, datetime('now'), datetime('now'))
,
('user816', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user816@test.com', 'User 816', 'USER', 1, datetime('now'), datetime('now'))
,
('user817', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user817@test.com', 'User 817', 'USER', 1, datetime('now'), datetime('now'))
,
('user818', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user818@test.com', 'User 818', 'USER', 1, datetime('now'), datetime('now'))
,
('user819', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user819@test.com', 'User 819', 'USER', 1, datetime('now'), datetime('now'))
,
('user820', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user820@test.com', 'User 820', 'USER', 1, datetime('now'), datetime('now'))
,
('user821', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user821@test.com', 'User 821', 'USER', 1, datetime('now'), datetime('now'))
,
('user822', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user822@test.com', 'User 822', 'USER', 1, datetime('now'), datetime('now'))
,
('user823', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user823@test.com', 'User 823', 'USER', 1, datetime('now'), datetime('now'))
,
('user824', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user824@test.com', 'User 824', 'USER', 1, datetime('now'), datetime('now'))
,
('user825', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user825@test.com', 'User 825', 'USER', 1, datetime('now'), datetime('now'))
,
('user826', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user826@test.com', 'User 826', 'USER', 1, datetime('now'), datetime('now'))
,
('user827', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user827@test.com', 'User 827', 'USER', 1, datetime('now'), datetime('now'))
,
('user828', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user828@test.com', 'User 828', 'USER', 1, datetime('now'), datetime('now'))
,
('user829', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user829@test.com', 'User 829', 'USER', 1, datetime('now'), datetime('now'))
,
('user830', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user830@test.com', 'User 830', 'USER', 1, datetime('now'), datetime('now'))
,
('user831', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user831@test.com', 'User 831', 'USER', 1, datetime('now'), datetime('now'))
,
('user832', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user832@test.com', 'User 832', 'USER', 1, datetime('now'), datetime('now'))
,
('user833', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user833@test.com', 'User 833', 'USER', 1, datetime('now'), datetime('now'))
,
('user834', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user834@test.com', 'User 834', 'USER', 1, datetime('now'), datetime('now'))
,
('user835', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user835@test.com', 'User 835', 'USER', 1, datetime('now'), datetime('now'))
,
('user836', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user836@test.com', 'User 836', 'USER', 1, datetime('now'), datetime('now'))
,
('user837', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user837@test.com', 'User 837', 'USER', 1, datetime('now'), datetime('now'))
,
('user838', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user838@test.com', 'User 838', 'USER', 1, datetime('now'), datetime('now'))
,
('user839', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user839@test.com', 'User 839', 'USER', 1, datetime('now'), datetime('now'))
,
('user840', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user840@test.com', 'User 840', 'USER', 1, datetime('now'), datetime('now'))
,
('user841', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user841@test.com', 'User 841', 'USER', 1, datetime('now'), datetime('now'))
,
('user842', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user842@test.com', 'User 842', 'USER', 1, datetime('now'), datetime('now'))
,
('user843', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user843@test.com', 'User 843', 'USER', 1, datetime('now'), datetime('now'))
,
('user844', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user844@test.com', 'User 844', 'USER', 1, datetime('now'), datetime('now'))
,
('user845', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user845@test.com', 'User 845', 'USER', 1, datetime('now'), datetime('now'))
,
('user846', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user846@test.com', 'User 846', 'USER', 1, datetime('now'), datetime('now'))
,
('user847', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user847@test.com', 'User 847', 'USER', 1, datetime('now'), datetime('now'))
,
('user848', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user848@test.com', 'User 848', 'USER', 1, datetime('now'), datetime('now'))
,
('user849', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user849@test.com', 'User 849', 'USER', 1, datetime('now'), datetime('now'))
,
('user850', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user850@test.com', 'User 850', 'USER', 1, datetime('now'), datetime('now'))
,
('user851', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user851@test.com', 'User 851', 'USER', 1, datetime('now'), datetime('now'))
,
('user852', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user852@test.com', 'User 852', 'USER', 1, datetime('now'), datetime('now'))
,
('user853', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user853@test.com', 'User 853', 'USER', 1, datetime('now'), datetime('now'))
,
('user854', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user854@test.com', 'User 854', 'USER', 1, datetime('now'), datetime('now'))
,
('user855', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user855@test.com', 'User 855', 'USER', 1, datetime('now'), datetime('now'))
,
('user856', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user856@test.com', 'User 856', 'USER', 1, datetime('now'), datetime('now'))
,
('user857', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user857@test.com', 'User 857', 'USER', 1, datetime('now'), datetime('now'))
,
('user858', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user858@test.com', 'User 858', 'USER', 1, datetime('now'), datetime('now'))
,
('user859', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user859@test.com', 'User 859', 'USER', 1, datetime('now'), datetime('now'))
,
('user860', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user860@test.com', 'User 860', 'USER', 1, datetime('now'), datetime('now'))
,
('user861', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user861@test.com', 'User 861', 'USER', 1, datetime('now'), datetime('now'))
,
('user862', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user862@test.com', 'User 862', 'USER', 1, datetime('now'), datetime('now'))
,
('user863', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user863@test.com', 'User 863', 'USER', 1, datetime('now'), datetime('now'))
,
('user864', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user864@test.com', 'User 864', 'USER', 1, datetime('now'), datetime('now'))
,
('user865', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user865@test.com', 'User 865', 'USER', 1, datetime('now'), datetime('now'))
,
('user866', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user866@test.com', 'User 866', 'USER', 1, datetime('now'), datetime('now'))
,
('user867', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user867@test.com', 'User 867', 'USER', 1, datetime('now'), datetime('now'))
,
('user868', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user868@test.com', 'User 868', 'USER', 1, datetime('now'), datetime('now'))
,
('user869', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user869@test.com', 'User 869', 'USER', 1, datetime('now'), datetime('now'))
,
('user870', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user870@test.com', 'User 870', 'USER', 1, datetime('now'), datetime('now'))
,
('user871', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user871@test.com', 'User 871', 'USER', 1, datetime('now'), datetime('now'))
,
('user872', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user872@test.com', 'User 872', 'USER', 1, datetime('now'), datetime('now'))
,
('user873', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user873@test.com', 'User 873', 'USER', 1, datetime('now'), datetime('now'))
,
('user874', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user874@test.com', 'User 874', 'USER', 1, datetime('now'), datetime('now'))
,
('user875', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user875@test.com', 'User 875', 'USER', 1, datetime('now'), datetime('now'))
,
('user876', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user876@test.com', 'User 876', 'USER', 1, datetime('now'), datetime('now'))
,
('user877', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user877@test.com', 'User 877', 'USER', 1, datetime('now'), datetime('now'))
,
('user878', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user878@test.com', 'User 878', 'USER', 1, datetime('now'), datetime('now'))
,
('user879', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user879@test.com', 'User 879', 'USER', 1, datetime('now'), datetime('now'))
,
('user880', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user880@test.com', 'User 880', 'USER', 1, datetime('now'), datetime('now'))
,
('user881', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user881@test.com', 'User 881', 'USER', 1, datetime('now'), datetime('now'))
,
('user882', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user882@test.com', 'User 882', 'USER', 1, datetime('now'), datetime('now'))
,
('user883', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user883@test.com', 'User 883', 'USER', 1, datetime('now'), datetime('now'))
,
('user884', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user884@test.com', 'User 884', 'USER', 1, datetime('now'), datetime('now'))
,
('user885', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user885@test.com', 'User 885', 'USER', 1, datetime('now'), datetime('now'))
,
('user886', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user886@test.com', 'User 886', 'USER', 1, datetime('now'), datetime('now'))
,
('user887', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user887@test.com', 'User 887', 'USER', 1, datetime('now'), datetime('now'))
,
('user888', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user888@test.com', 'User 888', 'USER', 1, datetime('now'), datetime('now'))
,
('user889', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user889@test.com', 'User 889', 'USER', 1, datetime('now'), datetime('now'))
,
('user890', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user890@test.com', 'User 890', 'USER', 1, datetime('now'), datetime('now'))
,
('user891', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user891@test.com', 'User 891', 'USER', 1, datetime('now'), datetime('now'))
,
('user892', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user892@test.com', 'User 892', 'USER', 1, datetime('now'), datetime('now'))
,
('user893', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user893@test.com', 'User 893', 'USER', 1, datetime('now'), datetime('now'))
,
('user894', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user894@test.com', 'User 894', 'USER', 1, datetime('now'), datetime('now'))
,
('user895', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user895@test.com', 'User 895', 'USER', 1, datetime('now'), datetime('now'))
,
('user896', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user896@test.com', 'User 896', 'USER', 1, datetime('now'), datetime('now'))
,
('user897', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user897@test.com', 'User 897', 'USER', 1, datetime('now'), datetime('now'))
,
('user898', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user898@test.com', 'User 898', 'USER', 1, datetime('now'), datetime('now'))
,
('user899', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user899@test.com', 'User 899', 'USER', 1, datetime('now'), datetime('now'))
,
('user900', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user900@test.com', 'User 900', 'USER', 1, datetime('now'), datetime('now'))
;

-- 第10批数据 (用户 901-1000)
INSERT INTO users (username, password, email, full_name, role, enabled, created_at, updated_at) VALUES
('user901', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user901@test.com', 'User 901', 'USER', 1, datetime('now'), datetime('now'))
,
('user902', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user902@test.com', 'User 902', 'USER', 1, datetime('now'), datetime('now'))
,
('user903', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user903@test.com', 'User 903', 'USER', 1, datetime('now'), datetime('now'))
,
('user904', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user904@test.com', 'User 904', 'USER', 1, datetime('now'), datetime('now'))
,
('user905', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user905@test.com', 'User 905', 'USER', 1, datetime('now'), datetime('now'))
,
('user906', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user906@test.com', 'User 906', 'USER', 1, datetime('now'), datetime('now'))
,
('user907', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user907@test.com', 'User 907', 'USER', 1, datetime('now'), datetime('now'))
,
('user908', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user908@test.com', 'User 908', 'USER', 1, datetime('now'), datetime('now'))
,
('user909', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user909@test.com', 'User 909', 'USER', 1, datetime('now'), datetime('now'))
,
('user910', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user910@test.com', 'User 910', 'USER', 1, datetime('now'), datetime('now'))
,
('user911', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user911@test.com', 'User 911', 'USER', 1, datetime('now'), datetime('now'))
,
('user912', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user912@test.com', 'User 912', 'USER', 1, datetime('now'), datetime('now'))
,
('user913', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user913@test.com', 'User 913', 'USER', 1, datetime('now'), datetime('now'))
,
('user914', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user914@test.com', 'User 914', 'USER', 1, datetime('now'), datetime('now'))
,
('user915', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user915@test.com', 'User 915', 'USER', 1, datetime('now'), datetime('now'))
,
('user916', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user916@test.com', 'User 916', 'USER', 1, datetime('now'), datetime('now'))
,
('user917', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user917@test.com', 'User 917', 'USER', 1, datetime('now'), datetime('now'))
,
('user918', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user918@test.com', 'User 918', 'USER', 1, datetime('now'), datetime('now'))
,
('user919', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user919@test.com', 'User 919', 'USER', 1, datetime('now'), datetime('now'))
,
('user920', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user920@test.com', 'User 920', 'USER', 1, datetime('now'), datetime('now'))
,
('user921', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user921@test.com', 'User 921', 'USER', 1, datetime('now'), datetime('now'))
,
('user922', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user922@test.com', 'User 922', 'USER', 1, datetime('now'), datetime('now'))
,
('user923', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user923@test.com', 'User 923', 'USER', 1, datetime('now'), datetime('now'))
,
('user924', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user924@test.com', 'User 924', 'USER', 1, datetime('now'), datetime('now'))
,
('user925', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user925@test.com', 'User 925', 'USER', 1, datetime('now'), datetime('now'))
,
('user926', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user926@test.com', 'User 926', 'USER', 1, datetime('now'), datetime('now'))
,
('user927', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user927@test.com', 'User 927', 'USER', 1, datetime('now'), datetime('now'))
,
('user928', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user928@test.com', 'User 928', 'USER', 1, datetime('now'), datetime('now'))
,
('user929', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user929@test.com', 'User 929', 'USER', 1, datetime('now'), datetime('now'))
,
('user930', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user930@test.com', 'User 930', 'USER', 1, datetime('now'), datetime('now'))
,
('user931', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user931@test.com', 'User 931', 'USER', 1, datetime('now'), datetime('now'))
,
('user932', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user932@test.com', 'User 932', 'USER', 1, datetime('now'), datetime('now'))
,
('user933', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user933@test.com', 'User 933', 'USER', 1, datetime('now'), datetime('now'))
,
('user934', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user934@test.com', 'User 934', 'USER', 1, datetime('now'), datetime('now'))
,
('user935', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user935@test.com', 'User 935', 'USER', 1, datetime('now'), datetime('now'))
,
('user936', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user936@test.com', 'User 936', 'USER', 1, datetime('now'), datetime('now'))
,
('user937', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user937@test.com', 'User 937', 'USER', 1, datetime('now'), datetime('now'))
,
('user938', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user938@test.com', 'User 938', 'USER', 1, datetime('now'), datetime('now'))
,
('user939', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user939@test.com', 'User 939', 'USER', 1, datetime('now'), datetime('now'))
,
('user940', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user940@test.com', 'User 940', 'USER', 1, datetime('now'), datetime('now'))
,
('user941', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user941@test.com', 'User 941', 'USER', 1, datetime('now'), datetime('now'))
,
('user942', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user942@test.com', 'User 942', 'USER', 1, datetime('now'), datetime('now'))
,
('user943', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user943@test.com', 'User 943', 'USER', 1, datetime('now'), datetime('now'))
,
('user944', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user944@test.com', 'User 944', 'USER', 1, datetime('now'), datetime('now'))
,
('user945', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user945@test.com', 'User 945', 'USER', 1, datetime('now'), datetime('now'))
,
('user946', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user946@test.com', 'User 946', 'USER', 1, datetime('now'), datetime('now'))
,
('user947', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user947@test.com', 'User 947', 'USER', 1, datetime('now'), datetime('now'))
,
('user948', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user948@test.com', 'User 948', 'USER', 1, datetime('now'), datetime('now'))
,
('user949', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user949@test.com', 'User 949', 'USER', 1, datetime('now'), datetime('now'))
,
('user950', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user950@test.com', 'User 950', 'USER', 1, datetime('now'), datetime('now'))
,
('user951', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user951@test.com', 'User 951', 'USER', 1, datetime('now'), datetime('now'))
,
('user952', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user952@test.com', 'User 952', 'USER', 1, datetime('now'), datetime('now'))
,
('user953', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user953@test.com', 'User 953', 'USER', 1, datetime('now'), datetime('now'))
,
('user954', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user954@test.com', 'User 954', 'USER', 1, datetime('now'), datetime('now'))
,
('user955', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user955@test.com', 'User 955', 'USER', 1, datetime('now'), datetime('now'))
,
('user956', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user956@test.com', 'User 956', 'USER', 1, datetime('now'), datetime('now'))
,
('user957', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user957@test.com', 'User 957', 'USER', 1, datetime('now'), datetime('now'))
,
('user958', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user958@test.com', 'User 958', 'USER', 1, datetime('now'), datetime('now'))
,
('user959', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user959@test.com', 'User 959', 'USER', 1, datetime('now'), datetime('now'))
,
('user960', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user960@test.com', 'User 960', 'USER', 1, datetime('now'), datetime('now'))
,
('user961', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user961@test.com', 'User 961', 'USER', 1, datetime('now'), datetime('now'))
,
('user962', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user962@test.com', 'User 962', 'USER', 1, datetime('now'), datetime('now'))
,
('user963', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user963@test.com', 'User 963', 'USER', 1, datetime('now'), datetime('now'))
,
('user964', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user964@test.com', 'User 964', 'USER', 1, datetime('now'), datetime('now'))
,
('user965', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user965@test.com', 'User 965', 'USER', 1, datetime('now'), datetime('now'))
,
('user966', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user966@test.com', 'User 966', 'USER', 1, datetime('now'), datetime('now'))
,
('user967', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user967@test.com', 'User 967', 'USER', 1, datetime('now'), datetime('now'))
,
('user968', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user968@test.com', 'User 968', 'USER', 1, datetime('now'), datetime('now'))
,
('user969', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user969@test.com', 'User 969', 'USER', 1, datetime('now'), datetime('now'))
,
('user970', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user970@test.com', 'User 970', 'USER', 1, datetime('now'), datetime('now'))
,
('user971', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user971@test.com', 'User 971', 'USER', 1, datetime('now'), datetime('now'))
,
('user972', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user972@test.com', 'User 972', 'USER', 1, datetime('now'), datetime('now'))
,
('user973', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user973@test.com', 'User 973', 'USER', 1, datetime('now'), datetime('now'))
,
('user974', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user974@test.com', 'User 974', 'USER', 1, datetime('now'), datetime('now'))
,
('user975', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user975@test.com', 'User 975', 'USER', 1, datetime('now'), datetime('now'))
,
('user976', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user976@test.com', 'User 976', 'USER', 1, datetime('now'), datetime('now'))
,
('user977', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user977@test.com', 'User 977', 'USER', 1, datetime('now'), datetime('now'))
,
('user978', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user978@test.com', 'User 978', 'USER', 1, datetime('now'), datetime('now'))
,
('user979', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user979@test.com', 'User 979', 'USER', 1, datetime('now'), datetime('now'))
,
('user980', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user980@test.com', 'User 980', 'USER', 1, datetime('now'), datetime('now'))
,
('user981', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user981@test.com', 'User 981', 'USER', 1, datetime('now'), datetime('now'))
,
('user982', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user982@test.com', 'User 982', 'USER', 1, datetime('now'), datetime('now'))
,
('user983', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user983@test.com', 'User 983', 'USER', 1, datetime('now'), datetime('now'))
,
('user984', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user984@test.com', 'User 984', 'USER', 1, datetime('now'), datetime('now'))
,
('user985', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user985@test.com', 'User 985', 'USER', 1, datetime('now'), datetime('now'))
,
('user986', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user986@test.com', 'User 986', 'USER', 1, datetime('now'), datetime('now'))
,
('user987', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user987@test.com', 'User 987', 'USER', 1, datetime('now'), datetime('now'))
,
('user988', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user988@test.com', 'User 988', 'USER', 1, datetime('now'), datetime('now'))
,
('user989', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user989@test.com', 'User 989', 'USER', 1, datetime('now'), datetime('now'))
,
('user990', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user990@test.com', 'User 990', 'USER', 1, datetime('now'), datetime('now'))
,
('user991', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user991@test.com', 'User 991', 'USER', 1, datetime('now'), datetime('now'))
,
('user992', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user992@test.com', 'User 992', 'USER', 1, datetime('now'), datetime('now'))
,
('user993', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user993@test.com', 'User 993', 'USER', 1, datetime('now'), datetime('now'))
,
('user994', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user994@test.com', 'User 994', 'USER', 1, datetime('now'), datetime('now'))
,
('user995', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user995@test.com', 'User 995', 'USER', 1, datetime('now'), datetime('now'))
,
('user996', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user996@test.com', 'User 996', 'USER', 1, datetime('now'), datetime('now'))
,
('user997', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user997@test.com', 'User 997', 'USER', 1, datetime('now'), datetime('now'))
,
('user998', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user998@test.com', 'User 998', 'USER', 1, datetime('now'), datetime('now'))
,
('user999', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user999@test.com', 'User 999', 'USER', 1, datetime('now'), datetime('now'))
,
('user1000', '$2a$10$ixlPY3AAd4ty1l6E2IsQ9OFZi2ba9ZQE0bP7RFcGIWNhyFrrT3YUi', 'user1000@test.com', 'User 1000', 'USER', 1, datetime('now'), datetime('now'))
;

