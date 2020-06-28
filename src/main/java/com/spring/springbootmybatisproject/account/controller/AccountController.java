package com.spring.springbootmybatisproject.account.controller;

import com.spring.springbootmybatisproject.SFV;
import com.spring.springbootmybatisproject.account.model.AccountVO;
import com.spring.springbootmybatisproject.account.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    public String accountLogin(@Valid AccountVO accountVO, HttpSession session, BindingResult result, Model model,
                               RedirectAttributes rttr) {


        if (result.hasFieldErrors("accountEmail") || result.hasFieldErrors("accountPassword")) {
            model.addAttribute(result.getModel());
        }
//        List<AccountVO> loginAccount = accountService.getAccount(accountVO);
        AccountVO loginAccount = accountService.getAccount(accountVO);
        if (loginAccount == null) {
            model.addAttribute("accountEmail", "");
            model.addAttribute("errCode", SFV.INT_RES_CODE_FAIL);
            return "account/accountLogin";
        } else {
//            model.addAttribute("account", loginAccount);
            session.setAttribute("account", loginAccount); //세션 등록
//            session.setAttribute("userName", userName); //세션 등록
//            return "common/header";
//            rttr.addAttribute("account", loginAccount);
        }

        return "redirect:/board/list";
    }

    // 계정 로그아웃
    @GetMapping("/logout")
    public String accountLogout(HttpSession session){
        session.invalidate();
        return "redirect:/account/login";
    }
}
