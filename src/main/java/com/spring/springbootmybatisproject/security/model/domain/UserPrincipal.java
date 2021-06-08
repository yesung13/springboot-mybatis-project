package com.spring.springbootmybatisproject.security.model.domain;

import com.spring.springbootmybatisproject.account.model.NAccountVO;
import lombok.Getter;
import lombok.ToString;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Arrays;
import java.util.Collection;

@ToString
@Getter

public class UserPrincipal implements UserDetails {

    private NAccountVO user;

    public UserPrincipal(NAccountVO user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Arrays.asList(new UserGrant());
    }

    @Override
    public String getPassword() {
//        return user.getPassword();
        return user.getAccountPassword();
    }

    @Override
    public String getUsername() {
//        return user.getUserName();
        return user.getAccountUserNm();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return user.getActive() == 1;
    }

    public String getId() {
//        return user.getLoginId();
        return user.getAccountUserId();
    }

    public String getName() {
//        return user.getUserName();
        return user.getAccountUserNm();
    }
}
