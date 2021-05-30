package com.spring.springbootmybatisproject.survey.controller;

import com.spring.springbootmybatisproject.common.model.ResultVO;
import com.spring.springbootmybatisproject.survey.model.SurveyItemVO;
import com.spring.springbootmybatisproject.survey.service.SurveyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/survey")
public class SurveyController {

    ResultVO result = new ResultVO();

    @Autowired
    private SurveyService surveyService;

    @GetMapping("/list")
    public String surveyListForm() {
        return "/survey/surveyList";
    }


    /* 설문 항목 가져오기 */
    @GetMapping("/listProc")
    @ResponseBody
    public List<SurveyItemVO> surveyList(Model model) {
        List<SurveyItemVO> surveyList = surveyService.getSurveyList();

        log.info("list size: " + surveyList.size());
        for (SurveyItemVO vo : surveyList) {
            log.info("controller surveyList" + vo);

        }
//        model.addAttribute("surveyList", surveyList);

        return surveyList;
//        return "/survey/surveyList";

    }


}
