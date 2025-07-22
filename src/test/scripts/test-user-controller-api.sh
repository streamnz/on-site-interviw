#!/bin/bash
# UserController API 自动化测试脚本
# 依赖: curl, jq

API_URL="http://localhost:8080/api/users"
TIMESTAMP=$(date +%s)

# 创建用户
echo "\n== 创建用户 =="
CREATE_RESPONSE=$(curl -s -X POST "$API_URL/create" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "testuser'$TIMESTAMP'",
    "password": "Password123",
    "email": "testuser'$TIMESTAMP'@example.com",
    "fullName": "Test User"
  }')
echo "$CREATE_RESPONSE" | jq
USER_ID=$(echo "$CREATE_RESPONSE" | jq -r '.id')
if [[ "$USER_ID" == "null" || -z "$USER_ID" ]]; then
  echo "[FAIL] 创建用户失败"
  exit 1
else
  echo "[PASS] 用户创建成功, id=$USER_ID"
fi

# 更新用户
echo "\n== 更新用户 =="
UPDATE_RESPONSE=$(curl -s -X PUT "$API_URL/update" \
  -H "Content-Type: application/json" \
  -d '{
    "id": '"$USER_ID"',
    "username": "testuser'$TIMESTAMP'updated",
    "fullName": "Test User Updated"
  }')
echo "$UPDATE_RESPONSE" | jq
UPDATED_NAME=$(echo "$UPDATE_RESPONSE" | jq -r '.fullName')
if [[ "$UPDATED_NAME" == "Test User Updated" ]]; then
  echo "[PASS] 用户更新成功"
else
  echo "[FAIL] 用户更新失败"
  exit 1
fi

# 分页查询
echo "\n== 分页查询 =="
PAGE_RESPONSE=$(curl -s -X POST "$API_URL/pageQuery" \
  -H "Content-Type: application/json" \
  -d '{
    "pageNum": 1,
    "pageSize": 3,
    "sorts": [{"field": "createdAt", "order": "DESC"}]
  }')
echo "$PAGE_RESPONSE" | jq
RECORDS_COUNT=$(echo "$PAGE_RESPONSE" | jq '.records | length')
if [[ "$RECORDS_COUNT" -ge 1 ]]; then
  echo "[PASS] 分页查询成功, 返回 $RECORDS_COUNT 条记录"
else
  echo "[FAIL] 分页查询失败"
  exit 1
fi

# 禁用用户
echo "\n== 禁用用户 =="
DISABLE_RESPONSE=$(curl -s -X PUT "$API_URL/disable/$USER_ID")
echo "$DISABLE_RESPONSE"
if [[ "$DISABLE_RESPONSE" == "" ]]; then
  echo "[PASS] 用户禁用成功"
else
  echo "[FAIL] 用户禁用失败"
  exit 1
fi

echo "\n所有UserController接口自动化测试通过！" 