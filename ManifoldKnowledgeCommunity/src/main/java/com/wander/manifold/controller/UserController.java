package com.wander.manifold.controller;

import com.wander.manifold.pojo.User;
import com.wander.manifold.service.IUserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("/manifold")
public class UserController {

    @Resource(name = "userService")
    private IUserService userService;

    @GetMapping("/login")
    public ResponseEntity<?> login(String email,String password){
        User user=userService.queryByEmailPsw(email,password);
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }

}
