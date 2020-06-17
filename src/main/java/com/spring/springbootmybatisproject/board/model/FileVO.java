package com.spring.springbootmybatisproject.board.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class FileVO {
    private int fileId;
    private int boardId;
    private String fileName; // 저장할 파일
    private String fileOriName; // 실제 파일
    private String fileUrl;
}
