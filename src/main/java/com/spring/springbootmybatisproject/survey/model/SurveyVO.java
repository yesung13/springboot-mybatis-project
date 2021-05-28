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
@ToString
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

        // 자신있는 언어
        private String confidentLangItem;

        // 배우고 싶은 언어
        private String learnLangItem;

        // 자신있는 프레임워크 / 라이브러리
        private String confidentFrmItem;

        // 배우고 싶은 프레임워크 / 라이브러리
        private String learnFrmItem;

        // 계정ID. FK
        private Long accountId;

        // 설문 등록날짜
        private Date regDatetime;


    // Survey 모델 복사
        public void CopyData(SurveyVO param)
        {
            this.surveyId = param.getSurveyId();
            this.majorItem = param.getMajorItem();
            this.nonMajorStudyItem = param.getNonMajorStudyItem();
            this.ageItem = param.getAgeItem();
            this.careerItem = param.getCareerItem();
            this.incomeItem = param.getIncomeItem();
            this.jobItem = param.getJobItem();
            this.useOSItem = param.getUseOSItem();
            this.useDBItem = param.getUseDBItem();
            this.useEditorItem = param.getUseEditorItem();
            this.confidentLangItem = param.getConfidentLangItem();
            this.learnLangItem = param.getLearnLangItem();
            this.confidentFrmItem = param.getConfidentFrmItem();
            this.learnFrmItem = param.getLearnFrmItem();
            this.accountId = param.getAccountId();
            this.regDatetime = param.getRegDatetime();
        }

}
