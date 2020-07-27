package com.spring.springbootmybatisproject.board.repository;

import com.spring.springbootmybatisproject.board.model.ReplyVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ReplyMapper {

    // 댓글 목록
    List<ReplyVO> selBoardReply(Long boardId);

    // 댓글 쓰기
    void insBoardReply(ReplyVO replyVO);

    // 댓글 수정
    void updBoardReply(ReplyVO replyVO);

    // 댓글 삭제
    void delBoardReply(Long replyId);

    // 댓글 수 증가
    void increaseReplyCnt(Long boardId);

    // 댓글 수 감소
    void decreaseReplyCnt(Long boardId);
}
