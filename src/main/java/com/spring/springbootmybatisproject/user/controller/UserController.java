package com.spring.springbootmybatisproject.user.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/user")
public class UserController {

    // 마이페이지
    @GetMapping("/profile")
    public String UserProfileForm(){
       return "user/profile";
    }
}
