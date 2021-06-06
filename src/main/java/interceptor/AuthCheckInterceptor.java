package interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Slf4j
public class AuthCheckInterceptor extends HandlerInterceptorAdapter {
//    private final Logger logger = LoggerFactory.getLogger(HandlerInterceptor.class);



    // 요청을 컨트롤러에 보내기 전 작업
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("Interceptor > preHandle");
        log.info("[preHandle][" + request + "]" + "[" + request.getMethod() + "]" + request.getRequestURI());
//        log.debug("Request URI ===> " + request.getRequestURI());

//        Object account = request.getSession().getAttribute("account");
        String packagePath = "/springbootmybatisproject";


        HttpSession session = request.getSession();
        Object account = session.getAttribute("account");
        if (account != null) {
            return true;
        } else {
            try {
                response.sendRedirect("/nAccount/login");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return false;
        }

//        if (request.getRequestURI().equals("/account/login") ||
//                request.getRequestURI().equals("/account/signUp")) {
//            if (account != null) {
//                return true;
//            }
//        }
//        if (account == null) {  //url이 /login 아닌 모든 경우 로그인 되어 있지 않으면
//            response.sendRedirect(request.getContextPath() + "/account/login");
//            return false; //현재 URL 페이지 실행 않고 login 실행
//        } else {
//            return true; //현재 URL 페이지 실행
//        }

//        return super.preHandle(request, response, handler);
//        response.sendRedirect(request.getContextPath() + "/account/login");
//        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object
            handler, ModelAndView modelAndView) throws Exception {
        log.info("Interceptor > postHandle");
        log.info("[postHandle][" + request + "]");
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object
            handler, Exception ex) throws Exception {
        log.info("Interceptor > afterCompletion");
        log.info("[afterCompletion][" + request + "][exception: " + ex + "]");
        super.afterCompletion(request, response, handler, ex);
    }
}
