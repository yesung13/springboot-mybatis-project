package com.spring.springbootmybatisproject.board.repository;

import com.spring.springbootmybatisproject.board.model.BoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface BoardMapper {
//    List<Map<String, Object>> getBoardList(List<Integer> params);

    // 게시글 목록
    List<BoardVO> findAll();

    // 게시글 상세보기
    BoardVO findByBoardId(Long boardId);

    // 게시글 검색
//    List<BoardVO> findBySearchKeyword(String keyword);

    // 게시글 조회수
    void increaseViewCnt(Long boardId);
}
