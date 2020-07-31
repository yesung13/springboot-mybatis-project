package com.spring.springbootmybatisproject.board.repository;

import com.spring.springbootmybatisproject.board.model.BoardVO;
import com.spring.springbootmybatisproject.board.model.FileVO;
import com.spring.springbootmybatisproject.board.model.SearchVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
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

    // 게시글 수정
    void updateById(BoardVO boardVO);

    // 게시글 삭제
    void deleteById(Long boardId);

    // 검색 게시글 총 갯수
    int searchBoardListTotalCnt(SearchVO searchVO);

    // 게시글 검색
    List<BoardVO> findBySearchKeyword(SearchVO searchVO);

    // 게시글 조회수
    void increaseViewCnt(Long boardId);

    // 게시글 파일 업로드
    void insertBoardFile(FileVO fileVO);

    // 게시글 파일 첨부 목록
    List<FileVO> findAllFileList(Long boardId);

    // 해당 첨부 파일 찾기
    String findByFilename(Long fileId);

    // 해당 첨부 파일 삭제
    void deleteByFile(Long fileId);

}
