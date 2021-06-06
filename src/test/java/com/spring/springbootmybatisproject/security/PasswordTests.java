//package com.spring.springbootmybatisproject.security;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.security.crypto.password.PasswordEncoder;
//
///**
// * Created by berno579@gmail.com on 2021/06/06
// * Github : http://github.com/bee0113
// */
//
//@SpringBootTest
//public class PasswordTests {
//
//    @Autowired
//    private PasswordEncoder passwordEncoder;
//
//    /* sample output
//        enPw:: $2a$10$677xjXKHnJDdcbuWPOwGdux4.pTAfqoKZVC82M3iBZB9cHctr36NC
//        matchResult:true
//    */
//    @Test
//    public void testEncode() {
//        String password = "1111";
//
//        String enPw = passwordEncoder.encode(password);
//
//        System.out.println("enPw:: " + enPw);
//
//        boolean matchResult = passwordEncoder.matches(password, enPw);
//
//        System.out.println("matchResult:" + matchResult);
//
//    }
//}
