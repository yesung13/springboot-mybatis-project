package com.spring.springbootmybatisproject.board.repository;

import com.spring.springbootmybatisproject.board.model.BoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface BoardMapper {
//    List<Map<String, Object>> getBoardList(List<Integer> params);

    // 게시글 총 갯수
    int boardListTotalCnt(BoardVO boardVO);

    // 게시글 목록
    List<BoardVO> findAll(BoardVO boardVO);

    // 게시글 상세 보기
    BoardVO findByBoardId(Long boardId);

    // 게시글 작성
    void saveBoardWrite(BoardVO boardVO);

    // 게시글 삭제
    void deleteById(Long boardId);

    // 게시글 검색
//    List<BoardVO> findBySearchKeyword(String keyword);

    // 게시글 조회수
    void increaseViewCnt(Long boardId);

}
