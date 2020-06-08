package com.spring.springbootmybatisproject.account.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

@Getter
@Setter
@NoArgsConstructor
@Alias("AccountVO")
public class AccountVO {
    private Long accountId;
    private String accountEmail;
    private String accountPassword;
    private String userName;
    private String userPhoneNumber;
    private String birthDay;
    private String sexCode;
    private String createDatetime;
    private String createHost;
    private String updateDatetime;
    private String updateHost;
}
