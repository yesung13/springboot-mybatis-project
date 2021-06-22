package com.spring.springbootmybatisproject.security;

import com.spring.springbootmybatisproject.account.model.NAccountVO;
import com.spring.springbootmybatisproject.account.repository.NAccountMapper;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
public class UserPrincipalDetailsService implements UserDetailsService {

    @Autowired
    private NAccountMapper nAccountMapper;

    @Override
    public UserDetails loadUserByUsername(String accountUserId) throws UsernameNotFoundException {
        NAccountVO nAccountVO = this.nAccountMapper.findByAccountUserId(accountUserId);

        log.info("[Login Info] :: {}", nAccountVO.toString());

        // 사용자 정보 없으면 null 처리
        if (nAccountVO.getAccountUserId() == null) {
            log.info("[Login Info] :: 계정 정보 없음");
            return null;
        } else if (!nAccountVO.isActive() && nAccountVO.getDelYn().equals("Y")){
            log.info("[Login Info] :: USERID: {} 삭제된 계정", nAccountVO.getAccountUserId());
        }

        UserPrincipal userPrincipal = new UserPrincipal(nAccountVO);
        return userPrincipal;
    }
}
