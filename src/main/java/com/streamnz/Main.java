package com.streamnz;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.streamnz.mapper")
@OpenAPIDefinition(info = @Info(
    title = "Application API",
    version = "1.0",
    description = "API Documentation"
))
public class Main {
    public static void main(String[] args) {
        SpringApplication.run(Main.class, args);
    }
}