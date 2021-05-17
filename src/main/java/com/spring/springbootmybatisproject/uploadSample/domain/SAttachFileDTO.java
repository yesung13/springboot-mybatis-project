package com.spring.springbootmybatisproject.uploadSample.domain;

import lombok.Data;

@Data
public class SAttachFileDTO {

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;

}
