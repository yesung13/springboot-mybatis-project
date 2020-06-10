package com.spring.springbootmybatisproject.board.service;

import com.spring.springbootmybatisproject.board.model.BoardVO;
import com.spring.springbootmybatisproject.board.repository.BoardMapper;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;

    public BoardServiceImpl(BoardMapper boardMapper) {
        this.boardMapper = boardMapper;
    }

//    @Override
//    public List<Map<String, Object>> getBoardList(List<Integer> params) {
//        return boardMapper.getBoardList(params);
//    }

    // 게시글 총 갯수
    @Override
    public int getBoardListTotalCnt(BoardVO boardVO) {
        return boardMapper.boardListTotalCnt(boardVO);
    }

    // 게시글 목록
    @Override
    public List<BoardVO> getBoardList(BoardVO boardVO) {
        return boardMapper.findAll(boardVO);
    }

    // 게시글 상세 보기
    @Override
    public BoardVO getBoardListDetail(Long boardId) {
        return boardMapper.findByBoardId(boardId);
    }

    // 게시글 작성
    @Override
    public void setBoardWrite(BoardVO boardVO) {
        BoardVO vo = BoardVO.builder()
                .title(boardVO.getTitle())
                .content(boardVO.getContent())
//                .boardDatetime()
//                .boardUpDatetime(new Date())
                .build();
        boardMapper.saveBoardWrite(vo);
    }

    // 게시글 검색
//    @Override
//    public List<BoardVO> getSearchKeyword(String keyword) {
//        return boardMapper.findBySearchKeyword(keyword);
//    }
//
//    @Override
//    public List<BoardVO> getSearchContent(String keyword) {
//        return boardMapper.findBySearchKeyword(keyword);
//    }
//
//    @Override
//    public List<BoardVO> getSearchWriter(String keyword) {
//        return boardMapper.findBySearchKeyword(keyword);
//    }

    // 게시글 조회수
    @Override
    public void increaseViewCnt(Long boardId) {
        boardMapper.increaseViewCnt(boardId);
    }
}
