//package com.spring.springbootmybatisproject.account.service;
//
//import com.spring.springbootmybatisproject.account.model.AccountVO;
//import com.spring.springbootmybatisproject.account.repository.AccountMapper;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
//@Service
//public class AccountServiceImpl implements AccountService {
//    private final AccountMapper accountMapper;
//
//    public AccountServiceImpl(AccountMapper accountMapper) {
//        this.accountMapper = accountMapper;
//    }
//
//    @Override
//    public List<AccountVO> getAccountList() {
//        return accountMapper.findAll();
//    }
//
//    // 계정 로그인
//    @Override
//    public AccountVO getAccount(AccountVO accountVO) {
//        return accountMapper.findByAccount(accountVO);
//    }
//}
