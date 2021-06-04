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

    /* 직무별 자신있는 프로그래밍 언어 조사 결과 - 가로 막대 그래프 */
//    @Override
//    public List<SurveyResult.HorizonBarDTO> getConfidentLangForJobItemResult() {
//        List<HashMap<String, Object>> listMap = surveyMapper.findBySurveyConfidentLangForJobItemRes();
//
//        log.info("Map Data::{}", listMap);
//
//        // 리스트 결과
//
//        List<SurveyResult.HorizonBarDTO> surveyResult = new ArrayList<SurveyResult.HorizonBarDTO>();
//        SurveyResult.HorizonBarDTO dto = new SurveyResult.HorizonBarDTO();
//
//        String[] jobCheckArr = {"BAC", "FRO", "FUL", "MAI", "AND", "IOS", "SEC", "GAM", "ETC106"};
//        String[] langCheCkArr = {"JAV", "JAS", "PYH", "CPP", "COO", "PHP", "KOT", "TYS", "ETC301"};
//
//
//        for (HashMap<String, Object> map : listMap) {
//            log.info("Map::{}", map);
//            // if문 시작
//            if ("BAC".equals(map.get("JOB_CD"))) {
//                dto.setGroup1(String.valueOf(map.get("JOB_CD")));
//
//                if (map.get("LANG_CD") != null) {
//                    if ("JAV".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm1(String.valueOf(map.get("LANG_CD")));
//                        dto.setGroupVal1((Long) map.get("CNT"));
//
//                    } else if ("JAS".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm2(String.valueOf(map.get("LANG_CD")));
//                        dto.setGroupVal2((Long) map.get("CNT"));
//
//                    } else if ("PYH".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm3(String.valueOf(map.get("LANG_CD")));
//                        dto.setGroupVal3((Long) map.get("CNT"));
//
//                    } else if ("CPP".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm4(String.valueOf(map.get("LANG_CD")));
//                        dto.setGroupVal4((Long) map.get("CNT"));
//
//                    } else if ("COO".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm5(String.valueOf(map.get("LANG_CD")));
//                        dto.setGroupVal5((Long) map.get("CNT"));
//
//                    } else if ("PHP".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm6(String.valueOf(map.get("LANG_CD")));
//                        dto.setGroupVal6((Long) map.get("CNT"));
//
//                    } else if ("KOT".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm7(String.valueOf(map.get("LANG_CD")));
//                        dto.setGroupVal7((Long) map.get("CNT"));
//
//                    } else if ("TYS".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm8(String.valueOf(map.get("LANG_CD")));
//                        dto.setGroupVal8((Long) map.get("CNT"));
//
//                    } else if ("ETC301".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm9(String.valueOf(map.get("LANG_CD")));
//                        dto.setGroupVal9((Long) map.get("CNT"));
//                    }
//                } else {
//                    if ("JAV".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm1("JAV");
//                        dto.setGroupVal1(0L);
//
//                    } else if ("JAS".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm2("JAS");
//                        dto.setGroupVal2(0L);
//
//                    } else if ("PYH".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm3("PYH");
//                        dto.setGroupVal3(0L);
//
//                    } else if ("CPP".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm4("CPP");
//                        dto.setGroupVal4(0L);
//
//                    } else if ("COO".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm5("COO");
//                        dto.setGroupVal5(0L);
//
//                    } else if ("PHP".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm6("PHP");
//                        dto.setGroupVal6(0L);
//
//                    } else if ("KOT".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm7("KOT");
//                        dto.setGroupVal7(0L);
//
//                    } else if ("TYS".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm8("TYS");
//                        dto.setGroupVal8(0L);
//
//                    } else if ("ETC301".equals(map.get("LANG_CD"))) {
//                        dto.setGroupNm9("ETC301");
//                        dto.setGroupVal9(0L);
//                    }
//                }
//            }
//            // if문 끝
//
//        }
//
//        surveyResult.add(dto);
//        return surveyResult;
//
//
////        Map<String, String> map = new HashMap<String, String>();
////        map.put("test", "success");
////        return map;
//
//    }


    @Override
    public List<SurveyResult.HorizonBarDTO> getConfidentLangForJobItemResult() {
        return surveyMapper.findSurveyConfidentLangForJobItemRes();
    }
}