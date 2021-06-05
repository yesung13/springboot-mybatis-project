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
    
    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class HorizonBarDTO2 {
        //groupChartData
        private String group1;
        private String group2;
        private String group3;
        private String group4;
        private String group5;
        private String group6;
        private String group7;
        private String group8;
        private String group9;

        private String groupNm1;
        private String groupNm2;
        private String groupNm3;
        private String groupNm4;
        private String groupNm5;
        private String groupNm6;
        private String groupNm7;
        private String groupNm8;
        private String groupNm9;

        private Long groupVal1;
        private Long groupVal2;
        private Long groupVal3;
        private Long groupVal4;
        private Long groupVal5;
        private Long groupVal6;
        private Long groupVal7;
        private Long groupVal8;
        private Long groupVal9;



        //columnsInfo
//        private String yName1;
//        private String yName2;
//        private String yName3;
//        private String yName4;
//        private String yName5;
//        private String yName6;
//        private String yName7;
//        private String yName8;
//        private String yName9;

    }

}
