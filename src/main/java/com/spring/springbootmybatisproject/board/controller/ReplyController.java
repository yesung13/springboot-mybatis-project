package com.spring.springbootmybatisproject.board.controller;

import com.spring.springbootmybatisproject.SFV;
import com.spring.springbootmybatisproject.board.model.ReplyVO;
import com.spring.springbootmybatisproject.board.service.ReplyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/board")
public class ReplyController {
    private final ReplyService replyService;

    public ReplyController(ReplyService replyService) {
        this.replyService = replyService;
    }

    // 댓글 쓰기
    @PostMapping("/replyWrite")
    public String replyWrite(@Valid ReplyVO replyVO, BindingResult result){
        Long id = replyVO.getBoardId();
        if (!result.hasFieldErrors("replyContent") && !result.hasFieldErrors("boardId")) {
            replyService.setBoardReply(replyVO);
            return "redirect:/board/detail?id="+id;
        }
        return "redirect:/board/detail?id="+id;
    }

    // 댓글 삭제
    @PostMapping("/replyDelete")
    @ResponseBody
    public int replyDelete(@RequestBody ReplyVO replyVO) {

        Long replyId = replyVO.getReplyId();
        log.info("request replyId:{}", replyId);
        if (replyId != null) {
            replyService.getReplyDelete(replyId);
            return SFV.INT_RES_CODE_SUCCESS;
        }
        return SFV.INT_RES_CODE_FAIL;
    }


}
