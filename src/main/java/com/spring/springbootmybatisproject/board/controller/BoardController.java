package com.spring.springbootmybatisproject.board.controller;

import com.spring.springbootmybatisproject.SFV;
import com.spring.springbootmybatisproject.board.model.*;
import com.spring.springbootmybatisproject.board.service.BoardService;
import com.spring.springbootmybatisproject.board.service.ReplyService;
import com.spring.springbootmybatisproject.common.model.ResultVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
    private final BoardService boardService;
    private final ReplyService replyService;

    public BoardController(BoardService boardService, ReplyService replyService) {
        this.boardService = boardService;
        this.replyService = replyService;
    }

    /**
     * 게시글 목록
     *
     * @param model
     * @param curPage
     * @param boardVO
     * @return
     */
    @GetMapping("/list")
    public ModelAndView boardList(Model model, @RequestParam(defaultValue = "1") int curPage, BoardVO boardVO,
                                  HttpServletRequest req) {
        // 저장한 세션 정보 가져오기
//        HttpSession session = req.getSession(true); // 세션을 가져오기(없으면 생성한다)
//        AccountVO loginAccount = (AccountVO) session.getAttribute("account");
//
//        if(loginAccount != null){
//           String accountEmail = loginAccount.getAccountEmail();
//           String userName = loginAccount.getUserName();
//           model.addAttribute("userEmail", accountEmail);
//           model.addAttribute("userName", userName);
//        }

        // 전체 리스트 개수
        int listCnt = boardService.getBoardListTotalCnt(boardVO);
        Pagination pagination = new Pagination(listCnt, curPage);
        boardVO.setStartIndex(pagination.getStartIndex());
        boardVO.setCntPerPage(pagination.getPageSize());
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("pagination", pagination);

        // 전체 리스트 출력
        ModelAndView mv = new ModelAndView();

        List<BoardVO> boardVORes = boardService.getBoardList(boardVO);

        // 게시물타입이 N(공지사항)인 경우 리스트 출력
        List<BoardVO> boardTypeNotice = boardService.getBoardTypeNoticeList(boardVO);


        mv.addObject("boardList", boardVORes); // jstl로 호출
        mv.addObject("boardTypeNList", boardTypeNotice);
        mv.setViewName("board/boardList"); // 실제 호출될 jsp 페이지
        return mv;
    }

    /**
     * 게시글 상세 보기
     *
     * @param boardId
     * @param model
     * @return
     */
    @GetMapping("/detail")
    public String boardDetail(@RequestParam(value = "id") Long boardId, Model model) {
        BoardVO boardVORes = boardService.getBoardListDetail(boardId);
        model.addAttribute("boardListDetail", boardVORes);

        // 해당 댓글 목록
        List<ReplyVO> replyVORes = replyService.getReplyList(boardId);
        model.addAttribute("replyList", replyVORes);

//        // 해당 파일 목록
//        List<FileVO> fileVORes = boardService.getFileList(boardId);
//        model.addAttribute("fileList", fileVORes);

        return "/board/boardDetail";
    }

    //해당 파일 목록
    @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ResponseEntity<List<BoardAttachVO>> getAttachList(Long boardId) {

        log.info("getAttachList " + boardId);

        List<BoardAttachVO> attachVOList = boardService.getAttachList(boardId);

        return new ResponseEntity<>(attachVOList, HttpStatus.OK);
    }

    /**
     * 게시글 등록 page
     *
     * @return
     */
    @GetMapping("/write")
    public String boardWrite() {
        return "board/boardWrite";
    }

    @GetMapping("/register")
    public void register() {

    }


    /**
     * 게시글 등록
     *
     * @param boardVO
     * @return
     */
    @PostMapping("/register")
    @ResponseBody
    public ResultVO register(@ModelAttribute BoardVO boardVO) {
        ResultVO result = new ResultVO();
        String title = boardVO.getTitle();
        String content = boardVO.getContent();
        Long accountId = boardVO.getAccountId();

        log.info("====================");
        log.info("register: " + boardVO);
        if (boardVO.getAttachList() != null) {
            boardVO.getAttachList().forEach(attachVO -> log.info(String.valueOf(attachVO)));
            // 위 람다식과 같은 코드
//            List<BoardAttachVO> boardAttachVOS = boardVO.getAttachList();
//            for(BoardAttachVO attachVO : boardAttachVOS) {
//                log.info(String.valueOf(attachVO));
//                if(attachVO)
//            }

        }
        log.info("====================");

        try {
            if (title != null && content != null && accountId != null) {
                boardService.register(boardVO);

                result.setResCode(SFV.INT_RES_CODE_B_INSERT_SUCCESS);
                result.setResMsg(SFV.STRING_RES_B_INSERT_SUCCESS);
            }


        } catch (Exception e) {
            result.setResCode(SFV.INT_RES_CODE_B_INSERT_FAIL);
            result.setResMsg(SFV.STRING_RES_B_INSERT_FAIL);
        }
        return result;
    }
//    @PostMapping("/register")
//    public String register(BoardVO boardVO, RedirectAttributes rttr) {
//
//        log.info("====================");
//        log.info("register: " + boardVO);
//
//        if (boardVO.getAttachList() != null) {
//            boardVO.getAttachList().forEach(attachVO -> log.info(String.valueOf(attachVO)));
//            // 위 람다식과 같은 코드
////            List<BoardAttachVO> boardAttachVOS = boardVO.getAttachList();
////            for(BoardAttachVO attachVO : boardAttachVOS) {
////                log.info(String.valueOf(attachVO));
////                if(attachVO)
////            }
//
//        }
//
//        log.info("====================");
//
//        boardService.register(boardVO);
//        rttr.addFlashAttribute("result", boardVO.getBoardId());
//
//        return "redirect:/board/list";
//    }

    /**
     * 게시글 수정 page
     *
     * @param boardId
     * @param model
     * @return
     */
    @GetMapping("/modify")
    public String boardUpdateForm(@RequestParam(value = "id") Long boardId, Model model) {
        BoardVO boardVO = boardService.getBoardListDetail(boardId);
        model.addAttribute("boardListDetail", boardVO);

        // 해당 파일 목록
//        List<FileVO> fileVORes = boardService.getFileList(boardId);
//        model.addAttribute("fileList", fileVORes);

        return "board/boardModify";
    }

    // 추가
    @PostMapping("/modify")
    @ResponseBody
    public ResultVO modify(@ModelAttribute BoardVO boardVO) {
        ResultVO result = new ResultVO();
        String title = boardVO.getTitle();
        String content = boardVO.getContent();
        Long accountId = boardVO.getAccountId();

        log.info("modify:" + boardVO);

        try {
            if (title != null && content != null && accountId != null) {
                if (boardService.modify(boardVO)) {
                    result.setResCode(SFV.INT_RES_CODE_B_UPDATE_SUCCESS);
                    result.setResMsg(SFV.STRING_RES_B_UPDATE_SUCCESS);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.setResCode(SFV.INT_RES_CODE_B_UPDATE_FAIL);
            result.setResMsg(SFV.STRING_RES_B_UPDATE_FAIL);
        }


        return result;
    }

//    @PostMapping("/modify")
//    public String modify(BoardVO boardVO, RedirectAttributes rttr) {
//        log.info("modify:" + boardVO);
//
//        if (boardService.modify(boardVO)) {
//            rttr.addFlashAttribute("result", "success");
//        }
//        return "redirect:/board/list";
//    }

    /**
     * 게시글 수정
     *
     * @param boardVO
     * @param multipartReq
     * @return
     */
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
////                String[] checkFileNum = multipartReq.getParameterValues("checkFileNum");
////                if (checkFileNum != null) {
////                    for (String cfn : checkFileNum) {
////                        long fileId = Long.parseLong(cfn);
////                        String originFilename = boardService.getFilename(fileId);
////                        String safeFile = PREFIX_URL + originFilename;
////
////                        // disk 첨부 파일 삭제
////                        File removeFile = new File(safeFile);
////                        boolean delYn = removeFile.delete();
////                        if (delYn) {
////                            System.out.println("Disk File Delete Success");
////                        } else {
////                            System.out.println("Disk File Delete Fail");
////                        }
////                        boardService.deleteBoardFile(fileId);
////                    }
////                }
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

    /**
     * 게시글 삭제
     *
     * @param boardVO
     * @return
     */
    @PostMapping("/delete")
    @ResponseBody
    public ResultVO boardDelete(@RequestBody BoardVO boardVO) {
        ResultVO result = new ResultVO();
        Long boardId = boardVO.getBoardId();
        if (boardId != null) {
            try {
                List<BoardAttachVO> attachList = boardService.getAttachList(boardId);

                log.info("attachList ={}", attachList);

                if (boardService.remove(boardId)) {
                    //delete attach files
                    deleteFiles(attachList);
                }
                result.setResCode(SFV.INT_RES_CODE_B_DELETE_SUCCESS);
                result.setResMsg(SFV.STRING_RES_B_DELETE_SUCCESS);
            } catch (Exception e) {
                e.printStackTrace();
                result.setResCode(SFV.INT_RES_CODE_B_DELETE_FAIL);
                result.setResMsg(SFV.STRING_RES_B_DELETE_FAIL);
            }
        }
        return result;
    }

    /**
     * 실제 파일 삭제 메서드
     *
     * @param attachList
     */
    private void deleteFiles(List<BoardAttachVO> attachList) {
        if (attachList == null || attachList.size() == 0) {
            return;
        }

        log.info("delete attach files........");
        log.info(String.valueOf(attachList));

        attachList.forEach(boardAttachVO -> {
            try {
                Path file = Paths.get("C:\\upload\\" + boardAttachVO.getUploadPath() + "\\" + boardAttachVO.getUuid() + "_" + boardAttachVO.getFileName());

                Files.deleteIfExists(file);

                if (Files.probeContentType(file).startsWith("image")) {

                    Path thumbnail = Paths.get("C:\\upload\\" + boardAttachVO.getUploadPath() + "\\s_" + boardAttachVO.getUuid() + "_" + boardAttachVO.getFileName());

                    Files.delete(thumbnail);
                }

            } catch (Exception e) {
                log.error("delete file error: " + e.getMessage());
            }//end catch
        });//end for each
    }


    /**
     * 게시글 검색
     *
     * @param curPage
     * @param model
     * @param boardVO
     * @return
     */
    @GetMapping("/search")
    public ModelAndView boardSearch(@RequestParam(defaultValue = "1") int curPage,
                                    Model model, BoardVO boardVO, SearchVO searchVO) {
//        List<BoardVO> searchList = new ArrayList<>();
//        if (type.equals("title") && keyword != null) {
//            searchList = boardService.getBoardSearch(keyword);
//        } else if (type.equals("content") && keyword != null) {
//            searchList = boardService.getBoardSearch(keyword);
//        } else if (type.equals("writer") && keyword != null) {
//            searchList = boardService.getBoardSearch(keyword);
//        }

        // 키워드, 타입 클라이언트로 재전송
        model.addAttribute("keyword", searchVO.getKeyword());
        model.addAttribute("type", searchVO.getType());

        // 전체 리스트 개수
        int listCnt = boardService.getSearchBoardListTotalCnt(searchVO);
        Pagination pagination = new Pagination(listCnt, curPage);
        searchVO.setStartIndex(pagination.getStartIndex());
        searchVO.setCntPerPage(pagination.getPageSize());
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("pagination", pagination);

        List<BoardVO> searchList = boardService.getBoardSearch(searchVO);
        ModelAndView mv = new ModelAndView();
        mv.addObject("boardList", searchList); // jstl로 호출
        mv.setViewName("board/boardList"); // 실제 호출될 jsp 페이지
        return mv;
    }


    /**
     * 게시글 조회수
     *
     * @param boardId
     */
    @PutMapping("/viewCnt")
    public void boardViewCnt(@RequestParam(value = "boardId") Long boardId) {
        boardService.increaseViewCnt(boardId);
    }

}

