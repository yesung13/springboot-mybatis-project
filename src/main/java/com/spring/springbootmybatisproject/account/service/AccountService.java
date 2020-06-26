package com.spring.springbootmybatisproject.account.service;

import com.spring.springbootmybatisproject.account.model.AccountVO;

import java.util.List;

public interface AccountService {
    List<AccountVO> getAccountList();

    // 계정 로그인
    AccountVO getAccount(AccountVO accountVO);
}
