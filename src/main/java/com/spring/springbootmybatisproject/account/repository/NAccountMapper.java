package com.spring.springbootmybatisproject.account.repository;

import com.spring.springbootmybatisproject.account.model.NAccountVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface NAccountMapper {

    /* 회원가입 */
    public abstract void saveSignUp(NAccountVO nAccountVO);

    /* 아이디 중복체크 - 요청받은 아이디 갯수 확인 */
    public abstract Integer findByDuplicateUserIdCnt(String accountUserId);

    /* 계정 로그인 */
    public abstract NAccountVO findByAccount(NAccountVO nAccountVO);
}
