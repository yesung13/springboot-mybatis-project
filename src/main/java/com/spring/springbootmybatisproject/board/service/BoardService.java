package com.spring.springbootmybatisproject.board.service;

import com.spring.springbootmybatisproject.board.model.BoardVO;

import java.util.List;

public interface BoardService {

    // 게시글 총 갯수
    int getBoardListTotalCnt(BoardVO boardVO);

    // 게시글 목록
    List<BoardVO> getBoardList(BoardVO boardVO);

    // 게시글 상세 보기
    BoardVO getBoardListDetail(Long boardId);

    // 게시글 작성
    void setBoardWrite(BoardVO boardVO);

    // 게시글 수정
    void getBoardUpdate(BoardVO boardVO);

    // 게시글 삭제
    void getBoardDelete(Long boardId);


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
