package com.spring.springbootmybatisproject.account.controller;

import com.spring.springbootmybatisproject.SFV;
import com.spring.springbootmybatisproject.account.model.NAccountVO;
import com.spring.springbootmybatisproject.account.service.NAccountService;
import com.spring.springbootmybatisproject.common.model.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequestMapping("/nAccount")
public class NAccountController {

    @Autowired
    private NAccountService nAccountService;

    /**
     * 회원가입 Form
     *
     * @return
     */
    @GetMapping("/signUp")
    public String accountSignUpForm() {
        return "/account/accountSignUp";
    }

    /**
     * 회원가입
     *
     * @param nAccountVO
     * @return
     */
    @PostMapping("singUpProc")
    @ResponseBody
    public ResultVO accountSignUp(NAccountVO nAccountVO) {
        ResultVO result = new ResultVO();
        try {
            nAccountService.registerSignUp(nAccountVO);
            result.setResCode(SFV.INT_RES_A_SIGNUP_SUCCESS);
            result.setResMsg(SFV.STRING_RES_A_SIGNUP_SUCCESS);

        } catch (Exception e) {
            result.setResCode(SFV.INT_RES_CODE_FAIL);
            result.setResMsg(SFV.STRING_RES_CODE_FAIL);
        }


        return result;
    }

    /**
     * 아이디 중복체크 - 요청받은 아이디 갯수 확인
     *
     * @param accountUserId
     * @return
     */
    @PostMapping("/userIdOverlap")
    @ResponseBody
    public int userIdOverlap(@RequestParam(value = "userId") String accountUserId) {

        int overlapResult = nAccountService.userIdOverlapCnt(accountUserId);
        log.info("response overlap controller");
        return overlapResult;
    }

    // 로그인 page
    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public String accountLoginForm() {
        return "/account/accountLogin";
    }


    // 계정 로그인
//    @PostMapping("/loginProc")
//    @ResponseBody
//    public ResultVO accountLogin(@Valid NAccountVO nAccountVO, BindingResult bindingResult, Model model,
//                                 HttpServletRequest req) throws Exception {
//        ResultVO result = new ResultVO();
//        String accountUserId = nAccountVO.getAccountUserId();
//        String accountPassword = nAccountVO.getAccountPassword();
//
//        /* 추후 설정 */
////        if (bindingResult.hasFieldErrors("accountUserId") || bindingResult.hasFieldErrors("accountPassword")) {
////            model.addAttribute(bindingResult.getModel());
////            System.out.println("bindingResult>>>>" + bindingResult.getModel());
////        }
//
//
//        if (accountUserId != null && accountPassword != null) {
//            NAccountVO loginAccount = nAccountService.getAccount(nAccountVO);
//            try {
//                String dbAccountUserId = loginAccount.getAccountUserId();
//                String dbAccountPassword = loginAccount.getAccountPassword();
//
//                if (dbAccountUserId != null && dbAccountPassword != null) {
//
//                    HttpSession session = req.getSession(true); // 세션을 가져오기(없으면 생성한다)
//                    session.setAttribute("account", loginAccount); //세션 등록
//                    model.addAttribute("account", loginAccount);
//
//
//
//                    result.setResCode(SFV.INT_RES_CODE_A_LOGIN_SUCCESS);
//                    result.setResMsg(SFV.STRING_RES_A_LOGIN_SUCCESS);
//
//                } else {
//                    // 아이디 또는 패스워드가 일치하지 않는 경우
//                    result.setResCode(SFV.INT_RES_CODE_A_LOGIN_CHECK);
//                    result.setResMsg(SFV.STRING_RES_A_LOGIN_CHECK);
//                }
//            } catch (NullPointerException e) {
//                result.setResCode(SFV.INT_RES_CODE_A_LOGIN_FAIL);
//                result.setResMsg(SFV.STRING_RES_A_LOGIN_FAIL);
//                e.printStackTrace();
//
//            }
//        }
//        return result;
//    }

    /* 계정 로그아웃 */
//    @GetMapping("/logout")
//    public String accountLogout(HttpSession session) {
//        session.invalidate();
//        return "redirect:/nAccount/login";
//    }
//
//    @GetMapping("/logout")
//    public String accountLogout(HttpServletRequest request, HttpServletResponse response) {
//
//        // SecurityContextLogoutHandler() 는 security 에서 기본으로 재공해줌
//        new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
//        return "redirect:/nAccount/login";
//    }
}
