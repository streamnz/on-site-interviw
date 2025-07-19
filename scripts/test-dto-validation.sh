#!/bin/bash

# 测试UserCreateDTO和UserUpdateDTO的校验功能
BASE_URL="http://localhost:8080/api/users"

echo "🧪 开始测试UserCreateDTO和UserUpdateDTO校验功能..."
echo "=========================================="

# 测试1: 创建用户 - 成功案例
echo "📝 测试1: 创建用户 - 成功案例"
curl -X POST "${BASE_URL}/create" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser123",
    "password": "Password123",
    "confirmPassword": "Password123",
    "email": "testuser123@gmail.com",
    "fullName": "Test User",
    "role": "USER",
    "enabled": true
  }' | jq '.'

echo -e "\n"

# 测试2: 创建用户 - 密码不匹配
echo "📝 测试2: 创建用户 - 密码不匹配"
curl -X POST "${BASE_URL}/create" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser456",
    "password": "Password123",
    "confirmPassword": "Password456",
    "email": "testuser456@gmail.com",
    "fullName": "Test User 456",
    "role": "USER"
  }' | jq '.'

echo -e "\n"

# 测试3: 创建用户 - 用户名包含敏感词
echo "📝 测试3: 创建用户 - 用户名包含敏感词"
curl -X POST "${BASE_URL}/create" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "adminuser",
    "password": "Password123",
    "confirmPassword": "Password123",
    "email": "adminuser@gmail.com",
    "fullName": "Admin User",
    "role": "USER"
  }' | jq '.'

echo -e "\n"

# 测试4: 创建用户 - 邮箱格式错误
echo "📝 测试4: 创建用户 - 邮箱格式错误"
curl -X POST "${BASE_URL}/create" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser789",
    "password": "Password123",
    "confirmPassword": "Password123",
    "email": "invalid-email",
    "fullName": "Test User 789",
    "role": "USER"
  }' | jq '.'

echo -e "\n"

# 测试5: 创建用户 - 密码强度不足
echo "📝 测试5: 创建用户 - 密码强度不足"
curl -X POST "${BASE_URL}/create" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser101",
    "password": "123456",
    "confirmPassword": "123456",
    "email": "testuser101@gmail.com",
    "fullName": "Test User 101",
    "role": "USER"
  }' | jq '.'

echo -e "\n"

# 测试6: 创建用户 - 邮箱域名不支持
echo "📝 测试6: 创建用户 - 邮箱域名不支持"
curl -X POST "${BASE_URL}/create" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser202",
    "password": "Password123",
    "confirmPassword": "Password123",
    "email": "testuser202@unsupported.com",
    "fullName": "Test User 202",
    "role": "USER"
  }' | jq '.'

echo -e "\n"

# 先创建一个用户用于更新测试
echo "📝 创建测试用户用于更新测试..."
CREATE_RESPONSE=$(curl -s -X POST "${BASE_URL}/create" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "updateuser",
    "password": "Password123",
    "confirmPassword": "Password123",
    "email": "updateuser@gmail.com",
    "fullName": "Update User",
    "role": "USER"
  }')

USER_ID=$(echo $CREATE_RESPONSE | jq -r '.id')
echo "创建的用户ID: $USER_ID"

echo -e "\n"

# 测试7: 更新用户 - 成功案例
echo "📝 测试7: 更新用户 - 成功案例"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d "{
    \"id\": $USER_ID,
    \"fullName\": \"Updated User Name\",
    \"email\": \"updateduser@gmail.com\",
    \"role\": \"MANAGER\"
  }" | jq '.'

echo -e "\n"

# 测试8: 更新用户 - 没有提供任何字段
echo "📝 测试8: 更新用户 - 没有提供任何字段"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d "{
    \"id\": $USER_ID
  }" | jq '.'

echo -e "\n"

# 测试9: 更新用户 - 密码不匹配
echo "📝 测试9: 更新用户 - 密码不匹配"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d "{
    \"id\": $USER_ID,
    \"password\": \"NewPassword123\",
    \"confirmPassword\": \"DifferentPassword123\",
    \"fullName\": \"Another Update\"
  }" | jq '.'

echo -e "\n"

# 测试10: 更新用户 - 用户名包含敏感词
echo "📝 测试10: 更新用户 - 用户名包含敏感词"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d "{
    \"id\": $USER_ID,
    \"username\": \"rootuser\",
    \"fullName\": \"Root User\"
  }" | jq '.'

echo -e "\n"

# 测试11: 更新用户 - 缺少ID字段
echo "📝 测试11: 更新用户 - 缺少ID字段"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d '{
    "fullName": "Test Without ID",
    "email": "test@gmail.com"
  }' | jq '.'

echo -e "\n"

# 测试12: 更新用户 - ID无效
echo "📝 测试12: 更新用户 - ID无效"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 99999,
    "fullName": "Test Invalid ID",
    "email": "test@gmail.com"
  }' | jq '.'

echo -e "\n"

echo "✅ 所有测试完成！"
echo "==========================================" 