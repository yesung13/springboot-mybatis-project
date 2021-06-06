//package com.spring.springbootmybatisproject.security;
//
//import org.springframework.security.core.Authentication;
//import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
///**
// * Created by berno579@gmail.com on 2021/06/06
// * Github : http://github.com/bee0113
// */
//// 참고 URL: https://galid1.tistory.com/698?category=791456
//
////로그인 성공시 처리할 로직
//public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {
//    private final static int TIME = 60 * 60; // 1시간 뒤 세션 아웃
//
//
//
//
//    @Override
//    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
////        HttpSession session = request.getSession(true);
//        request.getSession().setMaxInactiveInterval(TIME);
//        response.sendRedirect("/"); // 성공 시 리다렉트할 URL
//    }
//}
