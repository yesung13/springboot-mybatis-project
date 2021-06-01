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
@Alias("SurveyResult")
public class SurveyResult {
    private String majorItem;
    private Long majorValue;

//    @AllArgsConstructor
//    @NoArgsConstructor
//    @Getter
//    @Setter
//    public static class d3BarGraphDTO{
//        private String majorItem;
//        private Long majorValue;
//    }
}
