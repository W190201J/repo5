package com.wander.controller;

import com.wander.service.UserService;
import com.wander.util.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
@RequestMapping("/")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/toLogin")
    //跳转到toLogin页面
    public String toLogin() {
        return "toLogin";
    }

    @RequestMapping("/login")
    @ResponseBody
    public Response login(String email, String password, HttpServletResponse response) {
        //System.out.println(email);
        //System.out.println(password);
        Map<String, Object> map = userService.login(email, password, response);
        if (map.get("error") == null) {
            return new Response(0, "", map);
        } else {
            return new Response(1, map.get("error").toString());
        }
    }
}
