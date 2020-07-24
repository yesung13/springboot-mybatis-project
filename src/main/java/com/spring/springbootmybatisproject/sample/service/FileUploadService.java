package com.spring.springbootmybatisproject.sample.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface FileUploadService {

    String restore(MultipartFile file);
//    String restore(MultipartFile files);
}
