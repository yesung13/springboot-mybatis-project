package com.spring.springbootmybatisproject.sample.controller;

import com.spring.springbootmybatisproject.sample.service.FileUploadService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Controller
@Slf4j
public class SampleController {
    @Autowired
    FileUploadService fileUploadService;

    @GetMapping("/sample")
    public String samplePage() {
        return "/sample";
    }

    // 단일 파일
    @PostMapping("/upload")
    public String upload(Model model,
                         @RequestParam("email") String email,
                         @RequestParam("file1") MultipartFile file) {
        String url = fileUploadService.restore(file);
        model.addAttribute("url",url);
        return "result";
    }

    @GetMapping("/uploadForm")
    public void uploadForm(){
        log.info("upload form");
    }
}
