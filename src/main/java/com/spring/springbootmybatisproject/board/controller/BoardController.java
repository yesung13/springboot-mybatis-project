package com.spring.springbootmybatisproject.board.controller;

import com.spring.springbootmybatisproject.board.model.BoardVO;
import com.spring.springbootmybatisproject.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    // 게시글 목록
    @GetMapping("/list")
    public ModelAndView boardList() {
        ModelAndView mv = new ModelAndView();
        List<BoardVO> boardVOList = boardService.getBoardList();
        mv.addObject("boardList", boardVOList); // jstl로 호출
        mv.setViewName("board/boardList"); // 실제 호출될 jsp 페이지
        return mv;
    }

    // 게시글 상세보기
    @GetMapping("/detail")
    public String boardDetail(@RequestParam(value = "id") Long boardId, Model model) {
        BoardVO boardVO = boardService.getBoardListDetail(boardId);
        model.addAttribute("boardListDetail", boardVO);
        return "board/boardDetail";
    }

    // 게시글 검색
    @GetMapping("/search")
    public List<BoardVO> boardSearch(@RequestParam(value = "type") String type,
                                      @RequestParam(value = "keyword") String keyword) {
        switch (type) {
            case "title":
                if (!keyword.equals("")) {
                    return boardService.getSearchTitle(keyword);
                }
            case "content":
                if (!keyword.equals("")) {
                    return boardService.getSearchContent(keyword);
                }
            case "writer":
                if (!keyword.equals("")) {
                    return boardService.getSearchWriter(keyword);
                }
            default:
                return null;
        }
    }

    // 게시글 조회수
    @PutMapping("/viewCnt")
    public void boardViewCnt(@RequestParam(value = "boardId") Long boardId){
        boardService.increaseViewCnt(boardId);
    }
}
