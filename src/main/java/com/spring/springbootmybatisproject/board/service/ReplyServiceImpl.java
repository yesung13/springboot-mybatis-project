package com.spring.springbootmybatisproject.board.service;

import com.spring.springbootmybatisproject.board.model.ReplyVO;
import com.spring.springbootmybatisproject.board.repository.ReplyMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService {

    private final ReplyMapper replyMapper;

    public ReplyServiceImpl(ReplyMapper replyMapper) {
        this.replyMapper = replyMapper;
    }

    // 댓글 목록
    @Override
    public List<ReplyVO> getReplyList(Long boardId) {
        return replyMapper.selBoardReply(boardId);
    }

    // 댓글 쓰기
    @Override
    public void setBoardReply(ReplyVO replyVO) {
        replyMapper.insBoardReply(replyVO);
    }

    @Override
    public void getReplyDelete(Long replyId) {
        replyMapper.delBoardReply(replyId);
    }
}
