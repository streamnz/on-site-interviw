package com.streamnz.annotation;

import com.fasterxml.jackson.annotation.JacksonAnnotationsInside;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.streamnz.util.DateFormatSerializer;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Custom annotation for date formatting
 * Usage: @DateFormat(pattern = "yyyy-MM-dd HH:mm:ss")
 */
@Target({ElementType.FIELD, ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@JacksonAnnotationsInside
@JsonSerialize(using = DateFormatSerializer.class)
public @interface DateFormat {
    
    /**
     * Date format pattern
     * Default: "yyyy-MM-dd HH:mm:ss"
     */
    String pattern() default "yyyy-MM-dd HH:mm:ss";
    
    /**
     * Time zone for date formatting
     * Default: "Asia/Shanghai"
     */
    String timezone() default "Asia/Shanghai";
    
    /**
     * Whether to use local time if timezone is not specified
     * Default: true
     */
    boolean useLocalTime() default true;
} 