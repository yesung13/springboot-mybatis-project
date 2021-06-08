package com.spring.springbootmybatisproject.security.repository;

import com.spring.springbootmybatisproject.security.model.entity.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component
@Mapper
public interface RoleMapper {
    Role getRoleInfo(@Param("role") String role);

}
