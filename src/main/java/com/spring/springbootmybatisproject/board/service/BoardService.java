package com.spring.springbootmybatisproject.board.service;

import com.spring.springbootmybatisproject.board.model.BoardAttachVO;
import com.spring.springbootmybatisproject.board.model.BoardVO;
import com.spring.springbootmybatisproject.board.model.FileVO;
import com.spring.springbootmybatisproject.board.model.SearchVO;

import java.util.List;

public interface BoardService {

    // 게시글 총 갯수
    int getBoardListTotalCnt(BoardVO boardVO);

    // 게시글 목록
    List<BoardVO> getBoardList(BoardVO boardVO);

    // 공지 게시글 목록
    List<BoardVO> getBoardTypeNoticeList(BoardVO boardVO);

    // 게시글 상세 보기
    BoardVO getBoardListDetail(Long boardId);

    // 게시글 작성
    Long setBoardWrite(BoardVO boardVO) throws Exception;

    // 게시글 수정
    Long setBoardModify(BoardVO boardVO) throws Exception;

    // 파일 업로드
    void addBoardFile(FileVO fileVO) throws Exception;

    // 게시글 삭제
    void getBoardDelete(Long boardId);

    // 검색 게시글 총 갯수
    int getSearchBoardListTotalCnt(SearchVO searchVO);

    // 게시글 검색
    List<BoardVO> getBoardSearch(SearchVO searchVO);

    // 게시글 조회수
    void increaseViewCnt(Long boardId);

    // 게시글 파일 첨부 목록
    List<FileVO> getFileList(Long boardId);

    // 해당 첨부 파일 찾기
    String getFilename(Long fileId);

    // 해당 첨부 파일 삭제
    void deleteBoardFile(Long fileId);


//    List<Map<String, Object>> getBoardList(List<Integer> params);

    //추가
    public void register(BoardVO boardVO);

    public List<BoardAttachVO> getAttachList(Long boardId);

    public boolean remove(Long boardId);

    public boolean modify(BoardVO boardVO);


    List<BoardAttachVO> getBoardAttachList(BoardVO boardVO);
}
