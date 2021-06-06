package com.spring.springbootmybatisproject.survey.controller;

import com.spring.springbootmybatisproject.SFV;
import com.spring.springbootmybatisproject.common.model.ResultVO;
import com.spring.springbootmybatisproject.survey.model.SurveyItemVO;
import com.spring.springbootmybatisproject.survey.model.SurveyResult;
import com.spring.springbootmybatisproject.survey.model.SurveyVO;
import com.spring.springbootmybatisproject.survey.service.SurveyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/survey")
public class SurveyController {

    ResultVO result = new ResultVO();

    @Autowired
    private SurveyService surveyService;


    /* 설문조사 참여 여부 페이지 - Main */
    @GetMapping("/main")
    public String surveyMainForm() {
        return "/survey/surveyMain";
    }

    /* 설문조사 참여 여부 체크 */
    @PostMapping("/surveyJoinCk")
    @ResponseBody
    public SurveyVO.ResDTO surveyJoinCheck(@RequestBody SurveyVO surveyVO) {

        Long accountId = surveyVO.getAccountId();
        SurveyVO.ResDTO result = new SurveyVO.ResDTO();
        if (accountId != null) {
            SurveyVO.ResDTO dto = surveyService.getSurveyJoinCk(accountId);
            result.setMessage(dto.getMessage());
            result.setResult(dto.getResult());
        }
        log.info("result {}", result);
        return result;

    }

    @GetMapping("/list")
    public String surveyListForm() {
        return "/survey/surveyList";
    }


    /* 설문 항목 가져오기 */
    @GetMapping("/listProc")
    @ResponseBody
    public List<SurveyItemVO> surveyList() {
        List<SurveyItemVO> surveyList = surveyService.getSurveyList();

        log.info("list size: " + surveyList.size());
        for (SurveyItemVO vo : surveyList) {
            log.info("controller surveyList" + vo);

        }
        return surveyList;
    }

    /* 설문 항목 저장 */
    @PostMapping("/saveListProc")
    @ResponseBody
    public ResultVO saveSurveyList(@RequestBody List<SurveyItemVO.ReqDTO> reqDTOList) {

//
//        if(reqDTOList.isEmpty() || reqDTOList.size() < 12){
//            result.setResMsg("미입력한 항목이 있습니다. \n확인 후 완료해주세요.");
//            result.setResCode(999);
//            return result;
//        }


//        for (SurveyItemVO.ReqDTO dto : reqDTOList) {
//            String name = dto.getName();
//            log.info("name {}", name);
//
//            if (!name.equals("P1O1")) {
//                surveyItemCkRes();
//            }
//            if (!name.equals("P102")) {
//                surveyItemCkRes();
//            }
//            if (!name.equals("P103")) {
//                surveyItemCkRes();
//            }
//            if (!name.equals("P104")) {
//                surveyItemCkRes();
//            }
//            if (!name.equals("P105")) {
//                surveyItemCkRes();
//            }
//            if (!name.equals("P106")) {
//                surveyItemCkRes();
//            }
//            if (!name.equals("P201")) {
//                surveyItemCkRes();
//            }
//            if (!name.equals("P202")) {
//                surveyItemCkRes();
//            }
//            if (!name.equals("P203")) {
//                surveyItemCkRes();
//            }
//            if (!name.equals("P301")) {
//                surveyItemCkRes();
//            }
//            if (!name.equals("P302")) {
//                surveyItemCkRes();
//            }


//        }


        try {
            surveyService.saveSurveyList(reqDTOList);
            result.setResCode(SFV.INT_RES_CODE_OK);
            result.setResMsg(SFV.STRING_RES_CODE_OK);

        } catch (Exception e) {
            result.setResCode(SFV.INT_RES_CODE_FAIL);
            result.setResMsg(SFV.STRING_RES_CODE_FAIL);
        }

        return result;
    }

    /* 설문 결과 페이지 */
    @GetMapping("/surveyResults")
    public String surveyResultForm() {
        return "/survey/surveyResult";
    }

    /* 예비/경력 개발자 전공 여부 조사 결과 - 막대 그래프 */
    @GetMapping("/surveyBarGraphProc/{d3ChartDiv}")
    @ResponseBody
    public List<SurveyResult.BarGraphDTO> surveyResultsBarGraph(@PathVariable String d3ChartDiv) {
        List<SurveyResult.BarGraphDTO> surveyResult = null;
        if (d3ChartDiv.equals("barGraph")) {
            surveyResult = surveyService.getMajorItemResult();
        }
        return surveyResult;
    }

    /* 비전공자 개발 공부 학습 방법 조사 결과 - 파이그래프 */
    @GetMapping("/surveyPieGraphProc/{d3ChartDiv}")
    @ResponseBody
    public List<SurveyResult.PieGraphDTO> surveyResultsPieGraph(@PathVariable String d3ChartDiv) {
        List<SurveyResult.PieGraphDTO> surveyResult = null;
        if (d3ChartDiv.equals("pieGraph")) {
            surveyResult = surveyService.getNonMajorStudyItemResult();
        }
        return surveyResult;
    }

    /* 직무별 자신있는 프로그래밍 언어 조사 결과 - 가로 막대 그래프 */
    @GetMapping("/surveyHorizonBarChart/{d3ChartDiv}")
    @ResponseBody
    public List<SurveyResult.HorizonBarDTO> surveyResultsHorizonBarChart(@PathVariable String d3ChartDiv) {
        List<SurveyResult.HorizonBarDTO> surveyResult = new ArrayList<>();
        if (d3ChartDiv.equals("horizonBarChart")) {
            surveyResult = surveyService.getConfidentLangForJobItemResult();
        }
        return surveyResult;
    }

}
