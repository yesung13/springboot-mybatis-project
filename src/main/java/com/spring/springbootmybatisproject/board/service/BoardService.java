package com.spring.springbootmybatisproject.board.service;

import com.spring.springbootmybatisproject.board.model.BoardVO;

import java.util.List;

public interface BoardService {

    // 게시글 목록
    List<BoardVO> getBoardList();

    // 게시글 상세보기
    BoardVO getBoardListDetail(Long boardId);

    // 게시글 검색
//    List<BoardVO> getSearchTitle(String keyword);
//
//    List<BoardVO> getSearchContent(String keyword);
//
//    List<BoardVO> getSearchWriter(String keyword);
//    List<BoardVO> getSearchKeyword(String keyword);

    // 게시글 조회수
    void increaseViewCnt(Long boardId);

//    List<Map<String, Object>> getBoardList(List<Integer> params);

}
