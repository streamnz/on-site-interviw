#!/bin/bash

# 条件查询测试脚本
# 用途：测试所有的条件查询功能

BASE_URL="http://localhost:8080/api/users"
SEARCH_API="$BASE_URL/search"

# 颜色定义
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== 条件查询功能测试工具 ===${NC}"

# 检查应用是否运行
check_app_status() {
    echo -n "检查应用程序状态..."
    if curl -s "$BASE_URL/pageQuery?current=1&size=1" > /dev/null 2>&1; then
        echo -e "${GREEN} ✅ 应用正在运行${NC}"
        return 0
    else
        echo -e "${RED} ❌ 应用未运行，请先启动应用${NC}"
        return 1
    fi
}

# 测试用户名模糊搜索
test_username_search() {
    echo -e "${YELLOW}1. 测试用户名模糊搜索${NC}"
    echo "   关键字: 'user00' (应该找到 user001-user009)"
    
    result=$(curl -s "$SEARCH_API?current=1&size=5&username=user00")
    total=$(echo "$result" | jq -r '.total' 2>/dev/null)
    first_user=$(echo "$result" | jq -r '.records[0].username' 2>/dev/null)
    
    if [ "$total" = "9" ] && [ "$first_user" = "user001" ]; then
        echo -e "   ${GREEN}✅ 通过: 找到 $total 个用户，第一个用户: $first_user${NC}"
    else
        echo -e "   ${RED}❌ 失败: 找到 $total 个用户，第一个用户: $first_user${NC}"
    fi
    echo ""
}

# 测试角色筛选
test_role_filter() {
    echo -e "${YELLOW}2. 测试角色筛选${NC}"
    echo "   角色: 'ADMIN' (应该找到11个管理员)"
    
    result=$(curl -s "$SEARCH_API?current=1&size=5&role=ADMIN")
    total=$(echo "$result" | jq -r '.total' 2>/dev/null)
    
    if [ "$total" = "11" ]; then
        echo -e "   ${GREEN}✅ 通过: 找到 $total 个ADMIN用户${NC}"
    else
        echo -e "   ${RED}❌ 失败: 找到 $total 个ADMIN用户${NC}"
    fi
    echo ""
}

# 测试邮箱域名筛选
test_email_domain() {
    echo -e "${YELLOW}3. 测试邮箱域名筛选${NC}"
    echo "   域名: 'test.com' (应该找到1000个用户)"
    
    result=$(curl -s "$SEARCH_API?current=1&size=5&emailDomain=test.com")
    total=$(echo "$result" | jq -r '.total' 2>/dev/null)
    
    if [ "$total" = "1000" ]; then
        echo -e "   ${GREEN}✅ 通过: 找到 $total 个test.com域名用户${NC}"
    else
        echo -e "   ${RED}❌ 失败: 找到 $total 个test.com域名用户${NC}"
    fi
    echo ""
}

# 测试组合条件
test_combined_conditions() {
    echo -e "${YELLOW}4. 测试组合条件查询${NC}"
    echo "   条件: 用户名包含'user0' AND 角色='ADMIN' (应该找到10个用户)"
    
    result=$(curl -s "$SEARCH_API?current=1&size=5&username=user0&role=ADMIN")
    total=$(echo "$result" | jq -r '.total' 2>/dev/null)
    users=$(echo "$result" | jq -r '.records[].username' 2>/dev/null | head -3 | tr '\n' ' ')
    
    if [ "$total" = "10" ]; then
        echo -e "   ${GREEN}✅ 通过: 找到 $total 个用户${NC}"
        echo -e "   ${BLUE}   前3个用户: $users${NC}"
    else
        echo -e "   ${RED}❌ 失败: 找到 $total 个用户${NC}"
    fi
    echo ""
}

# 测试启用状态
test_enabled_status() {
    echo -e "${YELLOW}5. 测试启用状态筛选${NC}"
    echo "   状态: enabled=true (应该找到所有1001个用户)"
    
    result=$(curl -s "$SEARCH_API?current=1&size=5&enabled=true")
    total=$(echo "$result" | jq -r '.total' 2>/dev/null)
    
    if [ "$total" = "1001" ]; then
        echo -e "   ${GREEN}✅ 通过: 找到 $total 个启用用户${NC}"
    else
        echo -e "   ${RED}❌ 失败: 找到 $total 个启用用户${NC}"
    fi
    echo ""
}

# 测试邮箱模糊搜索
test_email_search() {
    echo -e "${YELLOW}6. 测试邮箱模糊搜索${NC}"
    echo "   关键字: 'user001' (应该找到1个用户)"
    
    result=$(curl -s "$SEARCH_API?current=1&size=5&email=user001")
    total=$(echo "$result" | jq -r '.total' 2>/dev/null)
    email=$(echo "$result" | jq -r '.records[0].email' 2>/dev/null)
    
    if [ "$total" = "1" ] && [[ "$email" == *"user001"* ]]; then
        echo -e "   ${GREEN}✅ 通过: 找到 $total 个用户，邮箱: $email${NC}"
    else
        echo -e "   ${RED}❌ 失败: 找到 $total 个用户，邮箱: $email${NC}"
    fi
    echo ""
}

# 测试分页功能
test_pagination() {
    echo -e "${YELLOW}7. 测试条件查询的分页功能${NC}"
    echo "   条件: role=USER, 第1页5条, 第2页5条"
    
    # 第1页
    result1=$(curl -s "$SEARCH_API?current=1&size=5&role=USER")
    total1=$(echo "$result1" | jq -r '.total' 2>/dev/null)
    pages1=$(echo "$result1" | jq -r '.pages' 2>/dev/null)
    current1=$(echo "$result1" | jq -r '.current' 2>/dev/null)
    
    # 第2页
    result2=$(curl -s "$SEARCH_API?current=2&size=5&role=USER")
    current2=$(echo "$result2" | jq -r '.current' 2>/dev/null)
    
    if [ "$total1" = "950" ] && [ "$current1" = "1" ] && [ "$current2" = "2" ]; then
        echo -e "   ${GREEN}✅ 通过: 总共 $total1 个USER，总页数 $pages1，分页正常${NC}"
    else
        echo -e "   ${RED}❌ 失败: 总共 $total1 个USER，总页数 $pages1${NC}"
    fi
    echo ""
}

# 测试边界情况
test_edge_cases() {
    echo -e "${YELLOW}8. 测试边界情况${NC}"
    
    # 无结果的搜索
    echo "   8.1 不存在的用户名搜索"
    result=$(curl -s "$SEARCH_API?current=1&size=5&username=nonexistentuser")
    total=$(echo "$result" | jq -r '.total' 2>/dev/null)
    
    if [ "$total" = "0" ]; then
        echo -e "   ${GREEN}✅ 通过: 不存在的用户名返回0结果${NC}"
    else
        echo -e "   ${RED}❌ 失败: 不存在的用户名返回 $total 结果${NC}"
    fi
    
    # 空条件搜索
    echo "   8.2 无条件搜索（应该返回所有用户）"
    result=$(curl -s "$SEARCH_API?current=1&size=5")
    total=$(echo "$result" | jq -r '.total' 2>/dev/null)
    
    if [ "$total" = "1001" ]; then
        echo -e "   ${GREEN}✅ 通过: 无条件搜索返回所有 $total 个用户${NC}"
    else
        echo -e "   ${RED}❌ 失败: 无条件搜索返回 $total 个用户${NC}"
    fi
    echo ""
}

# 显示API使用示例
show_api_examples() {
    echo -e "${BLUE}=== API 使用示例 ===${NC}"
    echo ""
    echo "1. 用户名模糊搜索:"
    echo "   GET $SEARCH_API?username=admin"
    echo ""
    echo "2. 角色筛选:"
    echo "   GET $SEARCH_API?role=ADMIN"
    echo ""
    echo "3. 组合条件:"
    echo "   GET $SEARCH_API?username=user&role=ADMIN&enabled=true"
    echo ""
    echo "4. 分页 + 条件:"
    echo "   GET $SEARCH_API?current=2&size=10&role=USER"
    echo ""
    echo "5. 时间范围查询:"
    echo "   GET $SEARCH_API?createdAtStart=2025-07-19T06:00:00&createdAtEnd=2025-07-19T07:00:00"
    echo ""
}

# 主函数
main() {
    if ! check_app_status; then
        exit 1
    fi
    
    echo ""
    
    # 运行所有测试
    test_username_search
    test_role_filter
    test_email_domain
    test_combined_conditions
    test_enabled_status
    test_email_search
    test_pagination
    test_edge_cases
    
    echo -e "${BLUE}=== 测试完成 ===${NC}"
    echo ""
    
    # 显示使用示例
    show_api_examples
}

# 运行主函数
main "$@" 