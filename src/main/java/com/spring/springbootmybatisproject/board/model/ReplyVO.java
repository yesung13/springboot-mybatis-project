package com.spring.springbootmybatisproject.board.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import javax.validation.constraints.NotNull;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@Alias("ReplyVO") // mybatis mapper resultType alias
public class ReplyVO {
    private Long replyId;
    private Long accountId;
    @NotNull(message = "There is no boardId value.")
    private Long boardId;
    @NotNull(message = "There is no replyWrite rvalue.")
    private String replyWriter;
    @NotNull(message = "There is no replyContent value.")
    private String replyContent;
    private Date replyDatetime;

}
