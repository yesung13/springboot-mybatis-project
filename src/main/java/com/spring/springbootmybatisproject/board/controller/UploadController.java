package com.spring.springbootmybatisproject.board.controller;

import com.spring.springbootmybatisproject.board.model.AttachFileDTO;
import lombok.extern.slf4j.Slf4j;
import net.coobird.thumbnailator.Thumbnailator;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Slf4j
@Controller
public class UploadController {
//    @GetMapping("/uploadAjax")
//    public String uploadAjax() {
//        log.info("upload ajax");
//        return "uploadSample/uploadAjax";
//    }


    // 년/월/일 경로를 문자열로 생성 => 폴더 생성
    private String getFolder() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date date = new Date();

        String str = sdf.format(date);

        return str.replace("-", File.separator);
    }

    // 이미지 파일 판별
    private boolean checkImageType(File file) {
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


    /**
     * 파일 업로드
     *
     * @param uploadFile
     * @return
     */
    @PostMapping(value = "/board/uploadAjaxAct", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ResponseBody
    public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {

        List<AttachFileDTO> list = new ArrayList<>();
//        String uploadFolder = "C:\\upload"; //window OS
        String uploadFolder = "/Users/yoonjaeseung/upload"; //mac OS

        String uploadFolderPath = getFolder();
        // make folder ------
        File uploadPath = new File(uploadFolder, uploadFolderPath); // File(파일경로, 파일이름)

        // 파일 경로가 없을 경우
        if (uploadPath.exists() == false) {
            uploadPath.mkdirs();
        }
        //make yyyy/MM/dd folder

        for (MultipartFile multipartFile : uploadFile) {

            AttachFileDTO attachDTO = new AttachFileDTO();

            String uploadFileName = multipartFile.getOriginalFilename();

            // IE has file path
            // IE는 파일 업로드 시 전체 경로가 출력되므로 마지막 '\' 기분으로 잘라낸 문자열이 실제 파일 이름이다.
            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
            log.info("only file name: " + uploadFileName);
            attachDTO.setFileName(uploadFileName);

            // 파일명 중복방지를 위한 UUID 적용
            UUID uuid = UUID.randomUUID();

            uploadFileName = uuid.toString() + "_" + uploadFileName;

            try {
                File saveFile = new File(uploadPath, uploadFileName);
                multipartFile.transferTo(saveFile);

                attachDTO.setUuid(uuid.toString());
                attachDTO.setUploadPath(uploadFolderPath);

                // check image type file
                if (checkImageType(saveFile)) {

                    attachDTO.setImage(true);

                    FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" +
                            uploadFileName));
                    FileInputStream saveFileInputStream = new FileInputStream(saveFile);

//                    Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 160,
//                            100);
                    Thumbnailator.createThumbnail(saveFileInputStream, thumbnail, 200,
                            200);
                    thumbnail.close();
                    saveFileInputStream.close();

                }
                // add to list
                list.add(attachDTO);

            } catch (Exception e) {
                log.error(e.getMessage());
            }

        }// end for
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    /**
     * 섬네일 데이터 전송하기
     *
     * @param fileName
     * @return
     */
    @GetMapping("/board/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName) {

        log.info("fileName: " + fileName);

        File file = new File("c:\\upload\\" + fileName);

        log.info("file: " + file);

        ResponseEntity<byte[]> result = null;

        try {
            HttpHeaders header = new HttpHeaders();

            header.add("Content-Type", Files.probeContentType(file.toPath()));
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 파일 다운로드
     *
     * @param userAgent
     * @param fileName
     * @return
     */
    @GetMapping(value = "/board/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    @ResponseBody
    public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, String fileName) {

        log.info("download file: " + fileName);

        Resource resource = new FileSystemResource("c:\\upload\\" + fileName);

        if (resource.exists() == false) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        String resourceName = resource.getFilename();

        // remove UUID
        String resourceOriginalName = resourceName.substring(resourceName.indexOf("_") + 1);

        HttpHeaders headers = new HttpHeaders();
        try {
            String downloadName = null;

            if (userAgent.contains("Trident")) { // Trident를 포함 할 경우
                log.info("IE browser");
                downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");

            } else if (userAgent.contains("Edge")) {
                log.info("Edge browser");
                downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");

            } else {
                log.info("Chrome browser");
                downloadName = new String(resourceOriginalName.getBytes("UTF-8"), "ISO-8859-1");
            }

            log.info("downloadName: " + downloadName);

            headers.add("Content-Disposition", "attachment; filename=" + downloadName);

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
    }

    /**
     * 파일 삭제(directory)
     *
     * @param fileName
     * @param type
     * @return
     */
    @PostMapping("/board/deleteFile")
    @ResponseBody
    public ResponseEntity<String> deleteFile(String fileName, String type) {

        log.info("deleteFile: " + fileName);

        File file;

        try {
            file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

            file.delete();

            if (type.equals("image")) {

                String largeFileName = file.getAbsolutePath().replace("s_", "");

                log.info("largeFileName: " + largeFileName);

                file = new File(largeFileName);

                file.delete();
            }

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<String>("deleted", HttpStatus.OK);

    }
}