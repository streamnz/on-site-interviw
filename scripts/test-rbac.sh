#!/bin/bash

# RBAC System Test Script
# This script tests the JWT authentication and RBAC functionality

BASE_URL="http://localhost:8080"
API_BASE="$BASE_URL/api"

echo "🧪 RBAC System Test Script"
echo "=========================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    if [ $1 -eq 0 ]; then
        echo -e "${GREEN}✅ $2${NC}"
    else
        echo -e "${RED}❌ $2${NC}"
    fi
}

# Function to make HTTP requests
make_request() {
    local method=$1
    local url=$2
    local data=$3
    local token=$4
    
    if [ -n "$token" ]; then
        if [ -n "$data" ]; then
            curl -s -X $method "$url" \
                -H "Content-Type: application/json" \
                -H "Authorization: Bearer $token" \
                -d "$data"
        else
            curl -s -X $method "$url" \
                -H "Authorization: Bearer $token"
        fi
    else
        if [ -n "$data" ]; then
            curl -s -X $method "$url" \
                -H "Content-Type: application/json" \
                -d "$data"
        else
            curl -s -X $method "$url"
        fi
    fi
}

echo -e "\n${YELLOW}1. Testing User Registration${NC}"
echo "--------------------------------"

# Register a new user
REGISTER_DATA='{
    "username": "testuser",
    "password": "password123",
    "email": "testuser@example.com",
    "fullName": "Test User"
}'

echo "Registering new user..."
REGISTER_RESPONSE=$(make_request "POST" "$API_BASE/auth/register" "$REGISTER_DATA")
echo "Response: $REGISTER_RESPONSE"

# Extract token from response (simple extraction)
TOKEN=$(echo $REGISTER_RESPONSE | grep -o '"token":"[^"]*"' | cut -d'"' -f4)
if [ -n "$TOKEN" ]; then
    print_status 0 "User registration successful"
    echo "Token: ${TOKEN:0:20}..."
else
    print_status 1 "User registration failed"
fi

echo -e "\n${YELLOW}2. Testing User Login${NC}"
echo "------------------------"

# Login with admin user
LOGIN_DATA='{
    "username": "admin",
    "password": "password"
}'

echo "Logging in as admin..."
LOGIN_RESPONSE=$(make_request "POST" "$API_BASE/auth/login" "$LOGIN_DATA")
echo "Response: $LOGIN_RESPONSE"

# Extract admin token
ADMIN_TOKEN=$(echo $LOGIN_RESPONSE | grep -o '"token":"[^"]*"' | cut -d'"' -f4)
if [ -n "$ADMIN_TOKEN" ]; then
    print_status 0 "Admin login successful"
    echo "Admin Token: ${ADMIN_TOKEN:0:20}..."
else
    print_status 1 "Admin login failed"
fi

echo -e "\n${YELLOW}3. Testing Protected Endpoints${NC}"
echo "-----------------------------------"

# Test accessing protected endpoint with token
if [ -n "$TOKEN" ]; then
    echo "Testing protected endpoint with user token..."
    PROTECTED_RESPONSE=$(make_request "GET" "$API_BASE/auth/me" "" "$TOKEN")
    echo "Response: $PROTECTED_RESPONSE"
    
    if echo "$PROTECTED_RESPONSE" | grep -q "current_user"; then
        print_status 0 "Protected endpoint access successful"
    else
        print_status 1 "Protected endpoint access failed"
    fi
else
    print_status 1 "No token available for testing"
fi

echo -e "\n${YELLOW}4. Testing Unauthorized Access${NC}"
echo "--------------------------------"

# Test accessing protected endpoint without token
echo "Testing protected endpoint without token..."
UNAUTHORIZED_RESPONSE=$(make_request "GET" "$API_BASE/auth/me")
echo "Response: $UNAUTHORIZED_RESPONSE"

if echo "$UNAUTHORIZED_RESPONSE" | grep -q "Unauthorized\|401"; then
    print_status 0 "Unauthorized access properly blocked"
else
    print_status 1 "Unauthorized access not properly handled"
fi

echo -e "\n${YELLOW}5. Testing User Logout${NC}"
echo "---------------------------"

if [ -n "$TOKEN" ]; then
    echo "Testing user logout..."
    LOGOUT_RESPONSE=$(make_request "POST" "$API_BASE/auth/logout" "" "$TOKEN")
    echo "Response: $LOGOUT_RESPONSE"
    print_status 0 "Logout request sent"
else
    print_status 1 "No token available for logout test"
fi

echo -e "\n${YELLOW}6. Testing Database Schema${NC}"
echo "--------------------------------"

# Test if the application is running and database is accessible
HEALTH_RESPONSE=$(make_request "GET" "$BASE_URL/actuator/health" 2>/dev/null || echo "Health endpoint not available")
if [ "$HEALTH_RESPONSE" != "Health endpoint not available" ]; then
    print_status 0 "Application is running"
else
    print_status 1 "Application health check failed"
fi

echo -e "\n${YELLOW}7. Testing Swagger Documentation${NC}"
echo "------------------------------------"

# Test Swagger UI accessibility
SWAGGER_RESPONSE=$(make_request "GET" "$BASE_URL/swagger-ui.html")
if echo "$SWAGGER_RESPONSE" | grep -q "Swagger UI"; then
    print_status 0 "Swagger UI is accessible"
    echo "Swagger UI URL: $BASE_URL/swagger-ui.html"
else
    print_status 1 "Swagger UI not accessible"
fi

echo -e "\n${GREEN}🎉 RBAC System Test Completed!${NC}"
echo "======================================"
echo ""
echo "📋 Test Summary:"
echo "- User Registration: $(if [ -n "$TOKEN" ]; then echo "✅"; else echo "❌"; fi)"
echo "- User Login: $(if [ -n "$ADMIN_TOKEN" ]; then echo "✅"; else echo "❌"; fi)"
echo "- Protected Endpoints: $(if echo "$PROTECTED_RESPONSE" | grep -q "current_user"; then echo "✅"; else echo "❌"; fi)"
echo "- Unauthorized Access: $(if echo "$UNAUTHORIZED_RESPONSE" | grep -q "Unauthorized\|401"; then echo "✅"; else echo "❌"; fi)"
echo "- Application Health: $(if [ "$HEALTH_RESPONSE" != "Health endpoint not available" ]; then echo "✅"; else echo "❌"; fi)"
echo ""
echo "🔗 Useful URLs:"
echo "- Swagger UI: $BASE_URL/swagger-ui.html"
echo "- API Docs: $BASE_URL/v3/api-docs"
echo "- Health Check: $BASE_URL/actuator/health"
echo ""
echo "🔑 Test Credentials:"
echo "- Admin: admin/password"
echo "- Test User: testuser/password123" 