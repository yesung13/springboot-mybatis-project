package com.spring.springbootmybatisproject.account.service;

import com.spring.springbootmybatisproject.account.model.NAccountVO;
import com.spring.springbootmybatisproject.account.repository.NAccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NAccountServiceImpl implements NAccountService {

    @Autowired
    private NAccountMapper nAccountMapper;

    @Override
    public void registerSignUp(NAccountVO nAccountVO) {
        nAccountMapper.saveSignUp(nAccountVO);
    }
}
