package com.spring.springbootmybatisproject.survey.service;

import com.spring.springbootmybatisproject.survey.model.SurveyItemVO;
import com.spring.springbootmybatisproject.survey.model.SurveyResult;
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
        String ckBoxAddCk = ""; // 체크박스 최대 2개 이상일 경우 체크
        Long accountId = null;
        for (SurveyItemVO.ReqDTO vo : reqDTOList) {

            // 리스트에서 accountId 값 추출
            if (vo.getName().equals("accountId")) {
                accountId = Long.parseLong(vo.getValue());
                surveyVO.setAccountId(accountId);
            }

            String groupCd = vo.getName();
            String itemCd = vo.getValue();

            log.info("accountId: " + accountId + ", groupCd:" + groupCd + ", itemCd: " + itemCd);


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
                if (ckBoxAddCk.equals("Y1")) {
                    surveyVO.setConfidentLangItem2(itemCd);
                } else {
                    surveyVO.setConfidentLangItem(itemCd);
                    ckBoxAddCk = "Y1";
                }
            } else if (groupCd.equals("P302")) {
                if (ckBoxAddCk.equals("Y2")) {
                    surveyVO.setLearnLangItem2(itemCd);

                } else {
                    surveyVO.setLearnLangItem(itemCd);
                    ckBoxAddCk = "Y2";
                }
            }
        }
        surveyMapper.registerSurveyList(surveyVO);
    }

    /* 예비/경력 개발자 전공 여부 조사 결과 - 막대 그래프 */
    @Override
    public List<SurveyResult.BarGraphDTO> getMajorItemResult() {
        return surveyMapper.findBySurveyMajorItemRes();
    }

    /* 비전공자 개발 공부 학습 방법 조사 결과 - 파이그래프 */
    @Override
    public List<SurveyResult.PieGraphDTO> getNonMajorStudyItemResult() {
        return surveyMapper.findBySurveyNonMajorStudyItemRes();
    }
}

