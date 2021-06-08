package com.spring.springbootmybatisproject.security.model.entity;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("User")
public class User {

    private int id;
    private String loginId;
    private String password;
    private String passwordConfirm;
    private String userName;
    private int active;
}
