package com.spring.springbootmybatisproject.board.repository;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
//@Component
public interface BoardMapper {

    List<Map<String, Object>> getBoardList(List<Integer> params);

}
