package com.spring.springbootmybatisproject.uploadSample.domain;

import lombok.Data;

@Data
public class SBoardAttachVO {

  private String uuid;
  private String uploadPath;
  private String fileName;
  private boolean fileType;
  
  private Long bno;
  
}
