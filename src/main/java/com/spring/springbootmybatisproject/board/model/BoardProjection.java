package com.spring.springbootmybatisproject.board.model;

public interface BoardProjection {
    int getNo();

    Long getBoardId();

    String getTitle();

    String getWriter();

    Integer getViewCnt();

    Integer getReplyCnt();

    String getBoardDatetime();
}
