//package com.spring.springbootmybatisproject.securitydemo;
//
//import com.spring.springbootmybatisproject.securitydemo.model.UserEntity;
//import com.spring.springbootmybatisproject.securitydemo.repository.UserRepository;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import java.util.Arrays;
//
///**
// * Created by berno579@gmail.com on 2021/06/06
// * Github : http://github.com/bee0113
// */
//@Service
//public class BackedLoginService implements UserDetailsService {
//
//    private final UserRepository repository;
//
//    public BackedLoginService(UserRepository repository) {
//        this.repository = repository;
//    }
//
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        UserEntity user = repository.findByName(username);
//
//        return new User(user.getName(), user.getPassword(), Arrays.asList(new SimpleGrantedAuthority(user.getRole())));
//    }
//}
