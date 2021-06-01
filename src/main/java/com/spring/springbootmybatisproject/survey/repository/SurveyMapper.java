package com.spring.springbootmybatisproject.survey.repository;

import com.spring.springbootmybatisproject.survey.model.SurveyItemVO;
import com.spring.springbootmybatisproject.survey.model.SurveyResult;
import com.spring.springbootmybatisproject.survey.model.SurveyVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface SurveyMapper {

    /* 설문 항목 가져오기 */
    public abstract List<SurveyItemVO> findBySurveyListAll();

    /* 설문 항목 저장 */
//    public abstract void registerSurveyList(SurveyItemVO surveyItemVO);
    void registerSurveyList(SurveyVO surveyVO);

    List<SurveyResult> findBySurveyMajorItemRes();
}
