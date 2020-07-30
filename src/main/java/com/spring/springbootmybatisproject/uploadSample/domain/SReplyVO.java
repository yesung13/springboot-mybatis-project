package com.spring.springbootmybatisproject.uploadSample.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SReplyVO {

  private Long rno;
  private Long bno;

  private String reply;
  private String replyer;
  private Date replyDate;
  private Date updateDate;

}
