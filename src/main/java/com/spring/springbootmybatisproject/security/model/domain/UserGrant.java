package com.spring.springbootmybatisproject.security.model.domain;

import org.springframework.security.core.GrantedAuthority;

public class UserGrant implements GrantedAuthority {
    @Override
    public String getAuthority() {
        return "USER";
    }
}
