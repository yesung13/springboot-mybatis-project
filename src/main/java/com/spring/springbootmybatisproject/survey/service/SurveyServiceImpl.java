package com.spring.springbootmybatisproject.survey.service;

import com.spring.springbootmybatisproject.survey.model.SurveyItemVO;
import com.spring.springbootmybatisproject.survey.repository.SurveyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SurveyServiceImpl implements SurveyService{

    @Autowired
    private SurveyMapper surveyMapper;

    /* 설문 항목 가져오기 */
    @Override
    public List<SurveyItemVO> getSurveyList() {

        return surveyMapper.findBySurveyListAll();
    }
}
