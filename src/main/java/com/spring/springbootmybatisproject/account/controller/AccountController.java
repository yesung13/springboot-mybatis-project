package com.spring.springbootmybatisproject.account.controller;

import com.spring.springbootmybatisproject.SFV;
import com.spring.springbootmybatisproject.account.model.AccountVO;
import com.spring.springbootmybatisproject.account.service.AccountService;
import com.spring.springbootmybatisproject.common.model.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/account")
public class AccountController {
    private final AccountService accountService;

    public AccountController(AccountService accountService) {
        this.accountService = accountService;
    }

    @GetMapping("/list")
    public String accountList(Model model) {
        List<AccountVO> accountVOList = accountService.getAccountList();
        model.addAttribute("accountList", accountVOList);
        return "account/accountList";
    }

    // 로그인 page
    @GetMapping("/login")
    public String accountLoginForm() {
        return "account/accountLogin";
    }

    // 계정 로그인
    @PostMapping("/loginProc")
    @ResponseBody
    public ResultVO accountLogin(@Valid AccountVO accountVO, BindingResult bindingResult, Model model,
                                 HttpServletRequest req) throws Exception {
        ResultVO result = new ResultVO();
        String accountEmail = accountVO.getAccountEmail();
        String accountPassword = accountVO.getAccountPassword();

        if (bindingResult.hasFieldErrors("accountEmail") || bindingResult.hasFieldErrors("accountPassword")) {
            model.addAttribute(bindingResult.getModel());
            System.out.println("bindingResult>>>>" + bindingResult.getModel());
        }

        if (accountEmail != null && accountPassword != null) {
            AccountVO loginAccount = accountService.getAccount(accountVO);

            try {
                String dbAccountEmail = loginAccount.getAccountEmail();
                String dbAccountPassword = loginAccount.getAccountPassword();

                if (dbAccountEmail != null && dbAccountPassword != null) {

                    HttpSession session = req.getSession(true); // 세션을 가져오기(없으면 생성한다)
                    session.setAttribute("account", loginAccount); //세션 등록
                    model.addAttribute("account", loginAccount);
                    result.setResCode(SFV.INT_RES_CODE_A_LOGIN_SUCCESS);
                    result.setResMsg(SFV.STRING_RES_A_LOGIN_SUCCESS);

                } else {

                    result.setResCode(SFV.INT_RES_CODE_A_LOGIN_CHECK);
                    result.setResMsg(SFV.STRING_RES_A_LOGIN_CHECK);
                }
            } catch (NullPointerException e) { // 아이디 또는 패스워드가 일치하지 않는 경우
                result.setResCode(SFV.INT_RES_CODE_A_LOGIN_FAIL);
                result.setResMsg(SFV.STRING_RES_A_LOGIN_FAIL);
                e.printStackTrace();

            }
        }
        return result;
    }

    // 계정 로그아웃
    @GetMapping("/logout")
    public String accountLogout(HttpSession session) {
        session.invalidate();
        return "redirect:/account/login";
    }
}
