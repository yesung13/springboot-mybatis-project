package com.spring.springbootmybatisproject.security;

import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    // 패스워드 암호화
    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

//    @Bean
//    public CustomLoginSuccessHandler loginSuccessHandler() {
//        return new CustomLoginSuccessHandler();
//    }

//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(nccountService);
//    }

//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        web.ignoring().antMatchers("/css/**", "/js/**", "/images/**", "/d3/**", "/font/**"); // 인증 무시
//    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .cors().disable()      // cors 비활성화
                .csrf().disable()      // csrf 비활성화
                .formLogin().disable() //기본 로그인 페이지 없애기
                .headers().frameOptions().disable();
//        /* 기본 테스트 시 사용 */
////        http.
////            .authorizeRequests()
////                .antMatchers("/admin/**").hasRole("ADMIN")
////                .antMatchers("/**").permitAll();
//
//        /* 실제 사용 */
////        http
//////            .csrf()
//////                .disable() // csrf 비활성화
////            .authorizeRequests() // 페이지 인증 해제
////                .antMatchers("/", "/resources/**","/board/list", "/nAccount/signUp", "/nAccount/login", "/nAccount/loginProc").permitAll()
////                .antMatchers("/account/list").hasRole("ADMIN")
////                .antMatchers("/board/detail").hasRole("USER")
////                .anyRequest() // 위 지정한 URL 이외 모든 URL
////                .authenticated() // 인증된 사용자만 접근 가능
////                .and()
////            .formLogin()
////                .loginPage("/nAccount/login") // 로그인이 수행 될 페이지
////                .loginProcessingUrl("/nAccount/loginProc") // <form action> 일 경우 사용
////                .defaultSuccessUrl("/") // 로그인 성공 시 이동 페이지
//////                .failureUrl() // 로그인 실패 시 보여주는 화면
////                .permitAll();
////                .and()
////            .logout()
////                .permitAll()
////                .logoutUrl("/account/logout")
////                .logoutSuccessUrl("/")
////                .and()
////            .exceptionHandling()
////                .accessDeniedPage("/error/accessDenied"); //권한이 없는 대상이 접속 시 보여주는 페이지
//
//        http
//                .csrf()
//                    .disable()
//                .authorizeRequests()
//                    .antMatchers("/", "/resources/**", "/board/list", "/nAccount/signUp", "/nAccount/**").permitAll()
////                    .antMatchers("/survey/**", "/board/detail", "/board/getAttachList"
////                            , "/board/write", "/board/register", "/board/modify", "/board/delete"
////                            , "/board/search", "/board/viewCnt")
////                .antMatchers("/admin/**").hasRole("ROLE_ADMIN")
//                    .anyRequest().authenticated()
//                .and()
//                .formLogin()
//                    .loginPage("/nAccount/login")
//                    .usernameParameter("accountUserId") // login page의 input의 name과 동일해야한다.
//                    .passwordParameter("accountPassword") // login page의 input의 name과 동일해야한다
//                    .successHandler(new CustomLoginSuccessHandler())
//                .and()
//                .logout()
////                    .logoutUrl("/doLogout")
//                    .logoutSuccessUrl("/nAccount/login") // 로그아웃 성공 시 리다이렉트 주소
//                    .invalidateHttpSession(true); //세션 날리기
//
//
    }

}
