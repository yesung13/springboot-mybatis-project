package com.spring.springbootmybatisproject.board.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import javax.validation.constraints.NotNull;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Alias("BoardVO") // mybatis mapper resultType alias
public class BoardVO {
    private int no; // 게시글 순번
    private Long boardId; // 게시글 시퀀스
    private Long accountId;
    private String title;
    private String content;
    private String writer;
    private int viewCnt;
    private int replyCnt;
    private String boardDatetime;
    private String boardUpDatetime;

    // 페이징
    private int startIndex; // 시작 인덱스
    private int cntPerPage; // 한 페이지당 가져올 데이터 개수

    // 파일첨부 관련
    private List<BoardAttachVO> attachList;

    @Builder
    public BoardVO(Long boardId, Long accountId, String title, String content, String writer, int viewCnt, int replyCnt, String boardDatetime, String boardUpDatetime) {
        this.boardId = boardId;
        this.accountId = accountId;
        this.title = title;
        this.content = content;
        this.writer = writer;
        this.viewCnt = viewCnt;
        this.replyCnt = replyCnt;
        this.boardDatetime = boardDatetime;
        this.boardUpDatetime = boardUpDatetime;
    }
}


