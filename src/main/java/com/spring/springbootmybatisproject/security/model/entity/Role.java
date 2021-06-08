package com.spring.springbootmybatisproject.security.model.entity;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@Alias("Role")
public class Role {

    private int id;
    private String role;
}
