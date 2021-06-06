//package com.spring.springbootmybatisproject.config;
//
//import com.spring.springbootmybatisproject.securitydemo.MyLoginSuccessHandler;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//
//@Configuration
//@EnableWebSecurity
//public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
//
//    // 패스워드 암호화
//    @Bean
//    public PasswordEncoder getPasswordEncoder(){
//        return new BCryptPasswordEncoder();
//    }
//
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        web.ignoring().antMatchers("/css/**", "/js/**", "/images/**", "/d3/**", "/font/**"); // 인증 무시
//    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http
//            .csrf()
//                .disable()
//            .authorizeRequests()
//                .antMatchers("/login", "/signUp")
//                    .permitAll()
//                .anyRequest()
//                .authenticated()
//            .and()
//            .formLogin()
//                .loginPage("/login")
//                .loginProcessingUrl("/doLogin")
//                .usernameParameter("id") // login page의 input의 name과 동일해야한다.
//                .passwordParameter("pw") // login page의 input의 name과 동일해야한다
//                .successHandler(new MyLoginSuccessHandler())
//            .and()
//            .logout()
//                .logoutUrl("/doLogout")
//                .logoutSuccessUrl("/login");
//
//
//    }
//}
