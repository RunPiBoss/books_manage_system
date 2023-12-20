package com.book.app;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
// 说明该工程是一个Springboot工程，可以启动内置的tomcat服务器
@SpringBootApplication
@MapperScan("com.book.app.dao")
public class SpringBookApp {
    public static void main(String[] args) {
        // 启动内置tomcat服务器
        SpringApplication.run(SpringBookApp.class);
    }
}
