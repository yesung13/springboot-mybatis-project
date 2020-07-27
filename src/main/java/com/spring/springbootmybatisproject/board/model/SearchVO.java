package com.spring.springbootmybatisproject.board.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@NoArgsConstructor
@Alias("SearchVO")
public class SearchVO extends BoardVO {
    private String type;
    private String keyword;
}
