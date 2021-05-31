package com.spring.springbootmybatisproject.survey.service;

import com.spring.springbootmybatisproject.survey.model.SurveyItemVO;
import com.spring.springbootmybatisproject.survey.model.SurveyVO;
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
    public void saveSurveyList(List<SurveyItemVO.ReqDTO> reqDTOList) {
        SurveyVO surveyVO = new SurveyVO();

        char ckBoxAddCk = 'N'; // 체크박스 최대 2개 이상일 경우 체크
        for (SurveyItemVO.ReqDTO vo : reqDTOList) {
            Long accountId = vo.getAccountId();
            String groupCd = vo.getName();
            String itemCd = vo.getValue();
            log.info("accountId: " + accountId + ", groupCd:" + groupCd + ", itemCd: " + itemCd);

            surveyVO.setAccountId(accountId);

            if (groupCd.equals("P101")) {
                surveyVO.setMajorItem(itemCd);
            } else if (groupCd.equals("P102")) {
                surveyVO.setNonMajorStudyItem(itemCd);
            } else if (groupCd.equals("P103")) {
                surveyVO.setAgeItem(itemCd);
            } else if (groupCd.equals("P104")) {
                surveyVO.setCareerItem(itemCd);
            } else if (groupCd.equals("P105")) {
                surveyVO.setIncomeItem(itemCd);
            } else if (groupCd.equals("P106")) {
                surveyVO.setJobItem(itemCd);
            } else if (groupCd.equals("P201")) {
                surveyVO.setUseOSItem(itemCd);
            } else if (groupCd.equals("P202")) {
                surveyVO.setUseDBItem(itemCd);
            } else if (groupCd.equals("P203")) {
                surveyVO.setUseEditorItem(itemCd);
            } else if (groupCd.equals("P301")) {
                if(ckBoxAddCk =='Y'){
                    surveyVO.setConfidentLangItem2(itemCd);
                    ckBoxAddCk = 'N';
                }else{
                    surveyVO.setConfidentLangItem(itemCd);
                    ckBoxAddCk = 'Y';
                }
            } else if (groupCd.equals("P302")) {
                if(ckBoxAddCk =='Y'){
                    surveyVO.setLearnLangItem2(itemCd);
                    ckBoxAddCk = 'N';
                }else{
                    surveyVO.setLearnLangItem(itemCd);
                    ckBoxAddCk = 'Y';
                }
            }
        }
        surveyMapper.registerSurveyList(surveyVO);
    }
}

