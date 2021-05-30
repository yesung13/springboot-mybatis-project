package com.spring.springbootmybatisproject.survey.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Alias("SurveyItemVO")
// 설문 항목코드
public class SurveyItemVO {

    // 항목번호 항목번호
    private Long itemId;

    // 그룹코드 항목 그룹코드
    private String groupCd;

    // 항목코드 항목 코드
    private String itemCd;

    // 항목명 노출될 항목명
    private String itemNm;

    // 항목설명 항목 설명
    private String itemComm;

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class ReqDTO {
        private Long accountId = 1L;
        private String name;
        private String value;
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    public static class ResDTO {
        private String groupCd;
        private String itemCd;
        private String itemNm;

    }


}
