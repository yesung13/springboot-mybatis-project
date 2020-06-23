package com.spring.springbootmybatisproject.board.service;

import com.spring.springbootmybatisproject.board.model.ReplyVO;

import java.util.List;

public interface ReplyService {

    // 댓글 목록
    List<ReplyVO> getReplyList(Long boardId);

    // 댓글 쓰기
    void setBoardReply(ReplyVO replyVO);

    // 댓글 수정
    void getReplyUpdate(ReplyVO replyVO);

    // 댓글 삭제
    void getReplyDelete(Long replyId, Long boardId);
}
