package com.spring.springbootmybatisproject.survey.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

public class SurveyResult {

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class barGraphDTO {
        private String barName;
        private Long barVal1;
        private Long barVal2;
    }

    @AllArgsConstructor
    @NoArgsConstructor
    @Getter
    @Setter
    public static class pieGraphDTO {
        private String barName;
        private Long barVal;
    }


//    @AllArgsConstructor
//    @NoArgsConstructor
//    @Getter
//    @Setter
//    public static class d3BarGraphDTO{
//        private String majorItem;
//        private Long majorValue;
//    }
}
