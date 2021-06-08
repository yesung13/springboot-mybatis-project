package com.spring.springbootmybatisproject.security.model.entity;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("UserRole")
public class UserRole {

    private int userId;
    private int roleId;
}
