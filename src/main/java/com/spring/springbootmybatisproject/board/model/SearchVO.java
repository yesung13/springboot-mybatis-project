package com.spring.springbootmybatisproject.board.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class SearchVO {
    private String type;
    private String keyword;

    // 페이징
    private int startIndex;
    private int cntPerPage;
}
