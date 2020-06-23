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
        replyMapper.increaseReplyCnt(replyVO.getReplyId());

    }

    //댓글 수정
    @Override
    public void getReplyUpdate(ReplyVO replyVO) {
        replyMapper.updBoardReply(replyVO);
    }

    // 댓글 삭제
    @Override
    public void getReplyDelete(Long replyId) {
        replyMapper.delBoardReply(replyId);
    }

    // 댓글 수 증가
    @Override
    public void increaseReplyCnt(Long boardId) {
        replyMapper.increaseReplyCnt(boardId);
    }

    // 댓글 수 감소
    @Override
    public void decreaseReplyCnt(Long boardId) {
        replyMapper.decreaseReplyCnt(boardId);
    }
}
