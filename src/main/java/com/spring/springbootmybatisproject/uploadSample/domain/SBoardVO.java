package com.spring.springbootmybatisproject.uploadSample.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class SBoardVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;

	private int replyCnt;

	private List<SBoardAttachVO> attachList;
}
