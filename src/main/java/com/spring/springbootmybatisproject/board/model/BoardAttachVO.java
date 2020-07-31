package com.spring.springbootmybatisproject.board.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("BoardAttachVO")
public class BoardAttachVO {

  private String uuid;
  private String uploadPath;
  private String fileName;
  private boolean fileType;
  
  private Long boardId;
  
}
