package com.spring.springbootmybatisproject.survey.model;

import lombok.*;
import org.apache.ibatis.type.Alias;

import java.util.Date;

/**
 * Created by berno579@gmail.com on 2021/05/24
 * Github : http://github.com/bee0113
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Alias("SurveyVO")
// 설문
public class SurveyVO {

    // 설문ID
    private Long surveyId;

    // 전공/비전공 항목
    private String majorItem;

    // 비전공자 학습방법
    private String nonMajorStudyItem;

    // 연령대
    private String ageItem;

    // 경력
    private String careerItem;

    // 연소득범위
    private String incomeItem;

    // 현재 직무
    private String jobItem;

    // 주로 사용하는 OS
    private String useOSItem;

    // 주로 사용하는 DB
    private String useDBItem;

    // 주로 사용하는 Editor
    private String useEditorItem;

    // 자신있는 언어(1개 선택일 경우)
    private String confidentLangItem;

    // 자신있는 언어(2개 선택일 경우)
    private String confidentLangItem2;

    // 배우고 싶은 언어(1개 선택일 경우)
    private String learnLangItem;

    // 배우고 싶은 언어(2개 선택일 경우)
    private String learnLangItem2;

    // 계정ID. FK
    private Long accountId;

    // 설문 등록날짜
    private Date regDatetime;


    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class ResDTO{
        private String result;
        private String message;
    }

}
