# 自定义日期格式化注解使用说明

## 概述

本项目实现了自定义的日期格式化注解 `@DateFormat`，可以灵活地控制 API 响应中日期字段的格式化方式。

## 功能特性

- ✅ 支持 `LocalDateTime` 和 `Date` 类型
- ✅ 自定义日期格式模式
- ✅ 时区配置
- ✅ 本地时间选项
- ✅ 与 Jackson 序列化器完美集成

## 注解定义

```java
@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@JacksonAnnotationsInside
@JsonSerialize(using = DateFormatSerializer.class)
public @interface DateFormat {

    // 日期格式模式，默认: "yyyy-MM-dd HH:mm:ss"
    String pattern() default "yyyy-MM-dd HH:mm:ss";

    // 时区，默认: "Asia/Shanghai"
    String timezone() default "Asia/Shanghai";

    // 是否使用本地时间，默认: true
    boolean useLocalTime() default true;
}
```

## 使用方法

### 1. 基本用法

```java
@Data
public class UserVO {
    private Long id;
    private String username;

    // 使用默认格式: "yyyy-MM-dd HH:mm:ss"
    @DateFormat
    private LocalDateTime createdAt;

    // 使用自定义格式
    @DateFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime updatedAt;
}
```

### 2. 自定义格式示例

```java
@Data
public class DateDemoVO {

    // 默认格式
    @DateFormat
    private LocalDateTime defaultFormat;

    // 中文格式
    @DateFormat(pattern = "yyyy年MM月dd日 HH:mm:ss")
    private LocalDateTime customFormat;

    // 短日期格式
    @DateFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime shortFormat;

    // 带毫秒的格式，UTC时区
    @DateFormat(pattern = "yyyy-MM-dd HH:mm:ss.SSS", timezone = "UTC")
    private LocalDateTime longFormat;

    // Date对象格式化
    @DateFormat(pattern = "yyyy/MM/dd HH:mm:ss")
    private Date dateObject;
}
```

### 3. 在现有 VO 中应用

```java
// UserVO.java
@Schema(description = "Created time")
@DateFormat(pattern = "yyyy-MM-dd HH:mm:ss")
private LocalDateTime createdAt;

@Schema(description = "Updated time")
@DateFormat(pattern = "yyyy-MM-dd HH:mm:ss")
private LocalDateTime updatedAt;
```

## 测试接口

### 日期格式化演示接口

```
GET /api/test/date-format/demo
```

**响应示例:**

```json
{
  "code": 200,
  "message": "Date formatting demonstration",
  "data": {
    "defaultFormat": "2025-07-19 23:51:27",
    "customFormat": "2025年07月19日 23:51:27",
    "shortFormat": "2025-07-19",
    "longFormat": "2025-07-19 23:51:27.400",
    "dateObject": "2025/07/19 23:51:27"
  }
}
```

### 用户列表接口（应用了日期格式化）

```
GET /api/users?current=1&size=1
Authorization: Bearer <jwt-token>
```

**响应示例:**

```json
{
  "id": 337197261874401280,
  "username": "johnsmith",
  "createdAt": "2025-07-19 23:41:32",
  "updatedAt": "2025-07-19 23:41:32"
}
```

## 核心组件

### 1. 自定义注解

- **文件**: `src/main/java/com/streamnz/annotation/DateFormat.java`
- **功能**: 定义日期格式化参数

### 2. Jackson 序列化器

- **文件**: `src/main/java/com/streamnz/util/DateFormatSerializer.java`
- **功能**: 实现日期格式化逻辑

### 3. Jackson 配置

- **文件**: `src/main/java/com/streamnz/config/JacksonConfig.java`
- **功能**: 配置 Jackson 支持 Java 8 时间类型

### 4. 测试控制器

- **文件**: `src/main/java/com/streamnz/controller/DateFormatTestController.java`
- **功能**: 提供日期格式化演示接口

## 支持的日期格式模式

| 模式                      | 示例                      | 说明         |
| ------------------------- | ------------------------- | ------------ |
| `yyyy-MM-dd HH:mm:ss`     | `2025-07-19 23:51:27`     | 默认格式     |
| `yyyy年MM月dd日 HH:mm:ss` | `2025年07月19日 23:51:27` | 中文格式     |
| `yyyy-MM-dd`              | `2025-07-19`              | 短日期格式   |
| `yyyy-MM-dd HH:mm:ss.SSS` | `2025-07-19 23:51:27.400` | 带毫秒格式   |
| `yyyy/MM/dd HH:mm:ss`     | `2025/07/19 23:51:27`     | 斜杠分隔格式 |

## 时区支持

- **默认时区**: `Asia/Shanghai`
- **支持格式**: 标准时区 ID，如 `UTC`, `America/New_York` 等
- **本地时间**: 可通过 `useLocalTime` 参数控制

## 优势

1. **声明式配置**: 通过注解即可配置日期格式，无需手动处理
2. **类型安全**: 编译时检查，避免运行时错误
3. **灵活性**: 支持多种日期格式和时区配置
4. **向后兼容**: 不影响现有代码，可逐步应用
5. **性能优化**: 基于 Jackson 的高效序列化机制

## 注意事项

1. 注解仅影响 JSON 序列化，不影响数据库存储
2. 时区配置需要确保系统支持对应的时区 ID
3. 建议在生产环境中使用标准时区格式
4. 毫秒精度取决于系统时钟精度

## 扩展建议

1. 可以添加更多日期类型支持（如 `LocalDate`, `ZonedDateTime`）
2. 可以实现反序列化支持（从字符串到日期对象）
3. 可以添加更多格式化选项（如语言环境支持）
4. 可以实现缓存机制提高性能
