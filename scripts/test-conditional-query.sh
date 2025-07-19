#!/bin/bash

# Conditional query test script
# Purpose: Test all conditional query functionality

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Base URL
BASE_URL="http://localhost:8080/api/users"

# Function to make API call and extract total count
make_api_call() {
    local query_data="$1"
    local response=$(curl -s -X POST "${BASE_URL}/pageQuery" \
        -H "Content-Type: application/json" \
        -d "$query_data" \
        -G \
        -d "current=1" \
        -d "size=10")
    
    echo "$response" | jq -r '.total // 0'
}

# Function to get first user info
get_first_user() {
    local query_data="$1"
    local response=$(curl -s -X POST "${BASE_URL}/pageQuery" \
        -H "Content-Type: application/json" \
        -d "$query_data" \
        -G \
        -d "current=1" \
        -d "size=1")
    
    echo "$response" | jq -r '.records[0].username // "N/A"'
}

# Function to get user email
get_user_email() {
    local query_data="$1"
    local response=$(curl -s -X POST "${BASE_URL}/pageQuery" \
        -H "Content-Type: application/json" \
        -d "$query_data" \
        -G \
        -d "current=1" \
        -d "size=1")
    
    echo "$response" | jq -r '.records[0].email // "N/A"'
}

# Function to get first 3 users
get_first_three_users() {
    local query_data="$1"
    local response=$(curl -s -X POST "${BASE_URL}/pageQuery" \
        -H "Content-Type: application/json" \
        -d "$query_data" \
        -G \
        -d "current=1" \
        -d "size=3")
    
    echo "$response" | jq -r '.records[] | .username' | tr '\n' ',' | sed 's/,$//'
}

echo -e "${BLUE}=== Conditional Query Function Test Tool ===${NC}"
echo ""

# Check if server is running
echo "Checking server status..."
if ! curl -s "${BASE_URL}/pageQuery" > /dev/null; then
    echo -e "${RED}❌ Server is not running. Please start the application first.${NC}"
    exit 1
fi
echo -e "${GREEN}✅ Server is running${NC}"
echo ""

# Test 1: Username fuzzy search
echo -e "${YELLOW}1. Testing username fuzzy search${NC}"
echo "   Condition: username contains 'user0' (should find 100 users)"
total=$(make_api_call '{"username": "user0"}')
first_user=$(get_first_user '{"username": "user0"}')

if [ "$total" -eq 100 ]; then
    echo -e "   ${GREEN}✅ Pass: Found $total users, first user: $first_user${NC}"
else
    echo -e "   ${RED}❌ Fail: Found $total users, first user: $first_user${NC}"
fi
echo ""

# Test 2: Role exact match
echo -e "${YELLOW}2. Testing role exact match${NC}"
echo "   Condition: role='ADMIN' (should find 10 users)"
total=$(make_api_call '{"role": "ADMIN"}')

if [ "$total" -eq 10 ]; then
    echo -e "   ${GREEN}✅ Pass: Found $total ADMIN users${NC}"
else
    echo -e "   ${RED}❌ Fail: Found $total ADMIN users${NC}"
fi
echo ""

# Test 3: Email domain filter
echo -e "${YELLOW}3. Testing email domain filter${NC}"
echo "   Domain: 'test.com' (should find 1000 users)"
total=$(make_api_call '{"emailDomain": "test.com"}')

if [ "$total" -eq 1000 ]; then
    echo -e "   ${GREEN}✅ Pass: Found $total test.com domain users${NC}"
else
    echo -e "   ${RED}❌ Fail: Found $total test.com domain users${NC}"
fi
echo ""

# Test 4: Combined conditions
echo -e "${YELLOW}4. Testing combined condition query${NC}"
echo "   Conditions: username contains 'user0' AND role='ADMIN' (should find 10 users)"
total=$(make_api_call '{"username": "user0", "role": "ADMIN"}')
users=$(get_first_three_users '{"username": "user0", "role": "ADMIN"}')

if [ "$total" -eq 10 ]; then
    echo -e "   ${GREEN}✅ Pass: Found $total users${NC}"
    echo -e "   ${BLUE}   First 3 users: $users${NC}"
else
    echo -e "   ${RED}❌ Fail: Found $total users${NC}"
fi
echo ""

# Test 5: Enabled status filter
echo -e "${YELLOW}5. Testing enabled status filter${NC}"
echo "   Status: enabled=true (should find all 1001 users)"
total=$(make_api_call '{"enabled": true}')

if [ "$total" -eq 1001 ]; then
    echo -e "   ${GREEN}✅ Pass: Found $total enabled users${NC}"
else
    echo -e "   ${RED}❌ Fail: Found $total enabled users${NC}"
fi
echo ""

# Test 6: Email fuzzy search
echo -e "${YELLOW}6. Testing email fuzzy search${NC}"
echo "   Keyword: 'user001' (should find 1 user)"
total=$(make_api_call '{"email": "user001"}')
email=$(get_user_email '{"email": "user001"}')

if [ "$total" -eq 1 ]; then
    echo -e "   ${GREEN}✅ Pass: Found $total users, email: $email${NC}"
else
    echo -e "   ${RED}❌ Fail: Found $total users, email: $email${NC}"
fi
echo ""

# Test 7: Pagination with conditional query
echo -e "${YELLOW}7. Testing pagination with conditional query${NC}"
echo "   Condition: username contains 'user0', page 1, size 5"
response=$(curl -s -X POST "${BASE_URL}/pageQuery" \
    -H "Content-Type: application/json" \
    -d '{"username": "user0"}' \
    -G \
    -d "current=1" \
    -d "size=5")

total=$(echo "$response" | jq -r '.total')
current=$(echo "$response" | jq -r '.current')
size=$(echo "$response" | jq -r '.size')
records_count=$(echo "$response" | jq -r '.records | length')

echo "   Total: $total, Current: $current, Size: $size, Records: $records_count"

if [ "$total" -eq 100 ] && [ "$current" -eq 1 ] && [ "$size" -eq 5 ] && [ "$records_count" -eq 5 ]; then
    echo -e "   ${GREEN}✅ Pass: Pagination works correctly${NC}"
else
    echo -e "   ${RED}❌ Fail: Pagination not working correctly${NC}"
fi
echo ""

# Test 8: Edge cases
echo -e "${YELLOW}8. Testing edge cases${NC}"

echo "   8.1 Non-existent username search"
total=$(make_api_call '{"username": "nonexistentuser"}')

if [ "$total" -eq 0 ]; then
    echo -e "   ${GREEN}✅ Pass: Non-existent username returns 0 results${NC}"
else
    echo -e "   ${RED}❌ Fail: Non-existent username returns $total results${NC}"
fi

echo "   8.2 No condition search (should return all users)"
total=$(make_api_call '{}')

if [ "$total" -eq 1001 ]; then
    echo -e "   ${GREEN}✅ Pass: No condition search returns all $total users${NC}"
else
    echo -e "   ${RED}❌ Fail: No condition search returns $total users${NC}"
fi
echo ""

# Summary
echo -e "${BLUE}=== Test Summary ===${NC}"
echo "1. Username fuzzy search:"
echo "   - Tested: username contains 'user0'"
echo "   - Expected: 100 users"
echo "   - Result: $(make_api_call '{"username": "user0"}') users"
echo ""
echo "2. Role exact match:"
echo "   - Tested: role='ADMIN'"
echo "   - Expected: 10 users"
echo "   - Result: $(make_api_call '{"role": "ADMIN"}') users"
echo ""
echo "3. Email domain filter:"
echo "   - Tested: domain='test.com'"
echo "   - Expected: 1000 users"
echo "   - Result: $(make_api_call '{"emailDomain": "test.com"}') users"
echo ""
echo "4. Combined conditions:"
echo "   - Tested: username contains 'user0' AND role='ADMIN'"
echo "   - Expected: 10 users"
echo "   - Result: $(make_api_call '{"username": "user0", "role": "ADMIN"}') users"
echo ""
echo "5. Time range query:"
echo "   - Note: Time range queries require specific date formats"
echo "   - Format: yyyy-MM-dd HH:mm:ss"
echo ""

echo -e "${GREEN}✅ All conditional query tests completed!${NC}" 