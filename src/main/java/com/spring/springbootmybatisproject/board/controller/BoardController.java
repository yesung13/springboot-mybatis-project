package com.spring.springbootmybatisproject.board.controller;

import com.spring.springbootmybatisproject.SFV;
import com.spring.springbootmybatisproject.board.model.BoardVO;
import com.spring.springbootmybatisproject.board.model.FileVO;
import com.spring.springbootmybatisproject.board.model.Pagination;
import com.spring.springbootmybatisproject.board.model.ReplyVO;
import com.spring.springbootmybatisproject.board.service.BoardService;
import com.spring.springbootmybatisproject.board.service.ReplyService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;
    private final ReplyService replyService;

    public BoardController(BoardService boardService, ReplyService replyService) {
        this.boardService = boardService;
        this.replyService = replyService;
    }

    // 게시글 목록
    @GetMapping("/list")
    public ModelAndView boardList(Model model, @RequestParam(defaultValue = "1") int curPage, BoardVO boardVO) {
        // 전체 리스트 개수
        int listCnt = boardService.getBoardListTotalCnt(boardVO);
        Pagination pagination = new Pagination(listCnt, curPage);
        boardVO.setStartIndex(pagination.getStartIndex());
        boardVO.setCntPerPage(pagination.getPageSize());
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("pagination", pagination);

        // 전체 리스트 출력
        ModelAndView mv = new ModelAndView();
        List<BoardVO> boardVORes = boardService.getBoardList(boardVO);
        mv.addObject("boardList", boardVORes); // jstl로 호출
        mv.setViewName("board/boardList"); // 실제 호출될 jsp 페이지
        return mv;
    }

    // 게시글 상세 보기
    @GetMapping("/detail")
    public String boardDetail(@RequestParam(value = "id") Long boardId, Model model) {
        BoardVO boardVORes = boardService.getBoardListDetail(boardId);
        model.addAttribute("boardListDetail", boardVORes);

        // 해당 댓글 목록
        List<ReplyVO> replyVORes = replyService.getReplyList(boardId);
        model.addAttribute("replyList", replyVORes);

        // 해당 파일 목록
        List<FileVO> fileVORes = boardService.getUploadFile(boardId);
        model.addAttribute("fileList",fileVORes);

        return "board/boardDetail";
    }

    // 게시글 작성 page
    @GetMapping("/write")
    public String boardWrite() {
        return "board/boardWrite";
    }

    // 게시글 작성
//    @PostMapping("/setWrite")
//    @ResponseBody
//    public int boardWrite(@RequestBody BoardVO boardVO) {
//        String title = boardVO.getTitle();
//        String content = boardVO.getContent();
//        if (title != null && content != null) {
//            boardService.setBoardWrite(boardVO);
//            return SFV.INT_RES_CODE_OK;
//        }
//        return SFV.INT_RES_CODE_FAIL;
//    }

    @PostMapping("/setWrite")
    public String boardWrite(BoardVO boardVO, MultipartHttpServletRequest multipartReq) {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyyMMdd");
        String dateResult = format.format(date);

        String title = boardVO.getTitle();
        String content = boardVO.getContent();
        if (title != null && content != null) {
            boardService.setBoardWrite(boardVO);
        }

        // 첨부파일 업로드
        Long boardId = boardVO.getBoardId();
        FileVO fileVO = new FileVO();
        String uploadPath = "C:\\Users\\blucean\\IdeaProjects\\springboot-mybatis-project\\src\\main\\webapp\\uploadFiles\\";
        List<MultipartFile> fileList = multipartReq.getFiles("file");

        for (MultipartFile mf : fileList) {
            if (!mf.isEmpty()) {

                String originFilename = mf.getOriginalFilename(); // 원본 파일명
                String saveFilename = dateResult + "_" + originFilename; // 저장될 파일명
                long fileSize = mf.getSize(); // 파일 사이즈
                log.info("originFilename=={}", originFilename);
                log.info("fileSize=={}", fileSize);
                fileVO.setBoardId(boardId);
                fileVO.setOriginFilename(originFilename);
                fileVO.setSaveFilename(saveFilename);
                fileVO.setFileSize(fileSize);
                boardService.insertBoardFile(fileVO);

                String safeFile = uploadPath + dateResult + "_" + originFilename; // 디스크에 파일 저장
                try {
                    mf.transferTo(new File(safeFile)); // 디스크에 파일 저장
                } catch (IOException | IllegalStateException e) {
                    e.printStackTrace();
                    System.out.println("[message]:" + SFV.STRING_CHECK_CODE_INSERT_FILE_ERROR
                            + " [code]: " + SFV.INT_CHECK_CODE_INSERT_FILE_ERROR);
                }
            }
        }

        return "redirect:/board/list";
    }

    // 게시글 수정 page
    @GetMapping("/update")
    public String boardUpdate(@RequestParam(value = "id") Long boardId, Model model) {
        BoardVO boardVO = boardService.getBoardListDetail(boardId);
        model.addAttribute("boardListDetail", boardVO);
        return "board/boardUpdate";
    }

    // 게시글 수정
    @PostMapping("/setUpdate")
    @ResponseBody
    public int boardUpdate(@RequestBody BoardVO boardVO) {
        Long boardId = boardVO.getBoardId();
        String title = boardVO.getTitle();
        String content = boardVO.getContent();
        if (boardId != null || title != null || content != null) {
            boardService.getBoardUpdate(boardVO);
            return SFV.INT_RES_CODE_SUCCESS;
        }
        return SFV.INT_RES_CODE_FAIL;
    }

    // 게시글 삭제
    @PostMapping("/delete")
    @ResponseBody
    public int boardDelete(@RequestBody BoardVO boardVO) {
        Long boardId = boardVO.getBoardId();
        if (boardId != null) {
            boardService.getBoardDelete(boardId);
            return SFV.INT_RES_CODE_SUCCESS;
        }
        return SFV.INT_RES_CODE_FAIL;
    }

    // 게시글 검색
    @GetMapping("/search")
    public ModelAndView boardSearch(@RequestParam(value = "type") String type,
                                    @RequestParam(value = "keyword") String keyword,
                                    @RequestParam(defaultValue = "1") int curPage,
                                    Model model, BoardVO boardVO) {

        // 전체 리스트 개수
        int listCnt = boardService.getBoardSearchListCnt(boardVO);
        Pagination pagination = new Pagination(listCnt, curPage);
        boardVO.setStartIndex(pagination.getStartIndex());
        boardVO.setCntPerPage(pagination.getPageSize());
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("pagination", pagination);

        List<BoardVO> boardVOList = new ArrayList<>();
        if (type.equals("title") && keyword != null) {
            boardVOList = boardService.getBoardSearch(keyword);
        } else if (type.equals("content") && keyword != null) {
            boardVOList = boardService.getBoardSearch(keyword);
        } else if (type.equals("writer") && keyword != null) {
            boardVOList = boardService.getBoardSearch(keyword);
        }

        ModelAndView mv = new ModelAndView();
        mv.addObject("boardList", boardVOList); // jstl로 호출
        mv.setViewName("board/boardList"); // 실제 호출될 jsp 페이지
        return mv;
    }

    // 게시글 조회수
    @PutMapping("/viewCnt")
    public void boardViewCnt(@RequestParam(value = "boardId") Long boardId) {
        boardService.increaseViewCnt(boardId);
    }

}

