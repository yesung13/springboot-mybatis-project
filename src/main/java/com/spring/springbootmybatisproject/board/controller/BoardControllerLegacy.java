//package com.spring.springbootmybatisproject.board.controller;
//
//import com.spring.springbootmybatisproject.SFV;
//import com.spring.springbootmybatisproject.board.model.*;
//import com.spring.springbootmybatisproject.board.service.BoardService;
//import com.spring.springbootmybatisproject.board.service.ReplyService;
//import com.spring.springbootmybatisproject.common.model.ResultVO;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.util.FileCopyUtils;
//import org.springframework.web.bind.annotation.*;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.File;
//import java.io.IOException;
//import java.text.DateFormat;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//
//@Slf4j
//@Controller
//@RequestMapping("/board")
//public class BoardControllerLegacy {
//    private static final String SAVE_PATH = "C:\\upload\\temp";
//    private static final String PREFIX_URL = "C:\\upload\\temp\\";
//
//    private final BoardService boardService;
//    private final ReplyService replyService;
//
//    public BoardControllerLegacy(BoardService boardService, ReplyService replyService) {
//        this.boardService = boardService;
//        this.replyService = replyService;
//    }
//
//    /**
//     * 게시글 목록
//     *
//     * @param model
//     * @param curPage
//     * @param boardVO
//     * @return
//     */
//    @GetMapping("/list")
//    public ModelAndView boardList(Model model, @RequestParam(defaultValue = "1") int curPage, BoardVO boardVO,
//                                  HttpServletRequest req) {
//        // 저장한 세션 정보 가져오기
////        HttpSession session = req.getSession(true); // 세션을 가져오기(없으면 생성한다)
////        AccountVO loginAccount = (AccountVO) session.getAttribute("account");
////
////        if(loginAccount != null){
////           String accountEmail = loginAccount.getAccountEmail();
////           String userName = loginAccount.getUserName();
////           model.addAttribute("userEmail", accountEmail);
////           model.addAttribute("userName", userName);
////        }
//
//        // 전체 리스트 개수
//        int listCnt = boardService.getBoardListTotalCnt(boardVO);
//        Pagination pagination = new Pagination(listCnt, curPage);
//        boardVO.setStartIndex(pagination.getStartIndex());
//        boardVO.setCntPerPage(pagination.getPageSize());
//        model.addAttribute("listCnt", listCnt);
//        model.addAttribute("pagination", pagination);
//
//        // 전체 리스트 출력
//        ModelAndView mv = new ModelAndView();
//        List<BoardVO> boardVORes = boardService.getBoardList(boardVO);
//        mv.addObject("boardList", boardVORes); // jstl로 호출
//        mv.setViewName("board/boardList"); // 실제 호출될 jsp 페이지
//        return mv;
//    }
//
//    /**
//     * 게시글 상세 보기
//     *
//     * @param boardId
//     * @param model
//     * @return
//     */
//    @GetMapping("/detail")
//    public String boardDetail(@RequestParam(value = "id") Long boardId, Model model) {
//        BoardVO boardVORes = boardService.getBoardListDetail(boardId);
//        model.addAttribute("boardListDetail", boardVORes);
//
//        // 해당 댓글 목록
//        List<ReplyVO> replyVORes = replyService.getReplyList(boardId);
//        model.addAttribute("replyList", replyVORes);
//
//        // 해당 파일 목록
//        List<FileVO> fileVORes = boardService.getFileList(boardId);
//        model.addAttribute("fileList", fileVORes);
//
//        return "/board/boardDetail";
//    }
//
//
//    /**
//     * 게시글 작성 page
//     *
//     * @return
//     */
//    @GetMapping("/write")
//    public String boardWrite() {
//        return "board/boardWrite";
//    }
//
//    // 게시글 작성(rest 방식)
////    @PostMapping("/setWrite")
////    @ResponseBody
////    public int boardWrite(@RequestBody BoardVO boardVO) {
////        String title = boardVO.getTitle();
////        String content = boardVO.getContent();
////        if (title != null && content != null) {
////            boardService.setBoardWrite(boardVO);
////            return SFV.INT_RES_CODE_OK;
////        }
////        return SFV.INT_RES_CODE_FAIL;
////    }
//
//    // 현재 시간을 기준으로 파일 이름 생성
//    private String genSaveFileName(String extName) {
//        String fileName = "";
//        Date date = new Date();
//        DateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
//        String dateResult = format.format(date);
//        fileName += dateResult;
//        fileName += extName;
//
//        return fileName;
//    }
//
//    /**
//     * 게시글 작성
//     *
//     * @param boardVO
//     * @param multipartReq
//     * @return
//     */
//    @PostMapping("/setWrite")
//    @ResponseBody
//    public ResultVO boardWrite(@ModelAttribute BoardVO boardVO, MultipartHttpServletRequest multipartReq) {
//        ResultVO result = new ResultVO();
//        String title = boardVO.getTitle();
//        String content = boardVO.getContent();
//        Long accountId = boardVO.getAccountId();
//
//        try {
//            if (title != null && content != null && accountId != null) {
//                Long boardId = boardService.setBoardWrite(boardVO);
//
//                // 파일 업로드
//                FileVO fileVO = new FileVO();
//                List<MultipartFile> fileList = multipartReq.getFiles("uploadFile");
//                // 향상된 for문 -> for((2)타입 변수 : (1)배열){(3)실행문}
//                for (MultipartFile mf : fileList) {
//                    if (!mf.isEmpty()) {
//
//                        String originFilename = mf.getOriginalFilename(); // 원본 파일명
//                        String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
//                        //서버에서 저장 할 파일 이름
//                        String saveFilename = genSaveFileName(extName);
////                    String saveFilename = dateResult + "_" + originFilename; // 저장될 파일명
//                        long fileSize = mf.getSize(); // 파일 사이즈
//
//                        System.out.println("originFilename: " + originFilename);
//                        System.out.println("extensionName: " + extName);
//                        System.out.println("fileSize: " + fileSize);
//                        System.out.println("saveFileName: " + saveFilename);
//
//                        String fileLocation = PREFIX_URL + saveFilename;
//                        fileVO.setBoardId(boardId);
//                        fileVO.setOriginFilename(originFilename);
//                        fileVO.setSaveFilename(saveFilename);
//                        fileVO.setFileLocation(fileLocation);
//                        fileVO.setFileSize(fileSize);
//
//                        // disk 파일 저장
//                        String safeFile = PREFIX_URL + originFilename;
//                        try {
//                            mf.transferTo(new File(safeFile)); // 디스크에 파일 저장
//                            boardService.addBoardFile(fileVO);
//                            result.setResCode(SFV.INT_RES_CODE_B_INSERT_SUCCESS);
//                            result.setResMsg(SFV.STRING_RES_B_INSERT_SUCCESS);
//                        } catch (IOException | IllegalStateException e) {
//                            e.printStackTrace();
//                            System.out.println("[message]:" + SFV.STRING_RES_B_INSERT_FILE_FAIL
//                                    + " [code]: " + SFV.INT_RES_CODE_B_INSERT_FILE_FAIL);
//                            result.setResCode(SFV.INT_RES_CODE_B_INSERT_FILE_FAIL);
//                            result.setResMsg(SFV.STRING_RES_B_INSERT_FILE_FAIL);
//                        }
//                    }
//                }
//                // 파일 업로드 끝
//
//                result.setResCode(SFV.INT_RES_CODE_B_INSERT_SUCCESS);
//                result.setResMsg(SFV.STRING_RES_B_INSERT_SUCCESS);
//            }
//        } catch (Exception e) {
//            result.setResCode(SFV.INT_RES_CODE_B_INSERT_FAIL);
//            result.setResMsg(SFV.STRING_RES_B_INSERT_FAIL);
//        }
//        return result;
//    }
//
//
//    /**
//     * 게시글 수정 page
//     *
//     * @param boardId
//     * @param model
//     * @return
//     */
//    @GetMapping("/modify")
//    public String boardUpdateForm(@RequestParam(value = "id") Long boardId, Model model) {
//        BoardVO boardVO = boardService.getBoardListDetail(boardId);
//        model.addAttribute("boardListDetail", boardVO);
//
//        // 해당 파일 목록
//        List<FileVO> fileVORes = boardService.getFileList(boardId);
//        model.addAttribute("fileList", fileVORes);
//        return "board/boardModify";
//    }
//
//    // 게시글 수정(rest방식)
////    @PostMapping("/setUpdate")
////    @ResponseBody
////    public int boardUpdate(@RequestBody BoardVO boardVO) {
////        Long boardId = boardVO.getBoardId();
////        String title = boardVO.getTitle();
////        String content = boardVO.getContent();
////        if (boardId != null || title != null || content != null) {
////            boardService.getBoardUpdate(boardVO);
////            return SFV.INT_RES_CODE_SUCCESS;
////        }
////        return SFV.INT_RES_CODE_FAIL;
////    }
//
//    /**
//     * 게시글 수정
//     *
//     * @param boardVO
//     * @param multipartReq
//     * @return
//     */
//    @PostMapping("/setModify")
//    @ResponseBody
//    public ResultVO boardModify(@ModelAttribute BoardVO boardVO, MultipartHttpServletRequest multipartReq) {
//        ResultVO result = new ResultVO();
//        String title = boardVO.getTitle();
//        String content = boardVO.getContent();
//        Long accountId = boardVO.getAccountId();
//        try {
//            if (title != null && content != null && accountId != null) {
//                Long boardId = boardService.setBoardModify(boardVO);
//                //체크 파일 삭제(disk, DB)
//                String[] checkFileNum = multipartReq.getParameterValues("checkFileNum");
//                if (checkFileNum != null) {
//                    for (String cfn : checkFileNum) {
//                        long fileId = Long.parseLong(cfn);
//                        String originFilename = boardService.getFilename(fileId);
//                        String safeFile = PREFIX_URL + originFilename;
//
//                        // disk 첨부 파일 삭제
//                        File removeFile = new File(safeFile);
//                        boolean delYn = removeFile.delete();
//                        if (delYn) {
//                            System.out.println("Disk File Delete Success");
//                        } else {
//                            System.out.println("Disk File Delete Fail");
//                        }
//                        boardService.deleteBoardFile(fileId);
//                    }
//                }
//
//                // 새 파일 업로드
//                FileVO fileVO = new FileVO();
//                List<MultipartFile> newFileList = multipartReq.getFiles("file");
//                for (MultipartFile mf : newFileList) {
//                    if (!mf.isEmpty()) {
//
//                        String newOriginFilename = mf.getOriginalFilename(); // 원본 파일명
//                        String extName = newOriginFilename.substring(newOriginFilename.lastIndexOf("."), newOriginFilename.length());
//                        //서버에서 저장 할 파일 이름
//                        String newSaveFilename = genSaveFileName(extName);
////                    String newSaveFilename = dateResult + "_" + newOriginFilename; // 저장될 파일명
//                        long newFileSize = mf.getSize(); // 파일 사이즈
//
//                        System.out.println("originFilename: " + newOriginFilename);
//                        System.out.println("extensionName: " + extName);
//                        System.out.println("fileSize: " + newFileSize);
//                        System.out.println("saveFileName: " + newSaveFilename);
//
//                        String fileLocation = PREFIX_URL + newSaveFilename;
//                        fileVO.setBoardId(boardId);
//                        fileVO.setOriginFilename(newOriginFilename);
//                        fileVO.setSaveFilename(newSaveFilename);
//                        fileVO.setFileLocation(fileLocation);
//                        fileVO.setFileSize(newFileSize);
//
//                        // disk 파일 저장
//                        String safeNewFile = PREFIX_URL + newOriginFilename;
//                        try {
//                            mf.transferTo(new File(safeNewFile));
//                            boardService.addBoardFile(fileVO);
//                            result.setResCode(SFV.INT_RES_CODE_B_UPDATE_SUCCESS);
//                            result.setResMsg(SFV.STRING_RES_B_UPDATE_SUCCESS);
//                        } catch (IOException | IllegalStateException e) {
//                            e.printStackTrace();
//                            System.out.println("[message]:" + SFV.STRING_RES_B_INSERT_FILE_FAIL
//                                    + " [code]: " + SFV.INT_RES_CODE_B_INSERT_FILE_FAIL);
//                            result.setResCode(SFV.INT_RES_CODE_B_INSERT_FILE_FAIL);
//                            result.setResMsg(SFV.STRING_RES_B_INSERT_FILE_FAIL);
//                        }
//                    }
//                }
//
//            }
//
//            result.setResCode(SFV.INT_RES_CODE_B_UPDATE_SUCCESS);
//            result.setResMsg(SFV.STRING_RES_B_UPDATE_SUCCESS);
//        } catch (Exception e) {
//            e.printStackTrace();
//            result.setResCode(SFV.INT_RES_CODE_B_UPDATE_FAIL);
//            result.setResMsg(SFV.STRING_RES_B_UPDATE_FAIL);
//        }
//
//        return result;
//    }
//
//    /**
//     * 게시글 삭제
//     *
//     * @param boardVO
//     * @return
//     */
//    @PostMapping("/delete")
//    @ResponseBody
//    public ResultVO boardDelete(@RequestBody BoardVO boardVO) {
//        ResultVO result = new ResultVO();
//        Long boardId = boardVO.getBoardId();
//        if (boardId != null) {
//            try {
//                boardService.getBoardDelete(boardId);
//                result.setResCode(SFV.INT_RES_CODE_B_DELETE_SUCCESS);
//                result.setResMsg(SFV.STRING_RES_B_DELETE_SUCCESS);
//            } catch (Exception e) {
//                e.printStackTrace();
//                result.setResCode(SFV.INT_RES_CODE_B_DELETE_FAIL);
//                result.setResMsg(SFV.STRING_RES_B_DELETE_FAIL);
//            }
//        }
//        return result;
//    }
//
//    /**
//     * 게시글 검색
//     *
//     * @param curPage
//     * @param model
//     * @param boardVO
//     * @return
//     */
//    @GetMapping("/search")
//    public ModelAndView boardSearch(@RequestParam(defaultValue = "1") int curPage,
//                                    Model model, BoardVO boardVO, SearchVO searchVO) {
////        List<BoardVO> searchList = new ArrayList<>();
////        if (type.equals("title") && keyword != null) {
////            searchList = boardService.getBoardSearch(keyword);
////        } else if (type.equals("content") && keyword != null) {
////            searchList = boardService.getBoardSearch(keyword);
////        } else if (type.equals("writer") && keyword != null) {
////            searchList = boardService.getBoardSearch(keyword);
////        }
//
//        // 키워드, 타입 클라이언트로 재전송
//        model.addAttribute("keyword", searchVO.getKeyword());
//        model.addAttribute("type", searchVO.getType());
//
//        // 전체 리스트 개수
//        int listCnt = boardService.getSearchBoardListTotalCnt(searchVO);
//        Pagination pagination = new Pagination(listCnt, curPage);
//        searchVO.setStartIndex(pagination.getStartIndex());
//        searchVO.setCntPerPage(pagination.getPageSize());
//        model.addAttribute("listCnt", listCnt);
//        model.addAttribute("pagination", pagination);
//
//        List<BoardVO> searchList = boardService.getBoardSearch(searchVO);
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("boardList", searchList); // jstl로 호출
//        mv.setViewName("board/boardList"); // 실제 호출될 jsp 페이지
//        return mv;
//    }
//
//    /**
//     * 게시글 조회수
//     *
//     * @param boardId
//     */
//    @PutMapping("/viewCnt")
//    public void boardViewCnt(@RequestParam(value = "boardId") Long boardId) {
//        boardService.increaseViewCnt(boardId);
//    }
//
//    /**
//     * 파일 다운로드
//     *
//     * @param response
//     * @param fileName
//     * @return
//     * @throws IOException
//     */
//    @GetMapping("/fileDownload")
//    @ResponseBody
//    public byte[] downProcess(HttpServletResponse response, @RequestParam(value = "fileName") String fileName) throws IOException {
//
//        File file = new File(PREFIX_URL + fileName);
//        byte[] bytes = FileCopyUtils.copyToByteArray(file);
//        String fn = new String(file.getName().getBytes(), "iso_8859_1");
//        response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
//        response.setContentLength(bytes.length);
//        return bytes;
//    }
//
//}
//
