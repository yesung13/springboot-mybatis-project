//package com.spring.springbootmybatisproject.securitydemo;
//
//import com.spring.springbootmybatisproject.securitydemo.model.UserEntity;
//import com.spring.springbootmybatisproject.securitydemo.repository.UserRepository;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//
///**
// * Created by berno579@gmail.com on 2021/06/05
// * Github : http://github.com/bee0113
// */
//@Controller
//@Slf4j
//public class SecurityDemoController {
//
//    private final UserRepository repository;
//
//    private final PasswordEncoder passwordEncoder; // 패스워드 저장 시 인코딩된 암호가 db에 저장됨
//
//    public SecurityDemoController(UserRepository repository, PasswordEncoder passwordEncoder) {
//        this.repository = repository;
//        this.passwordEncoder = passwordEncoder;
//    }
//
//
//    @GetMapping("/login") //.loginPage("LOGIN_PAGE")에서 설정한 LOGIN_PAGE와 일치해야 한다.
//    public String getLoginForm() {
//        return "securityDemo/loginPage";
//    }
//
//    @GetMapping("/signUp")
//    public String getSignUp() {
//        UserEntity user = new UserEntity();
//        user.setName("neo");
//        user.setPassword(passwordEncoder.encode("1234"));
//        user.setRole("USER");
//        repository.save(user);
//        return "redirect:/login";
//    }
//
//    @GetMapping("/index")
//    public String getIndex() {
//        return "securityDemo/indexx";
//    }
//
////    @PostMapping("/doLogin")
////    public String signUp(@RequestParam String name,
////                         @RequestParam String password) {
//////        UserEntity user = new UserEntity();
//////                user.setName("neo");
//////                user.setPassword(passwordEncoder.encode("1234"));
//////                user.setRole("USER");
////
////        UserEntity user = new UserEntity();
////        user.setName(name);
////        user.setPassword(passwordEncoder.encode(password));
////        user.setRole("USER");
////        repository.save(user);
////
////        return "redirect:/login";
////    }
//
//
//}
