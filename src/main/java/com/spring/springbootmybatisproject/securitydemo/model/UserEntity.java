package com.spring.springbootmybatisproject.securitydemo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

/**
 * Created by berno579@gmail.com on 2021/06/06
 * Github : http://github.com/bee0113
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Alias("UserEntity")
public class UserEntity {

    private long userId;
    private String name;
    private String password;
    private String role;


}
