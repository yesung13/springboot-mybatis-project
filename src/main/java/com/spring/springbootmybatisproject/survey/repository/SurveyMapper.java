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

    /* 설문 조사 참여 여부 */
    public abstract Integer findBySurveyJoinCk(Long accountId);

    /* 설문 항목 가져오기 */
    public abstract List<SurveyItemVO> findBySurveyListAll();

    /* 설문 항목 저장 */
    void registerSurveyList(SurveyVO surveyVO);

    /* 예비/경력 개발자 전공 여부 조사 결과 - 막대 그래프 */
    List<SurveyResult.BarGraphDTO> findBySurveyMajorItemRes();

    /* 비전공자 개발 공부 학습 방법 조사 결과 - 파이그래프 */
    List<SurveyResult.PieGraphDTO> findBySurveyNonMajorStudyItemRes();

    /* 직무별 자신있는 프로그래밍 언어 조사 결과 - 가로 막대 그래프 */
    List<SurveyResult.HorizonBarDTO> findSurveyConfidentLangForJobItemRes();
}
