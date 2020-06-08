package com.spring.springbootmybatisproject.common.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Slf4j
@Controller
public class ViewController {
    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/index")
    public String index(Model model) {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateResult = format.format(date);
        model.addAttribute("date", dateResult);

//        List<Integer> params = new ArrayList<Integer>();
//        params.add(28);
//        params.add(29);
//        params.add(30);
//        List<Map<String, Object>> list = boardService.getBoardList(params);

        return "index";
    }
}
