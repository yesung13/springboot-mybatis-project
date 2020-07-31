package com.spring.springbootmybatisproject.board.model;
//미사용
public interface BoardProjection {
    int getNo();

    Long getBoardId();

    String getTitle();

    String getWriter();

    Integer getViewCnt();

    Integer getReplyCnt();

    String getBoardDatetime();
}
