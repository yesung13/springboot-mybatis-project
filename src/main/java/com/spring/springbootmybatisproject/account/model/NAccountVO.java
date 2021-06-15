package com.spring.springbootmybatisproject.account.model;

import lombok.*;
import org.apache.ibatis.type.Alias;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by berno579@gmail.com on 2021/05/24
 * Github : http://github.com/bee0113
 */
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Alias("NAccountVO") // mapper에서 객체 경로를 단축하여 사용하기 위함
//new 계정
public class NAccountVO {

    // 계정ID
    private Long accountId;

    // 사용자 아이디
    private String accountUserId;

    // 사용자 이름
    private String accountUserNm;

    // 사용자 이메일
    private String accountEmail;

    // 사용자 패스워드
    private String accountPassword;

    // 개발자구분 - 예비(P), 경력(C)
    private String devCheck;

    // 계정 활성
    private int active;

    // 인가 구분
    private String roles = "";

    // URL 접근권한
    private String permissions = "";

    // 가입날짜 사용자 가입날짜
    private String createDt;

    // 수정날짜 사용자 정보 수정 날짜
    private String updateDt;

    // 게정 삭제 여부
    private String delYn;


    public List<String> getRoleList() {
        if (this.roles.length() > 0) {
            return Arrays.asList(this.roles.split(","));
        }

        return new ArrayList<>();
    }

    public List<String> getPermissionList() {
        if (this.permissions.length() > 0) {
            return Arrays.asList(this.permissions.split(","));
        }

        return new ArrayList<>();
    }


}
