package com.spring.springbootmybatisproject.account.repository;

import com.spring.springbootmybatisproject.account.model.AccountVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface AccountMapper {
    List<AccountVO> findAll();

    // 계정 로그인
    AccountVO findByAccount(AccountVO accountVO);
}
