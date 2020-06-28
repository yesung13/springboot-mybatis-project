package com.spring.springbootmybatisproject.config;

import interceptor.AuthCheckInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {
    @Bean
    public AuthCheckInterceptor authCheckInterceptor() {
        return new AuthCheckInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authCheckInterceptor())
                .addPathPatterns("/**") // 적용할 url
                .excludePathPatterns("/board/boardList*","/board/boardDetail*"); // 제외할 url
//        WebMvcConfigurer.super.addInterceptors(registry);
    }


}
