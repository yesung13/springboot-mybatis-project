package com.spring.springbootmybatisproject.security;

import com.spring.springbootmybatisproject.account.model.NAccountVO;
import com.spring.springbootmybatisproject.account.repository.NAccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * Created by berno579@gmail.com on 2021/06/15
 * Github : http://github.com/bee0113
 */
@Service
public class UserPrincipalDetailsService implements UserDetailsService {

    @Autowired
    private NAccountMapper nAccountMapper;

    @Override
    public UserDetails loadUserByUsername(String accountUserId) throws UsernameNotFoundException {
        NAccountVO nAccountVO = this.nAccountMapper.findByAccountUserId(accountUserId);
        UserPrincipal userPrincipal = new UserPrincipal(nAccountVO);

        return userPrincipal;
    }
}
