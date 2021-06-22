package com.spring.springbootmybatisproject;

/*
    String Field Validation
 */
public class SFV {

    // 공통 코드
    public static final int INT_RES_CODE_OK = 200;
    public static final int INT_RES_CODE_SUCCESS = 0;
    public static final int INT_RES_CODE_FAIL = -1;

    
    public static final String STRING_RES_CODE_OK = "성공했습니다.";
    public static final String STRING_RES_CODE_SUCCESS = "생성했습니다.";
    public static final String STRING_RES_CODE_FAIL = "실패했습니다.";

    // account(A)
    public static final String STRING_RES_A_LOGIN_SUCCESS = "로그인을 성공하였습니다.";
    public static final String STRING_RES_A_LOGIN_FAIL = "가입하지 않은 아이디 또는 잘못된 비밀번호입니다.";
    public static final String STRING_RES_A_LOGIN_CHECK = "아이디 혹은 패스워드가 일치하지 않습니다.";
    public static final String STRING_RES_A_SIGNUP_SUCCESS = "회원가입을 성공하였습니다.";
    public static final String STRING_RES_A_DELACCOUNT_SUCCESS = "회원탈퇴를 성공하였습니다.\n이용해주셔서 감사합니다.";

    public static final int INT_RES_CODE_A_LOGIN_SUCCESS = 1000;
    public static final int INT_RES_CODE_A_LOGIN_FAIL = 1001;
    public static final int INT_RES_CODE_A_LOGIN_CHECK = 1002;
    public static final int INT_RES_A_SIGNUP_SUCCESS = 1003;
    public static final int INT_RES_A_DELACCOUNT_SUCCESS = 1004;

    // board(B)
    public static final String STRING_RES_B_INSERT_SUCCESS = "글 작성을 성공했습니다.";
    public static final String STRING_RES_B_UPDATE_SUCCESS = "글 수정을 성공했습니다.";
    public static final String STRING_RES_B_DELETE_SUCCESS = "글 삭제를 성공했습니다.";
    public static final String STRING_RES_B_INSERT_FAIL = "글 작성을 실패했습니다.\n 잠시 후 다시 시도해주세요.";
    public static final String STRING_RES_B_UPDATE_FAIL = "글 수정을 실패했습니다.\n 잠시 후 다시 시도해주세요.";
    public static final String STRING_RES_B_DELETE_FAIL = "글 삭제를 실패했습니다.\n 잠시 후 다시 시도해주세요.";
    public static final String STRING_RES_B_INSERT_FILE_FAIL = "파일 업로드를 실패했습니다.\n잠시후 다시 시도해주세요.";


    public static final int INT_RES_CODE_B_INSERT_SUCCESS = 600;
    public static final int INT_RES_CODE_B_UPDATE_SUCCESS = 602;
    public static final int INT_RES_CODE_B_DELETE_SUCCESS = 604;
    public static final int INT_RES_CODE_B_INSERT_FAIL = 601;
    public static final int INT_RES_CODE_B_UPDATE_FAIL = 603;
    public static final int INT_RES_CODE_B_DELETE_FAIL = 605;
    public static final int INT_RES_CODE_B_INSERT_FILE_FAIL = 607;


}