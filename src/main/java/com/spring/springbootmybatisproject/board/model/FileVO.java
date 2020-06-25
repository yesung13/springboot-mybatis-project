package com.spring.springbootmybatisproject.board.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@NoArgsConstructor
@Alias("FileVO")
public class FileVO {
    private Long fileId;
    private Long boardId;
    private String originFilename; // 실제 파일
    private String saveFilename; // 저장할 파일
    private String fileUrl;
    private long fileSize;
}
