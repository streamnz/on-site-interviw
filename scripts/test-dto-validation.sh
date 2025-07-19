#!/bin/bash

# Test UserCreateDTO and UserUpdateDTO validation functionality
BASE_URL="http://localhost:8080/api/users"

echo "🧪 Starting UserCreateDTO and UserUpdateDTO validation tests..."
echo "=========================================="

# Test 1: Create user - Success case
echo "📝 Test 1: Create user - Success case"
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

# Test 2: Create user - Password mismatch
echo "📝 Test 2: Create user - Password mismatch"
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

# Test 3: Create user - Username contains sensitive words
echo "📝 Test 3: Create user - Username contains sensitive words"
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

# Test 4: Create user - Invalid email format
echo "📝 Test 4: Create user - Invalid email format"
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

# Test 5: Create user - Weak password
echo "📝 Test 5: Create user - Weak password"
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

# Test 6: Create user - Unsupported email domain
echo "📝 Test 6: Create user - Unsupported email domain"
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

# Create a test user for update tests
echo "📝 Creating test user for update tests..."
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
echo "Created user ID: $USER_ID"

echo -e "\n"

# Test 7: Update user - Success case
echo "📝 Test 7: Update user - Success case"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d "{
    \"id\": $USER_ID,
    \"fullName\": \"Updated User Name\",
    \"email\": \"updateduser@gmail.com\",
    \"role\": \"MANAGER\"
  }" | jq '.'

echo -e "\n"

# Test 8: Update user - No fields provided
echo "📝 Test 8: Update user - No fields provided"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d "{
    \"id\": $USER_ID
  }" | jq '.'

echo -e "\n"

# Test 9: Update user - Password mismatch
echo "📝 Test 9: Update user - Password mismatch"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d "{
    \"id\": $USER_ID,
    \"password\": \"NewPassword123\",
    \"confirmPassword\": \"DifferentPassword123\",
    \"fullName\": \"Another Update\"
  }" | jq '.'

echo -e "\n"

# Test 10: Update user - Username contains sensitive words
echo "📝 Test 10: Update user - Username contains sensitive words"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d "{
    \"id\": $USER_ID,
    \"username\": \"rootuser\",
    \"fullName\": \"Root User\"
  }" | jq '.'

echo -e "\n"

# Test 11: Update user - Missing ID field
echo "📝 Test 11: Update user - Missing ID field"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d '{
    "fullName": "Test Without ID",
    "email": "test@gmail.com"
  }' | jq '.'

echo -e "\n"

# Test 12: Update user - Invalid ID
echo "📝 Test 12: Update user - Invalid ID"
curl -X PUT "${BASE_URL}/update" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 99999,
    "fullName": "Test Invalid ID",
    "email": "test@gmail.com"
  }' | jq '.'

echo -e "\n"

echo "✅ All tests completed!"
echo "==========================================" 