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
}
