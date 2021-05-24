package com.spring.springbootmybatisproject.survey.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

/**
 * Created by berno579@gmail.com on 2021/05/24
 * Github : http://github.com/bee0113
 */

@AllArgsConstructor
@Getter
@Setter

// 설문결과 공통코드
public class SurveyItemCD {

//    // 그룹코드 - P001 ~ PO11
//    private Long groupId;
//
//    // 항목코드
//    private String itemCd;
//
//    // 항목이름
//    private String itemNm;
//
//    // 항목설명
//    private String itemComm;
//
//    // SurveyItemCd 모델 복사
//    public void CopyData(SurveyItemCD param) {
//        this.groupId = param.getGroupId();
//        this.itemCd = param.getItemCd();
//        this.itemNm = param.getItemNm();
//        this.itemComm = param.getItemComm();
//    }
    // 그룹코드
    public static final String G_P001 = "POO1";
    public static final String G_P002 = "POO2";
    public static final String G_P003 = "POO3";
    public static final String G_P004 = "POO4";
    public static final String G_P005 = "POO5";
    public static final String G_P006 = "POO6";
    public static final String G_P007 = "POO7";
    public static final String G_P008 = "POO8";
    public static final String G_P009 = "POO9";
    public static final String G_P010 = "PO10";
    public static final String G_P011 = "PO11";

    // 항목코드
    public static final String IC_MAJ = "MAJ";
    public static final String IC_NMAJ = "NMAJ";
    public static final String IC_ACA = "ACA";
    public static final String IC_STU = "STU";
    public static final String IC_ONL = "ONL";

}
