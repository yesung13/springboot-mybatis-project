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

    @Override
    public SurveyVO.ResDTO getSurveyJoinCk(Long accountId) {

        SurveyVO.ResDTO dto = new SurveyVO.ResDTO();
        Integer res = surveyMapper.findBySurveyJoinCk(accountId);

        log.info("res: {}", res);

        String joinCk;
        if (res == 1) {
            joinCk = "Y";
            dto.setResult(joinCk);
            dto.setMessage("이미 참여하셨습니다.\n감사합니다.");
        } else {
            joinCk = "N";
            dto.setResult(joinCk);
            dto.setMessage("참여 가능하십니다.(1회 진행 가능)\n진행하시겠습니까?");
        }

        return dto;
    }

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

            log.info("SaveSurveyList::: accountId: {}, groupCd: {}, itemCd: {}", accountId, groupCd, itemCd);


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


    /* 직무별 자신있는 프로그래밍 언어 조사 결과 - 가로 막대 그래프 */
    @Override
    public List<SurveyResult.HorizonBarDTO> getConfidentLangForJobItemResult() {

        List<SurveyResult.HorizonBarDTO> surveyResult = surveyMapper.findSurveyConfidentLangForJobItemRes();

        // 그래프 Y축에 노출되는 name 변경
        for (SurveyResult.HorizonBarDTO vo : surveyResult) {
            if (vo.getItemCd().equals("BAC")) {
                vo.setItemCd("벡엔드");
            } else if (vo.getItemCd().equals("FRO")) {
                vo.setItemCd("프론트엔드");
            } else if (vo.getItemCd().equals("FUL")) {
                vo.setItemCd("풀스택");
            } else if (vo.getItemCd().equals("MAI")) {
                vo.setItemCd("머신러닝AI");
            } else if (vo.getItemCd().equals("AND")) {
                vo.setItemCd("Android");
            } else if (vo.getItemCd().equals("IOS")) {
                vo.setItemCd("ios");
            } else if (vo.getItemCd().equals("SEC")) {
                vo.setItemCd("보안");
            } else if (vo.getItemCd().equals("GAM")) {
                vo.setItemCd("게임");
            } else if (vo.getItemCd().equals("ETC106")) {
                vo.setItemCd("기타");
            }
        }

        return surveyResult;
    }
}