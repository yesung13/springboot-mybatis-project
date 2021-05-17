package com.spring.springbootmybatisproject.uploadSample.controller;

import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

//import javax.activation.MimetypesFileTypeMap;
//import java.awt.datatransfer.MimeTypeParseException;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Slf4j
@Controller
public class UploadController {
    @GetMapping("/uploadAjax")
    public String uploadAjax() {
        log.info("upload ajax");
        return "uploadSample/uploadAjax";
    }


    // 년/월/일 경로를 문자열로 생성 => 폴더 생성
    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String str = sdf.format(date);

        return str.replace("-", File.separator);
    }

    @PostMapping("/uploadAjaxAct")
    public void uploadAjaxPost(MultipartFile[] uploadFile) {
        log.info("update ajax post........");

        String uploadFolder = "C:\\upload";

        // make folder ------
        File uploadPath = new File(uploadFolder, getFolder()); // File(파일경로, 파일이름)
        log.info("upload path: " + uploadPath);

        // 파일 경로가 없을 경우
        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }
        //make yyyy/MM/dd folder

        for (MultipartFile multipartFile : uploadFile) {
            log.info("-------------------------------------");
            log.info("Upload File Name: " + multipartFile.getOriginalFilename());
            log.info("Upload File Size: " + multipartFile.getSize());

            String uploadFileName = multipartFile.getOriginalFilename();

            // IE has file path
            // IE는 파일 업로드 시 전체 경로가 출력되므로 마지막 '\' 기분으로 잘라낸 문자열이 실제 파일 이름이다.
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
            log.info("only file name: " + uploadFileName);

            // 파일명 중복방지를 위한 UUID 적용
            UUID uuid = UUID.randomUUID();

            uploadFileName = uuid.toString() + "_" + uploadFileName;

            try {
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);
                // check image type file
                if (checkImageType(saveFile)) {

                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" +
                            uploadFileName));

                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 160,
                            100);
                    thumbnail.close();
                }
            } catch (Exception e) {
                log.error(e.getMessage());
            }// end catch
        }// end for
    }

    // 이미지 파일 판별
    private boolean checkImageType(File file) {
//        MimetypesFileTypeMap mimeTypesMap = new MimetypesFileTypeMap();
//
//        String mimeType = mimeTypesMap.getContentType(file);
//
//        if (mimeType.contains("images")) {
//            return true;
//        } else {
//            return false;
//        }
//
        try {
            String contentType = Files.probeContentType(file.toPath());
            System.out.println("mimeType: " + contentType);
            return contentType.startsWith("image");

        } catch (IOException e) {
            e.printStackTrace();
        }

        return false;
    }
    // end 이미지 파일 판별
}
