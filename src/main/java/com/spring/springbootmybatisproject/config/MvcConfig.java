//package com.spring.springbootmybatisproject.config;
//
//import interceptor.AuthCheckInterceptor;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.multipart.commons.CommonsMultipartResolver;
//import org.springframework.web.servlet.config.annotation.EnableWebMvc;
//import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
//
//@Configuration
//public class MvcConfig implements WebMvcConfigurer {
//    @Bean
//    public AuthCheckInterceptor authCheckInterceptor() {
//        return new AuthCheckInterceptor();
//    }
//
//
//    @Override
//    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(authCheckInterceptor())
//                .addPathPatterns("/board/**") // 적용할 url
//                .addPathPatterns("/account/list")
//                .excludePathPatterns("/account") // 제외할 url
//                .excludePathPatterns("/home"); // 제외할 url
////        WebMvcConfigurer.super.addInterceptors(registry);
//    }
//
//
//}
