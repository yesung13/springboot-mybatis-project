package com.spring.springbootmybatisproject.board.model;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@NoArgsConstructor
@Alias("BoardVO") // mybatis mapper resultType alias
public class BoardVO {
    private int no; // 게시글 순번
    private Long boardId; // 게시글 시퀀스
    private Long accountId;
    @NotNull(message = "제목을 입력하세요")
    private String title;
    private String content;
    private String writer;
    private int viewCnt;
    private int replyCnt;
    private String boardDatetime;
    private String boardUpDatetime;

    @Builder
    public BoardVO(Long accountId, String title, String content, String writer, int viewCnt, int replyCnt) {
        this.accountId = accountId;
        this.title = title;
        this.content = content;
        this.writer = writer;
        this.viewCnt = viewCnt;
        this.replyCnt = replyCnt;
    }

}


