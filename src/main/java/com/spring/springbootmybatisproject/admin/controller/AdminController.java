package com.spring.springbootmybatisproject.admin.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/main")
    public String adminMain(){
        return "admin/adminMain";
    }

    @GetMapping("/addNoticePage")
    public String addNoticePage(){
        return "admin/addNotice";
    }

//    @PostMapping("/addNotice")
//    public ResultVO addNotice(){
//        ResultVO result = new ResultVO();
//
//        return result;
//    }

}
