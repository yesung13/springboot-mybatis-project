package com.spring.springbootmybatisproject.admin.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {

    @GetMapping("/adminMain")
    public String adminMain(){
        return "admin/adminMain";
    }

}
