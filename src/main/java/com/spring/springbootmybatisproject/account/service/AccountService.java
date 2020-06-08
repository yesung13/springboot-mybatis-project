package com.spring.springbootmybatisproject.account.service;

import com.spring.springbootmybatisproject.account.model.AccountVO;

import java.util.List;

public interface AccountService {
    List<AccountVO> getAccountList();
}
