package com.spring.springbootmybatisproject.survey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/survey")
public class SurveyController {

    @GetMapping("/list")
    public String surveyListForm() {
        return "/survey/surveyList";
    }




}
