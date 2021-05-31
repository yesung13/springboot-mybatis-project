package com.spring.springbootmybatisproject.survey.service;

import com.spring.springbootmybatisproject.survey.model.SurveyItemVO;

import java.util.List;

public interface SurveyService {

    /* 설문 항목 가져오기 */
    public abstract List<SurveyItemVO> getSurveyList();

    /* 설문 항목 저장 */
    public abstract void saveSurveyList(List<SurveyItemVO.ReqDTO> reqDTOList);
}
