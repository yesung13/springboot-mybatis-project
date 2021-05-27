package com.spring.springbootmybatisproject.account.service;

import com.spring.springbootmybatisproject.account.model.NAccountVO;
import com.spring.springbootmybatisproject.account.repository.NAccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NAccountServiceImpl implements NAccountService {

    @Autowired
    private NAccountMapper nAccountMapper;

    /* 회원가입 */
    @Override
    public void registerSignUp(NAccountVO nAccountVO) {
        nAccountMapper.saveSignUp(nAccountVO);
    }

    /* 아이디 중복체크 - 요청받은 아이디 갯수 확인 */
    @Override
    public Integer userIdOverlapCnt(String accountUserId) {
        Integer overlapCnt = nAccountMapper.findByDuplicateUserIdCnt(accountUserId);

        int overlapResult;
        if(overlapCnt > 0){
            overlapResult = 0; // 중복 아이디 존재
        }else{
            overlapResult = 1; // 중복 아이디 없음
        }

        return overlapResult;
    }

    @Override
    public NAccountVO getAccount(NAccountVO nAccountVO) {
        return nAccountMapper.findByAccount(nAccountVO);
    }
}
