package com.spring.springbootmybatisproject.account.controller;

import com.spring.springbootmybatisproject.SFV;
import com.spring.springbootmybatisproject.account.model.AccountVO;
import com.spring.springbootmybatisproject.account.service.AccountService;
import com.spring.springbootmybatisproject.common.model.ResultVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {
    private final AccountService accountService;

    public AccountController(AccountService accountService) {
        this.accountService = accountService;
    }

    @GetMapping("/list")
    public String accountMain(Model model) {
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
    public ResultVO accountLogin(@Valid AccountVO accountVO, BindingResult result, Model model,
                                 HttpServletRequest req) {
        ResultVO res = new ResultVO();

        if (result.hasFieldErrors("accountEmail") || result.hasFieldErrors("accountPassword")) {
            model.addAttribute(result.getModel());
        }
        AccountVO loginAccount = accountService.getAccount(accountVO);
        if (loginAccount == null) {
            res.setResCode(SFV.INT_RES_CODE_A_LOGIN_FAIL);
            res.setResMsg(SFV.STRING_RES_A_LOGIN_FAIL);
//            return "account/accountLogin";
        } else {
            // 로그인 시 세션 저장
            HttpSession session = req.getSession(true); // 세션을 가져오기(없으면 생성한다)
            session.setAttribute("account", loginAccount); //세션 등록
            model.addAttribute("account", loginAccount);
            res.setResCode(SFV.INT_RES_CODE_A_LOGIN_SUCCESS);
            res.setResMsg(SFV.STRING_RES_A_LOGIN_SUCCESS);
        }

        return res;
    }

    // 계정 로그아웃
    @GetMapping("/logout")
    public String accountLogout(HttpSession session){
        session.invalidate();
        return "redirect:/account/login";
    }
}
