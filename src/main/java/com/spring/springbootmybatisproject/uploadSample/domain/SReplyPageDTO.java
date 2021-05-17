package com.spring.springbootmybatisproject.uploadSample.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class SReplyPageDTO {

  private int replyCnt;
  private List<SReplyVO> list;
}
