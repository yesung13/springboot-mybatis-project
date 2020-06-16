package com.spring.springbootmybatisproject.board.controller;

import com.spring.springbootmybatisproject.board.model.BoardVO;
import com.spring.springbootmybatisproject.board.model.Pagination;
import com.spring.springbootmybatisproject.board.service.BoardService;
import com.spring.springbootmybatisproject.SFV;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
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
        List<BoardVO> boardVOList = boardService.getBoardList(boardVO);
        mv.addObject("boardList", boardVOList); // jstl로 호출
        mv.setViewName("board/boardList"); // 실제 호출될 jsp 페이지
        return mv;
    }

    // 게시글 상세 보기
    @GetMapping("/detail")
    public String boardDetail(@RequestParam(value = "id") Long boardId, Model model) {
        BoardVO boardVO = boardService.getBoardListDetail(boardId);
        model.addAttribute("boardListDetail", boardVO);
        return "board/boardDetail";
    }

    // 게시글 작성 page
    @GetMapping("/write")
    public String boardWrite() {
        return "board/boardWrite";
    }

    // 게시글 작성
    @PostMapping("/setWrite")
    @ResponseBody
    public int boardWrite(@RequestBody BoardVO boardVO) {
        String title = boardVO.getTitle();
        String content = boardVO.getContent();
        if (title != null && content != null) {
            boardService.setBoardWrite(boardVO);
            return SFV.INT_RES_CODE_OK;
        }
        return SFV.INT_RES_CODE_FAIL;
    }

    // 게시글 삭제
    @PostMapping("/delete")
    public int boardDelete(@RequestParam(value = "boardId") Long boardId) {
        log.info("boardId : {}", boardId);
        if (boardId != null) {
            boardService.getBoardDelete(boardId);
            return SFV.INT_RES_CODE_SUCCESS;
        }
        return SFV.INT_RES_CODE_FAIL;
    }

    // 게시글 검색
//    @GetMapping("/search")
//    public String boardSearch(@RequestParam(value = "type") String type,
//                                     @RequestParam(value = "keyword") String keyword,
//                                     Model model) {
//        List<BoardVO> boardVOList = new ArrayList<>();
//        switch (type) {
//            case "title":
//            case "content":
//            case "writer":
//                if (!keyword.equals("")) {
//                    boardVOList =  boardService.getSearchKeyword(keyword);
//                }
//                break;
//        }
//        model.addAttribute("boardKeywordList", boardVOList);
//        return "board/boardList";
//    }

    // 게시글 조회수
    @PutMapping("/viewCnt")
    public void boardViewCnt(@RequestParam(value = "boardId") Long boardId) {
        boardService.increaseViewCnt(boardId);
    }
}
