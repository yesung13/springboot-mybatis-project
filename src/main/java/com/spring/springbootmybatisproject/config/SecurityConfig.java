package com.spring.springbootmybatisproject.config;

import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**", "/js/**", "/images/**"); // 인증 무시
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/**").permitAll();
//            .authorizeRequests() // 페이지 인증 해제
//                .antMatchers("/", "/account", "/common", "/resources/**", "/").permitAll()
//                .antMatchers("/board").hasRole("USER")
//                .anyRequest().authenticated() // 인증된 사용자만 접근 가능
//                .and()
//            .formLogin()
//                .loginPage("/account/login") // 로그인이 수행 될 페이지
//                .loginProcessingUrl("/account/loginProc")
//                .defaultSuccessUrl("/") // 로그인 성공 시 이동 페이지
////                .failureUrl() // 로그인 실패 시 보여주는 화면
//                .permitAll()
//                .and()
//            .logout()
//                .permitAll()
//                .logoutUrl("/account/logout")
//                .logoutSuccessUrl("/")
//                .and()
//            .exceptionHandling()
//                .accessDeniedPage("/error/accessDenied"); //권한이 없는 대상이 접속 시 보여주는 페이지

    }
}
