package com.spring.springbootmybatisproject.config;

import com.spring.springbootmybatisproject.security.CustomAuthenticationFailureHandler;
import com.spring.springbootmybatisproject.security.UserPrincipalDetailsService;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    private final UserPrincipalDetailsService userPrincipalDetailsService;
//    private final CustomAuthenticationFailureHandler authenticationFailureHandler;

    @Bean
    public AuthenticationFailureHandler authenticationFailureHandler() {
        return new CustomAuthenticationFailureHandler();
    }
    /* database authentication을 사용하기위해 DaoAuthenticationProvider를 정의 */
    @Bean
    DaoAuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();

        daoAuthenticationProvider.setPasswordEncoder(getPasswordEncoder());
        daoAuthenticationProvider.setUserDetailsService(this.userPrincipalDetailsService);

        return daoAuthenticationProvider;
    }

    // 패스워드 암호화
    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
//        auth
//                .inMemoryAuthentication()
//                .withUser("admin")
//                .password(getPasswordEncoder().encode("admin123"))
//                .roles("ADMIN").authorities("ACCESS_TEST1", "ACCESS_TEST2")
//                .and()
//                .withUser("user")
//                .password(getPasswordEncoder().encode("user123"))
//                .roles("USER")
//                .and()
//                .withUser("manager")
//                .password(getPasswordEncoder().encode("manager123"))
//                .roles("MANAGER").authorities("ACCESS_TEST1");
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/css/**", "/js/**", "/images/**", "/d3/**", "/font/**", "/resources/**"); // 인증 무시
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // HttpSecurity 작성시 반드시 순서 고려 -> 위에서 부터 permitAll 인 경우 하위 접근제한자들이 작동하지 않음
//        http
//                .cors().disable()      // cors 비활성화
//                .csrf().disable()      // csrf 비활성화
//                .formLogin().disable() //기본 로그인 페이지 없애기
//                .headers().frameOptions().disable();


        /* 실제 사용 */
        http
            .csrf()
                .disable() // csrf 비활성화
            .authorizeRequests() // 페이지 인증 해제
                .antMatchers("/resources/**", "/nAccount/**").permitAll()
                .antMatchers("/home").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/board/**").hasAnyRole("USER", "ADMIN")
                .antMatchers("/survey/**").hasAnyRole("USER", "ADMIN")
//                .anyRequest() // 위 지정한 URL 이외 모든 URL
//                .authenticated() // 인증된 사용자만 접근 가능
            .and()
            .formLogin()
                .loginProcessingUrl("/nAccount/loginProc") // <form action> 일 경우 사용
                .loginPage("/nAccount/login").permitAll() // 로그인이 수행 될 페이지
                .defaultSuccessUrl("/home") // 로그인 성공 시 이동 페이지
//                .failureUrl("login?error").permitAll() // 로그인 실패 시 보여주는 화면
                .failureHandler(authenticationFailureHandler())
                .usernameParameter("accountUserId")
                .passwordParameter("accountPassword")
//                .successHandler()
            .and()
            .logout()
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
                .logoutSuccessUrl("/nAccount/login")
                .invalidateHttpSession(true);
//            .and()
//            .exceptionHandling().accessDeniedPage("");

    }


}
