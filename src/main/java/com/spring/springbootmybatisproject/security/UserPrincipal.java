package com.spring.springbootmybatisproject.security;

import com.spring.springbootmybatisproject.account.model.NAccountVO;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by berno579@gmail.com on 2021/06/15
 * Github : http://github.com/bee0113
 */
public class UserPrincipal implements UserDetails {

    // 안만들어도 상관없지만 Warning이 발생함
    private static final long serialVersionUID = 1L;

    private final NAccountVO nAccountVO;

    public UserPrincipal(NAccountVO nAccountVO) {
        this.nAccountVO = nAccountVO;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();

        // Extract list of permissions (name)
        this.nAccountVO.getPermissionList().forEach(p -> {
            GrantedAuthority authority = new SimpleGrantedAuthority(p);
            authorities.add(authority);
        });

        // Extract list of roles (ROLE_name)
        this.nAccountVO.getRoleList().forEach(p -> {
            GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + p);
            authorities.add(authority);
        });

        return authorities;
    }

    // pw
    @Override
    public String getPassword() {
        return this.nAccountVO.getAccountPassword();
    }

    // id
    @Override
    public String getUsername() {
        return this.nAccountVO.getAccountUserId();
    }

    // 계정 만료 여부
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    // 계정 잠김 여부
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    // 패스워드 만료 여부
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    // 계정 활성 여부 (활성 : true, 비활성 : false)
    @Override
    public boolean isEnabled() {
        return nAccountVO.isActive();
    }

    // 계정 정보 추가 Getter
    public Long getAccountId() {
        return nAccountVO.getAccountId();
    }

    public String getAccountUserNm() {
        return nAccountVO.getAccountUserNm();
    }

    public String getAccountEmail() {
        return nAccountVO.getAccountEmail();}

    public String getDevCheck() {
        return nAccountVO.getDevCheck();
    }
}
