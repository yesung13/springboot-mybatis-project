package com.spring.springbootmybatisproject.account.controller;

import com.spring.springbootmybatisproject.SFV;
import com.spring.springbootmybatisproject.account.model.NAccountVO;
import com.spring.springbootmybatisproject.account.service.NAccountService;
import com.spring.springbootmybatisproject.common.model.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequestMapping("/nAccount")
public class NAccountController {

    @Autowired
    private NAccountService nAccountService;

    // 회원가입
    @GetMapping("/signUp")
    public String accountSignUpForm() {
        return "/account/accountSignUp";
    }

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
}
