//package com.spring.springbootmybatisproject.account.model;
//
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//import lombok.ToString;
//import org.apache.ibatis.type.Alias;
//
//import javax.validation.constraints.Email;
//import javax.validation.constraints.NotEmpty;
//import javax.validation.constraints.NotNull;
//import javax.validation.constraints.Size;
//
//@Getter
//@Setter
//@NoArgsConstructor
//@ToString
//@Alias("AccountVO")
//public class AccountVO {
//    private Long accountId;
//    @NotEmpty(message = "이메일을 입력하세요.")
//    @Email
//    private String accountEmail;
//    @NotEmpty(message = "패스워드를 입력하세요.")
//    @Size(min = 2, max = 15)
//    private String accountPassword;
//    private String userName;
//    @Size(min = 11, max = 11)
//    private String userPhoneNumber;
//    private String birthDay;
//    private String sexCode;
//    private String createDatetime;
//    private String createHost;
//    private String updateDatetime;
//    private String updateHost;
//}
