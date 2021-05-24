package com.spring.springbootmybatisproject.account.model;

import lombok.*;

/**
 * Created by berno579@gmail.com on 2021/05/24
 * Github : http://github.com/bee0113
 */
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Getter
@Setter

//new 계정
public class NAccountVO {

    // 계정 ID 계정ID
    private Long accountId;

    // 아이디 사용자 아이디
    private String accountUserId;

    // 이메일 사용자 이메일
    private String accountEmail;

    // 패스워드 사용자 패스워드
    private String accountPassword;

    // 개발자구분 개발자구분 - 예비(P), 경력(C)
    private String devCheck;

    // NAccount 모델 복사
    public void CopyData(NAccountVO param)
    {
        this.accountId = param.getAccountId();
        this.accountUserId = param.getAccountUserId();
        this.accountEmail = param.getAccountEmail();
        this.accountPassword = param.getAccountPassword();
        this.devCheck = param.getDevCheck();
    }

}
