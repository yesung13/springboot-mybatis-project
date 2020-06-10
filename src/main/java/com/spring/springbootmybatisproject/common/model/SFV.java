package com.spring.springbootmybatisproject.common.model;

import lombok.NoArgsConstructor;

/*
    String Field Validation
 */
@NoArgsConstructor
public class SFV {
    public static final int RES_OK_CODE = 200;
    public static final int RES_SUCCESS_CODE = 0;
    public static final int RES_FAIL_CODE = -1;

    public static int getResOkCode() {
        return RES_OK_CODE;
    }

    public static int getResSuccessCode() {
        return RES_SUCCESS_CODE;
    }

    public static int getResFailCode() {
        return RES_FAIL_CODE;
    }
}
