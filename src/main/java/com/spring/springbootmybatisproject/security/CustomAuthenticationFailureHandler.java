package com.spring.springbootmybatisproject.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
public class CustomAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {

        String errorMsg;
        String flag = "Y";
        log.info("CustomAuthenticationFailureHandler In");

        if (exception instanceof AuthenticationServiceException) {
            errorMsg = "존재하지 않는 사용자입니다.";

        } else if (exception instanceof BadCredentialsException) {
            errorMsg = "아이디 또는 비밀번호가 틀립니다.";

        } else if (exception instanceof LockedException) {
            errorMsg = "잠긴 계정입니다. 관리자에게 문의히세요.";

        } else if (exception instanceof DisabledException) {
//            errorMsg = "비활성화된 계정입니다. 관리자에게 문의히세요.";
            errorMsg = "존재하지 않은 계정입니다. 관리자에게 문의히세요.";

        } else if (exception instanceof AccountExpiredException) {
            errorMsg = "만료된 계정입니다. 관리자에게 문의히세요.";

        } else if (exception instanceof CredentialsExpiredException) {
            errorMsg = "비밀번호가 만료되었습니다. 관리자에게 문의히세요.";
        } else {
            errorMsg = "알 수 없는 이유로 로그인을 실패하였습니다. 관리자에게 문의히세요.";
        }

        request.setAttribute("loginId", request.getParameter("accountUserId"));
        request.setAttribute("loginFailMsg", errorMsg);
        request.setAttribute("flag", flag);

        // 로그인 페이지로 다시 포워딩
        String DEFAULT_FAILURE_URL = "/nAccount/login?error=true";
        RequestDispatcher dispatcher = request.getRequestDispatcher(DEFAULT_FAILURE_URL);
        dispatcher.forward(request, response);


    }
}
