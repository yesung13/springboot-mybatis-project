package com.spring.springbootmybatisproject.security.repository;

import com.spring.springbootmybatisproject.security.model.entity.UserRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
@Mapper
public interface UserRoleMapper {
    void setUserRoleInfo(@Param("param") UserRole userRole);
}
