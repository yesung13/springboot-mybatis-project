package com.spring.springbootmybatisproject.account.service;

import com.spring.springbootmybatisproject.account.model.NAccountVO;

public interface NAccountService {

    /* 아이디 중복체크를 위하여 */
//    public abstract NAccountVO.ReqDTO getAccountUserId()

    /* 회원 가입 */
    public abstract void registerSignUp(NAccountVO nAccountVO);
}
