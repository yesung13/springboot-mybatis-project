package com.spring.springbootmybatisproject.account.repository;

import com.spring.springbootmybatisproject.account.model.NAccountVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NAccountMapper {

    public abstract void saveSignUp(NAccountVO nAccountVO);
}
