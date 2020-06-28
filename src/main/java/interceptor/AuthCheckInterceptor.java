package interceptor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
public class AuthCheckInterceptor implements HandlerInterceptor {
//    private final Logger logger = LoggerFactory.getLogger(HandlerInterceptor.class);

    // 요청을 컨트롤러에 보내기 전 작업
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        log.info("===============================================");
        log.info("==================== BEGIN ====================");
//        log.debug("Request URI ===> " + request.getRequestURI());
        log.info("[preHandle][" + request + "]" + "[" + request.getMethod()
                + "]" + request.getRequestURI());

        Object account = request.getSession().getAttribute("account");
        String packagePath = "/springbootmybatisproject";

        if (request.getRequestURI().equals(packagePath + "/account/loginProc") ||
                request.getRequestURI().equals(packagePath + "/account/join")) {
            //login 실행
            if (account != null) {
                response.sendRedirect(request.getContextPath() + "/board/list");
            }
            return true; //list 실행
        }
        if (account == null) {  //url이 /login or join가 아닌 모든 경우 로그인 되어 있지 않으면
            response.sendRedirect(request.getContextPath()+"/board/list");
            return false; //현재 URL 페이지 실행 않고 login 실행
        } else {
            return true; //현재 URL 페이지 실행
        }


//        HttpSession session = request.getSession();
//            Object account = session.getAttribute("account");
//            if (account != null) {
//                return true;
//            } else {
//                try {
//                    response.sendRedirect("/account/login");
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }


//        return super.preHandle(request, response, handler);
//        response.sendRedirect(request.getContextPath() + "/account/login");
//        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object
            handler, ModelAndView modelAndView) throws Exception {
        log.info("==================== END ======================");
        log.info("===============================================");
//        super.postHandle(request, response, handler, modelAndView);

        log.info("[postHandle][" + request + "]");
    }

//    @Override
//    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object
//            handler, Exception ex) throws Exception {
//        log.info("========== interceptor afterCompletion =========");
////        super.afterCompletion(request, response, handler, ex);
////        log.info("[afterCompletion][" + request + "][exception: " + ex + "]");
//    }
}
