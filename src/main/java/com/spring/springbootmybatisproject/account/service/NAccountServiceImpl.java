package com.spring.springbootmybatisproject.account.service;

import com.spring.springbootmybatisproject.account.model.NAccountVO;
import com.spring.springbootmybatisproject.account.repository.NAccountMapper;
import com.spring.springbootmybatisproject.security.model.domain.UserPrincipal;
import com.spring.springbootmybatisproject.security.model.entity.Role;
import com.spring.springbootmybatisproject.security.repository.RoleMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class NAccountServiceImpl implements NAccountService {

    private final NAccountMapper nAccountMapper;
    private final PasswordEncoder passwordEncoder;
    private final RoleMapper roleMapper;

    public NAccountServiceImpl(NAccountMapper nAccountMapper, PasswordEncoder passwordEncoder, RoleMapper roleMapper) {
        this.nAccountMapper = nAccountMapper;
        this.passwordEncoder = passwordEncoder;
        this.roleMapper = roleMapper;
    }

    /* 회원가입 */
    @Override
    public void registerSignUp(NAccountVO nAccountVO) {
        // 패스워드 암호화 처리

        //security 암호화
        String pw = nAccountVO.getAccountPassword();
        String enPw = passwordEncoder.encode(pw);

        boolean matchResult = passwordEncoder.matches(pw, enPw);
        log.info("pw: {}\nenPw: {}\nmatchResult: {}", pw, enPw, matchResult);
        nAccountVO.setAccountPassword(enPw);
        nAccountVO.setActive(1);

        Role role = roleMapper.getRoleInfo("USER");
        nAccountVO.setRole(role.getRole());

        nAccountMapper.saveSignUp(nAccountVO);

    }

    /* 아이디 중복체크 - 요청받은 아이디 갯수 확인 */
    @Override
    public Integer userIdOverlapCnt(String accountUserId) {
        Integer overlapCnt = nAccountMapper.findByDuplicateUserIdCnt(accountUserId);

        int overlapResult;
        if (overlapCnt > 0) {
            overlapResult = 0; // 중복 아이디 존재
        } else {
            overlapResult = 1; // 중복 아이디 없음
        }

        return overlapResult;
    }

    /* 로그인 정보*/
    @Override
    public NAccountVO getAccount(NAccountVO nAccountVO) {

        NAccountVO accountResult = nAccountMapper.findByAccount(nAccountVO);

        try {
            // 패스워드 복호화 처리
            // security 암호화
            String rawPw = nAccountVO.getAccountPassword();
            String encodedPw = accountResult.getAccountPassword();
            boolean matchResult = passwordEncoder.matches(rawPw, encodedPw); // req 패스워드와 db에 저장된 패스워드 비교
            log.info("Pw: {}\nEnPw: {}\nMatchResult: {}", rawPw, encodedPw, matchResult);

            if (!matchResult) {
                accountResult.setAccountPassword(null);
            }
        } catch (NullPointerException e) {
            return accountResult;
        }


        // 권한앞에 "ROLE_" 추가
//        String addRole = "ROLE_" + accountResult.getRole();
//        accountResult.setRole(addRole);
//        log.info("ROLE: {}", addRole);
        log.info("ROLE: {}", accountResult.getRole());

        return accountResult;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        NAccountVO user = nAccountMapper.findUserByLoginId(username);
        return new UserPrincipal(user);
    }

}
