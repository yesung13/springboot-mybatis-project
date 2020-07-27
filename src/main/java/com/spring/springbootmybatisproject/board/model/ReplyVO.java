package com.spring.springbootmybatisproject.board.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Alias("ReplyVO") // mybatis mapper resultType alias
public class ReplyVO {
    private Long replyId;
    private Long accountId;
    private Long boardId;
//    @NotEmpty(message = "There is no replyWrite rvalue.")
    private String replyWriter;
    @NotBlank(message = "댓글을 입력하세요.")
    private String replyContent;
    private Date replyDatetime;

}
