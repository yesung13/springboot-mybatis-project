package com.spring.springbootmybatisproject.board.service;

import com.spring.springbootmybatisproject.board.model.BoardAttachVO;
import com.spring.springbootmybatisproject.board.model.BoardVO;
import com.spring.springbootmybatisproject.board.model.FileVO;
import com.spring.springbootmybatisproject.board.model.SearchVO;
import com.spring.springbootmybatisproject.board.repository.BoardAttachMapper;
import com.spring.springbootmybatisproject.board.repository.BoardMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {

    private final BoardMapper boardMapper;
    private final BoardAttachMapper attachMapper;

    public BoardServiceImpl(BoardMapper boardMapper, BoardAttachMapper attachMapper) {
        this.boardMapper = boardMapper;
        this.attachMapper = attachMapper;
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
    public Long setBoardWrite(BoardVO boardVO) throws Exception {
        String content = boardVO.getContent().replaceAll("\r\n", "<br />");
        BoardVO vo = BoardVO.builder()
                .accountId(boardVO.getAccountId())
                .title(boardVO.getTitle())
                .content(content)
                .writer(boardVO.getWriter())
                .build();
        boardMapper.saveBoardWrite(vo);
        return vo.getBoardId();
    }

    // 게시글 파일 업로드
    @Override
    public void addBoardFile(FileVO fileVO) throws Exception {

        String originFileName = fileVO.getOriginFilename();
        if (originFileName != null) {
            Long boardId = fileVO.getBoardId();
            fileVO.setBoardId(boardId);
            boardMapper.insertBoardFile(fileVO);
        }
    }

    // 게시글 수정
    @Override
    public Long setBoardModify(BoardVO boardVO) {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateResult = format.format(date);

        String content = boardVO.getContent().replaceAll("\r\n", "<br />");
        BoardVO vo = BoardVO.builder()
                .boardId(boardVO.getBoardId())
                .title(boardVO.getTitle())
                .content(content)
                .boardUpDatetime(dateResult)
                .build();
        boardMapper.updateById(vo);
        return vo.getBoardId();
    }

    // 게시글 삭제
    @Override
    public void getBoardDelete(Long boardId) {
        boardMapper.deleteById(boardId);

    }

    // 검색 게시글 총 갯수
    @Override
    public int getSearchBoardListTotalCnt(SearchVO searchVO) {
        return boardMapper.searchBoardListTotalCnt(searchVO);
    }

    // 게시글 검색
    @Override
    public List<BoardVO> getBoardSearch(SearchVO searchVO) {
        return boardMapper.findBySearchKeyword(searchVO);
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

    //추가
    @Transactional
    @Override
    public void register(BoardVO boardVO) {

        log.info("register....." + boardVO);

        boardMapper.saveBoardWrite(boardVO);

        if (boardVO.getAttachList() == null || boardVO.getAttachList().size() <= 0) {
            return;
        }

        boardVO.getAttachList().forEach(attachVO -> {
            attachVO.setBoardId(boardVO.getBoardId());
            attachMapper.insert(attachVO);
        });

    }

    @Override
    public List<BoardAttachVO> getAttachList(Long boardId) {

        log.info("get Attach list by boardId"+boardId);

        return attachMapper.findByBoardId(boardId);
    }
}


