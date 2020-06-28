package com.spring.springbootmybatisproject.account.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import javax.validation.constraints.NotEmpty;

@Getter
@Setter
@NoArgsConstructor
@Alias("AccountVO")
public class AccountVO {
    private Long accountId;
    @NotEmpty(message = "이메일을 입력하세요.")
    private String accountEmail;
    @NotEmpty(message = "패스워드를 입력하세요.")
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
