package com.spring.springbootmybatisproject.survey.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


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
    public static class HorizontalBarDTO {
        //groupChartData
        private String groupNm1;
        private String groupNm2;
        private String groupNm3;
        private String groupNm4;
        private String groupNm5;
        private String groupNm6;
        private String groupNm7;
        private String groupNm8;
        private String groupNm9;

        private Integer groupVal1;
        private Integer groupVal2;
        private Integer groupVal3;
        private Integer groupVal4;
        private Integer groupVal5;
        private Integer groupVal6;
        private Integer groupVal7;
        private Integer groupVal8;
        private Integer groupVal9;

        private String yName1;
        private String yName2;
        private String yName3;
        private String yName4;
        private String yName5;
        private String yName6;
        private String yName7;
        private String yName8;
        private String yName9;

        //columnsInfo
        private String group1;
        private String group2;
        private String group3;
        private String group4;
        private String group5;
        private String group6;
        private String group7;
        private String group8;
        private String group9;
    }

}
