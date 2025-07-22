#!/bin/bash

# UserController API Test Script
# Tests all UserController endpoints with real HTTP requests

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
BASE_URL="http://localhost:8080"
API_BASE="$BASE_URL/api/users"

# Test data
TEST_USERNAME="api_test_user_$(date +%s)"
TEST_EMAIL="api_test_$(date +%s)@example.com"
TEST_PASSWORD="password123"
TEST_FULLNAME="API Test User"

# Test counter
PASSED=0
FAILED=0

# Helper functions
print_header() {
    echo -e "\n${BLUE}=== $1 ===${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
    ((PASSED++))
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
    ((FAILED++))
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

# Check if application is running
check_app_running() {
    print_header "Checking Application Status"
    
    if curl -s "$BASE_URL/api/users" > /dev/null 2>&1; then
        print_success "Application is running"
        return 0
    else
        print_error "Application is not running. Please start the application first."
        echo "Run: mvn spring-boot:run"
        exit 1
    fi
}

# Test 1: Get users list
test_get_users() {
    print_header "Test 1: Get Users List"
    
    response=$(curl -s "$API_BASE?current=1&size=5")
    
    if echo "$response" | jq -e '.records' > /dev/null 2>&1; then
        total=$(echo "$response" | jq -r '.total // 0')
        current=$(echo "$response" | jq -r '.current // 0')
        size=$(echo "$response" | jq -r '.size // 0')
        
        print_success "Get users successful - Total: $total, Current: $current, Size: $size"
        print_info "Response structure is correct"
    else
        print_error "Get users failed - Invalid response format"
        echo "Response: $response"
    fi
}

# Test 2: Create user
test_create_user() {
    print_header "Test 2: Create User"
    
    create_data=$(cat <<EOF
{
    "username": "$TEST_USERNAME",
    "password": "$TEST_PASSWORD",
    "email": "$TEST_EMAIL",
    "fullName": "$TEST_FULLNAME"
}
EOF
)
    
    response=$(curl -s -X POST "$API_BASE/create" \
        -H "Content-Type: application/json" \
        -d "$create_data")
    
    if echo "$response" | jq -e '.id' > /dev/null 2>&1; then
        user_id=$(echo "$response" | jq -r '.id')
        username=$(echo "$response" | jq -r '.username')
        email=$(echo "$response" | jq -r '.email')
        
        print_success "Create user successful - ID: $user_id, Username: $username, Email: $email"
        
        # Store user ID for later tests
        echo "$user_id" > /tmp/test_user_id
    else
        print_error "Create user failed"
        echo "Response: $response"
        return 1
    fi
}

# Test 3: Get user by ID
test_get_user_by_id() {
    print_header "Test 3: Get User by ID"
    
    user_id=$(cat /tmp/test_user_id 2>/dev/null || echo "1")
    
    response=$(curl -s "$API_BASE/$user_id")
    
    if echo "$response" | jq -e '.id' > /dev/null 2>&1; then
        username=$(echo "$response" | jq -r '.username')
        email=$(echo "$response" | jq -r '.email')
        
        print_success "Get user by ID successful - Username: $username, Email: $email"
    else
        print_error "Get user by ID failed"
        echo "Response: $response"
    fi
}

# Test 4: Update user
test_update_user() {
    print_header "Test 4: Update User"
    
    user_id=$(cat /tmp/test_user_id 2>/dev/null || echo "1")
    updated_email="updated_$TEST_EMAIL"
    updated_fullname="Updated $TEST_FULLNAME"
    
    update_data=$(cat <<EOF
{
    "id": $user_id,
    "email": "$updated_email",
    "fullName": "$updated_fullname"
}
EOF
)
    
    response=$(curl -s -X PUT "$API_BASE/update" \
        -H "Content-Type: application/json" \
        -d "$update_data")
    
    if echo "$response" | jq -e '.id' > /dev/null 2>&1; then
        email=$(echo "$response" | jq -r '.email')
        fullname=$(echo "$response" | jq -r '.fullName')
        
        print_success "Update user successful - Email: $email, FullName: $fullname"
    else
        print_error "Update user failed"
        echo "Response: $response"
    fi
}

# Test 5: Search users with conditions
test_search_users() {
    print_header "Test 5: Search Users with Conditions"
    
    search_data=$(cat <<EOF
{
    "username": "test",
    "email": "example.com"
}
EOF
)
    
    response=$(curl -s -X POST "$API_BASE/pageQuery?current=1&size=10" \
        -H "Content-Type: application/json" \
        -d "$search_data")
    
    if echo "$response" | jq -e '.records' > /dev/null 2>&1; then
        total=$(echo "$response" | jq -r '.total // 0')
        print_success "Search users successful - Found $total users"
    else
        print_error "Search users failed"
        echo "Response: $response"
    fi
}

# Test 6: Test pagination
test_pagination() {
    print_header "Test 6: Test Pagination"
    
    # Test first page
    response1=$(curl -s "$API_BASE?current=1&size=3")
    total1=$(echo "$response1" | jq -r '.total // 0')
    records1=$(echo "$response1" | jq -r '.records | length')
    
    print_info "Page 1 - Total: $total1, Records: $records1"
    
    # Test second page if there are more records
    if [ "$total1" -gt 3 ]; then
        response2=$(curl -s "$API_BASE?current=2&size=3")
        records2=$(echo "$response2" | jq -r '.records | length')
        current2=$(echo "$response2" | jq -r '.current')
        
        print_info "Page 2 - Current: $current2, Records: $records2"
        
        if [ "$records2" -gt 0 ]; then
            print_success "Pagination working correctly"
        else
            print_error "Pagination failed - No records on page 2"
        fi
    else
        print_info "Not enough records to test pagination"
    fi
}

# Test 7: Test error handling
test_error_handling() {
    print_header "Test 7: Test Error Handling"
    
    # Test invalid user creation
    invalid_data=$(cat <<EOF
{
    "username": "",
    "password": "123",
    "email": "invalid-email",
    "fullName": ""
}
EOF
)
    
    response=$(curl -s -X POST "$API_BASE/create" \
        -H "Content-Type: application/json" \
        -d "$invalid_data")
    
    if echo "$response" | jq -e '.message' > /dev/null 2>&1; then
        print_success "Invalid data handling working correctly"
    else
        print_error "Invalid data handling failed"
        echo "Response: $response"
    fi
    
    # Test non-existent user
    response=$(curl -s -w "%{http_code}" "$API_BASE/999999" -o /dev/null)
    
    if [ "$response" = "404" ]; then
        print_success "Non-existent user handling working correctly"
    else
        print_error "Non-existent user handling failed - Expected 404, got $response"
    fi
}

# Test 8: Performance test
test_performance() {
    print_header "Test 8: Performance Test"
    
    start_time=$(date +%s.%N)
    
    # Make 10 concurrent requests
    for i in {1..10}; do
        curl -s "$API_BASE?current=1&size=5" > /dev/null &
    done
    
    # Wait for all requests to complete
    wait
    
    end_time=$(date +%s.%N)
    duration=$(echo "$end_time - $start_time" | bc)
    
    print_info "10 concurrent requests completed in ${duration}s"
    
    if (( $(echo "$duration < 5" | bc -l) )); then
        print_success "Performance test passed - Response time acceptable"
    else
        print_error "Performance test failed - Response time too slow"
    fi
}

# Test 9: Cleanup - Delete test user
test_cleanup() {
    print_header "Test 9: Cleanup - Delete Test User"
    
    user_id=$(cat /tmp/test_user_id 2>/dev/null || echo "1")
    
    response=$(curl -s -w "%{http_code}" -X DELETE "$API_BASE/$user_id" -o /dev/null)
    
    if [ "$response" = "204" ]; then
        print_success "Test user deleted successfully"
        
        # Verify deletion
        verify_response=$(curl -s -w "%{http_code}" "$API_BASE/$user_id" -o /dev/null)
        if [ "$verify_response" = "404" ]; then
            print_success "User deletion verified"
        else
            print_error "User deletion verification failed"
        fi
    else
        print_error "Failed to delete test user - HTTP $response"
    fi
    
    # Clean up temp file
    rm -f /tmp/test_user_id
}

# Main test execution
main() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}    UserController API Test Suite${NC}"
    echo -e "${BLUE}========================================${NC}"
    
    # Check if required tools are available
    if ! command -v jq &> /dev/null; then
        echo -e "${RED}Error: jq is required but not installed.${NC}"
        echo "Install with: brew install jq (macOS) or apt-get install jq (Ubuntu)"
        exit 1
    fi
    
    if ! command -v bc &> /dev/null; then
        echo -e "${RED}Error: bc is required but not installed.${NC}"
        echo "Install with: brew install bc (macOS) or apt-get install bc (Ubuntu)"
        exit 1
    fi
    
    # Run tests
    check_app_running
    test_get_users
    test_create_user
    test_get_user_by_id
    test_update_user
    test_search_users
    test_pagination
    test_error_handling
    test_performance
    test_cleanup
    
    # Print summary
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}           Test Summary${NC}"
    echo -e "${BLUE}========================================${NC}"
    echo -e "${GREEN}Passed: $PASSED${NC}"
    echo -e "${RED}Failed: $FAILED${NC}"
    echo -e "${BLUE}Total: $((PASSED + FAILED))${NC}"
    
    if [ $FAILED -eq 0 ]; then
        echo -e "\n${GREEN}🎉 All tests passed!${NC}"
        exit 0
    else
        echo -e "\n${RED}❌ Some tests failed!${NC}"
        exit 1
    fi
}

# Run main function
main "$@" 