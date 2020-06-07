package com.spring.springbootmybatisproject.board.controller;

import com.spring.springbootmybatisproject.board.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
public class BoardController {
    private final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }


    @GetMapping("")
    public String home(Model model) {
        Date date = new Date();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateResult = format.format(date);
        model.addAttribute("date", dateResult);

        List<Integer> params = new ArrayList<Integer>();
        params.add(28);
        params.add(29);
        params.add(30);
        List<Map<String, Object>> list = boardService.getBoardList(params);

        return "index";
    }
}
