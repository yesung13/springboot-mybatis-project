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

}
