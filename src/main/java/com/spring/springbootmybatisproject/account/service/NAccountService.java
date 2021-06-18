package com.spring.springbootmybatisproject.account.service;

import com.spring.springbootmybatisproject.account.model.NAccountVO;

public interface NAccountService {

    /* 회원 가입 */
    public abstract void registerSignUp(NAccountVO nAccountVO);

    /* 아이디 중복체크 - 요청받은 아이디 갯수 확인 */
    public abstract Integer userIdOverlapCnt(String accountUserId);

    /* 계정 로그인 */
//    public abstract NAccountVO getAccount(NAccountVO nAccountVO);

    /* 회원 탈퇴 */
    void deleteAccountInfo(NAccountVO nAccountVO);
}
