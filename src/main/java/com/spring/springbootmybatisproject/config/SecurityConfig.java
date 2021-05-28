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
        /* 기본 테스트 시 사용 */
//        http.
//            .authorizeRequests()
//                .antMatchers("/admin/**").hasRole("ADMIN")
//                .antMatchers("/**").permitAll();

        /* 실제 사용 */
//        http
////            .csrf()
////                .disable() // csrf 비활성화
//            .authorizeRequests() // 페이지 인증 해제
//                .antMatchers("/", "/resources/**","/board/list", "/nAccount/signUp", "/nAccount/login", "/nAccount/loginProc").permitAll()
//                .antMatchers("/account/list").hasRole("ADMIN")
//                .antMatchers("/board/detail").hasRole("USER")
//                .anyRequest() // 위 지정한 URL 이외 모든 URL
//                .authenticated() // 인증된 사용자만 접근 가능
//                .and()
//            .formLogin()
//                .loginPage("/nAccount/login") // 로그인이 수행 될 페이지
//                .loginProcessingUrl("/nAccount/loginProc")
//                .defaultSuccessUrl("/") // 로그인 성공 시 이동 페이지
////                .failureUrl() // 로그인 실패 시 보여주는 화면
//                .permitAll();
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
