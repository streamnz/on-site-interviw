# Test Scripts Directory

This directory contains API test scripts for end-to-end testing of the application.

## 📁 Scripts

### `test-user-controller-api.sh`

Comprehensive API test script for UserController endpoints.

**Features:**

- ✅ Real HTTP requests using curl
- ✅ JSON response validation with jq
- ✅ Performance testing with concurrent requests
- ✅ Error handling validation
- ✅ Color-coded output for better readability

## 🚀 Usage

### Prerequisites

Make sure you have the following tools installed:

```bash
# Install jq for JSON processing
brew install jq  # macOS
# or
apt-get install jq  # Ubuntu

# Install bc for mathematical calculations
brew install bc  # macOS
# or
apt-get install bc  # Ubuntu
```

### Running the API Tests

1. **Start the application first:**

```bash
mvn spring-boot:run
```

2. **Run the API test script:**

```bash
./src/test/scripts/test-user-controller-api.sh
```

### Expected Output

```
========================================
    UserController API Test Suite
========================================

=== Checking Application Status ===
✓ Application is running

=== Test 1: Get Users List ===
✓ Get users successful - Total: 1006, Current: 1, Size: 5
ℹ Response structure is correct

=== Test 2: Create User ===
✓ Create user successful - ID: 123456789, Username: api_test_user_1234567890, Email: api_test_1234567890@example.com

=== Test 3: Get User by ID ===
✓ Get user by ID successful - Username: api_test_user_1234567890, Email: api_test_1234567890@example.com

=== Test 4: Update User ===
✓ Update user successful - Email: updated_api_test_1234567890@example.com, FullName: Updated API Test User

=== Test 5: Search Users with Conditions ===
✓ Search users successful - Found 5 users

=== Test 6: Test Pagination ===
ℹ Page 1 - Total: 1006, Records: 3
ℹ Page 2 - Current: 2, Records: 3
✓ Pagination working correctly

=== Test 7: Test Error Handling ===
✓ Invalid data handling working correctly
✓ Non-existent user handling working correctly

=== Test 8: Performance Test ===
ℹ 10 concurrent requests completed in 2.5s
✓ Performance test passed - Response time acceptable

=== Test 9: Cleanup - Delete Test User ===
✓ Test user deleted successfully
✓ User deletion verified

========================================
           Test Summary
========================================
Passed: 9
Failed: 0
Total: 9

🎉 All tests passed!
```

## 🧪 Test Coverage

The API test script covers the following scenarios:

### 1. **Basic CRUD Operations**

- ✅ GET `/api/users` - List users with pagination
- ✅ POST `/api/users/create` - Create new user
- ✅ GET `/api/users/{id}` - Get user by ID
- ✅ PUT `/api/users/update` - Update user
- ✅ DELETE `/api/users/{id}` - Delete user

### 2. **Advanced Features**

- ✅ POST `/api/users/pageQuery` - Search with conditions
- ✅ Pagination testing
- ✅ Error handling validation
- ✅ Performance testing

### 3. **Error Scenarios**

- ✅ Invalid input validation
- ✅ Non-existent resource handling
- ✅ Malformed JSON payloads
- ✅ Missing required fields

### 4. **Performance Testing**

- ✅ Concurrent request handling
- ✅ Response time measurement
- ✅ Load testing simulation

## 🔧 Configuration

The script uses the following configuration:

```bash
# Base URL configuration
BASE_URL="http://localhost:8080"
API_BASE="$BASE_URL/api/users"

# Test data generation
TEST_USERNAME="api_test_user_$(date +%s)"
TEST_EMAIL="api_test_$(date +%s)@example.com"
TEST_PASSWORD="password123"
TEST_FULLNAME="API Test User"
```

## 📊 Test Metrics

- **Total Tests**: 9 comprehensive test scenarios
- **Execution Time**: ~30 seconds
- **Coverage**: 100% endpoint coverage
- **Performance**: < 5s for concurrent requests

## 🎯 Interview Benefits

This test script demonstrates:

1. **End-to-End Testing**: Real HTTP interactions
2. **Performance Awareness**: Concurrent request testing
3. **Error Handling**: Comprehensive error scenario coverage
4. **Automation**: Script-based testing approach
5. **Monitoring**: Response time and status code validation

## 🚨 Troubleshooting

### Common Issues

1. **Application not running**

   ```
   ✗ Application is not running. Please start the application first.
   Run: mvn spring-boot:run
   ```

   **Solution**: Start the application before running tests

2. **Missing jq or bc**

   ```
   Error: jq is required but not installed.
   ```

   **Solution**: Install required tools using package manager

3. **Port already in use**
   ```
   Web server failed to start. Port 8080 was already in use.
   ```
   **Solution**: Stop other applications using port 8080

### Debug Mode

To see detailed HTTP requests, modify the script:

```bash
# Change from
response=$(curl -s "$API_BASE?current=1&size=5")

# To
response=$(curl -v "$API_BASE?current=1&size=5")
```

## 📝 Customization

You can customize the test script by modifying:

1. **Base URL**: Change `BASE_URL` for different environments
2. **Test Data**: Modify test user generation logic
3. **Performance Thresholds**: Adjust timing expectations
4. **Additional Tests**: Add new test functions

## 🔄 Integration with CI/CD

This script can be integrated into CI/CD pipelines:

```yaml
# Example GitHub Actions workflow
- name: Run API Tests
  run: |
    mvn spring-boot:run &
    sleep 30
    ./src/test/scripts/test-user-controller-api.sh
```

The script returns appropriate exit codes for CI/CD integration:

- `0`: All tests passed
- `1`: Some tests failed
