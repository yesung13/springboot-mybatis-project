package com.spring.springbootmybatisproject.board.service;

import com.spring.springbootmybatisproject.board.model.BoardVO;
import com.spring.springbootmybatisproject.board.model.FileVO;
import com.spring.springbootmybatisproject.board.repository.BoardMapper;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
    public void setBoardWrite(BoardVO boardVO, FileVO fileVO) {
        String content = boardVO.getContent().replaceAll("\r\n","<br />");
        content = content.replaceAll("<","&lt;");
        content = content.replaceAll(">","&gt");
        content = content.replaceAll("&","&amp");
        content = content.replaceAll("\"","&quot");

        BoardVO vo = BoardVO.builder()
                .title(boardVO.getTitle())
                .content(content)
                .build();
        boardMapper.saveBoardWrite(vo);

        // 게시글 파일 업로드
        Long boardId = vo.getBoardId(); // saveBoardWrite의 auto값을 리턴 받아 사용.
        fileVO.setBoardId(boardId);
        boardMapper.insertBoardFile(fileVO);
    }

    // 게시글 수정
    @Override
    public void setBoardModify(BoardVO boardVO, FileVO fileVO) {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateResult = format.format(date);

        String content = boardVO.getContent().replaceAll("\r\n","<br />");
        content = content.replaceAll("<","&lt;");
        content = content.replaceAll(">","&gt");
        content = content.replaceAll("&","&amp");
        content = content.replaceAll("\"","&quot");

        BoardVO vo = BoardVO.builder()
                .boardId(boardVO.getBoardId())
                .title(boardVO.getTitle())
                .content(content)
                .boardUpDatetime(dateResult)
                .build();
        boardMapper.updateById(vo);

        // 게시글 새 파일 업로드
        fileVO.setBoardId(vo.getBoardId());
        boardMapper.insertBoardFile(fileVO);

    }

    // 게시글 삭제
    @Override
    public void getBoardDelete(Long boardId) {
        boardMapper.deleteById(boardId);

    }

    // 게시글 검색
    @Override
    public List<BoardVO> getBoardSearch(String keyword) {
        return boardMapper.findBySearchKeyword(keyword);
    }

    // 게시글 검색 페이징
    @Override
    public int getBoardSearchListCnt(BoardVO boardVO) {
        return boardMapper.boardSearchListCnt(boardVO);
    }

    // 게시글 조회수
    @Override
    public void increaseViewCnt(Long boardId) {
        boardMapper.increaseViewCnt(boardId);
    }

    // 게시글 파일 첨부 목록
    @Override
    public List<FileVO> getFileList(Long boardId) {
        return boardMapper.findAllFileList(boardId);
    }

    // 해당 첨부 파일 찾기
    @Override
    public String getFilename(Long fileId) {
        return boardMapper.findByFilename(fileId);
    }

    // 해당 첨부 파일 삭제
    @Override
    public void deleteBoardFile(Long fileId) {
        boardMapper.deleteByFile(fileId);
    }
}


