package com.spring.springbootmybatisproject.survey.service;

import com.spring.springbootmybatisproject.survey.model.SurveyItemVO;
import com.spring.springbootmybatisproject.survey.model.SurveyResult;

import java.util.List;

public interface SurveyService {

    /* 설문 항목 가져오기 */
    public abstract List<SurveyItemVO> getSurveyList();

    /* 설문 항목 저장 */
    public abstract void saveSurveyList(List<SurveyItemVO.ReqDTO> reqDTOList);

    /* 예비/경력 개발자 전공 여부 조사 결과 - 막대 그래프 */
    List<SurveyResult.barGraphDTO> getMajorItemResult();

    /* 비전공자 개발 공부 학습 방법 조사 결과 - 파이그래프 */
    List<SurveyResult.pieGraphDTO> getNonMajorStudyItemResult();
}
