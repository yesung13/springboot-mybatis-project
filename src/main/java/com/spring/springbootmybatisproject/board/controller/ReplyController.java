package com.spring.springbootmybatisproject.board.controller;

import com.spring.springbootmybatisproject.SFV;
import com.spring.springbootmybatisproject.board.model.ReplyVO;
import com.spring.springbootmybatisproject.common.model.ResultVO;
import com.spring.springbootmybatisproject.board.service.ReplyService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
    @ResponseBody
    public ResultVO replyWrite(@Valid ReplyVO replyVO, BindingResult result, RedirectAttributes redirectAttr) {
        ResultVO res = new ResultVO();
        Long boardId = replyVO.getBoardId();
        if (!result.hasFieldErrors("replyContent") && !result.hasFieldErrors("boardId")) {
            try{
                replyService.setBoardReply(replyVO);
                redirectAttr.addAttribute("id", boardId);
                res.setResCode(SFV.INT_RES_CODE_OK);
                res.setResMsg(SFV.STRING_RES_CODE_OK);
            }catch (Exception e){
                e.printStackTrace();
                res.setResCode(SFV.INT_RES_CODE_FAIL);
                res.setResMsg(SFV.STRING_RES_CODE_FAIL);
            }
        }
        return res;
    }

    // 댓글 수정
    @PostMapping("/replyUpdate")
    @ResponseBody
    public int replyUpdate(@RequestBody ReplyVO replyVO, BindingResult result) {
        if (!result.hasFieldErrors("replyContent") && !result.hasFieldErrors("replyId") && !result.hasFieldErrors("replyWriter")) {
            replyService.getReplyUpdate(replyVO);
            return SFV.INT_RES_CODE_SUCCESS;
        }
        return SFV.INT_RES_CODE_FAIL;
    }

    // 댓글 삭제
    @PostMapping("/replyDelete")
    @ResponseBody
    public int replyDelete(@RequestBody ReplyVO replyVO) {
        Long replyId = replyVO.getReplyId();
        Long boardId = replyVO.getBoardId();
        log.info("request replyId:{}", replyId);
        if (replyId != null) {
            replyService.getReplyDelete(replyId, boardId);
            return SFV.INT_RES_CODE_SUCCESS;
        }
        return SFV.INT_RES_CODE_FAIL;
    }


}
