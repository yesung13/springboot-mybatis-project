package com.spring.springbootmybatisproject.survey.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
@Setter

// 설문 항목 그룹
public class SurveyItemVO {

    //그룹 ID
    private Long groupId;

    // 항목코드
    private String itemCd;

    // 항목이름
    private String itemNm;

    // 항목설명
    private String itemComm;

    // SurveyItemCd 모델 복사
    public void CopyData(SurveyItemVO param) {
        this.groupId = param.getGroupId();
        this.itemCd = param.getItemCd();
        this.itemNm = param.getItemNm();
        this.itemComm = param.getItemComm();
    }
}
