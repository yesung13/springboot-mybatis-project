package com.spring.springbootmybatisproject.survey.model;


import lombok.*;


public class SurveyResult {
    private SurveyResult() {
        throw new IllegalStateException("SurveyResult class");
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class BarGraphDTO {
        private String barName;
        private Long barVal1;
        private Long barVal2;
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class PieGraphDTO {
        private String pieName;
        private Long pieVal;
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class HorizonBarDTO{

        private String itemCd;

//        private String data1;
        private Integer dataCnt1;

//        private String data2;
        private Integer dataCnt2;

//        private String data3;
        private Integer dataCnt3;

//        private String data4;
        private Integer dataCnt4;

//        private String data5;
        private Integer dataCnt5;

//        private String data6;
        private Integer dataCnt6;

//        private String data7;
        private Integer dataCnt7;

//        private String data8;
        private Integer dataCnt8;

//        private String data9;
        private Integer dataCnt9;

    }


}
