package com.spring.springbootmybatisproject.account.repository;

import com.spring.springbootmybatisproject.account.model.NAccountVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface NAccountMapper {

    /* 아이디 중복체크 */
    public abstract String findByDuplicateUserId(@Param("accountUserId") String accountUserId);

    /* 회원가입 */
    public abstract void saveSignUp(NAccountVO nAccountVO);
}
