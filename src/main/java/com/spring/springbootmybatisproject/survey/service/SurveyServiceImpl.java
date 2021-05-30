package com.spring.springbootmybatisproject.survey.service;

import com.spring.springbootmybatisproject.survey.model.SurveyItemVO;
import com.spring.springbootmybatisproject.survey.repository.SurveyMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class SurveyServiceImpl implements SurveyService {

    @Autowired
    private SurveyMapper surveyMapper;


    /* 설문 항목 가져오기 */
    @Override
    public List<SurveyItemVO> getSurveyList() {

        return surveyMapper.findBySurveyListAll();
    }

    /* 설문 항목 저장 */
    @Override
    public void saveSurveyList(SurveyItemVO surveyItemVO) {
//        surveyMapper.registerSurveyList(surveyItemVO);
        log.info("saveSurveyList Service");
    }

    @Override
    public void saveSurveyList(Long accountId, List<SurveyItemVO.ReqDTO> reqDTOList) {
                surveyMapper.registerSurveyList(accountId, reqDTOList);
    }
}

