package com.wander.service;


import com.wander.entity.User;
import com.wander.mapper.UserMapper;
import com.wander.util.MyUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private JedisPool jedisPool;
    //登录
    public Map<String,Object> login(String email, String password, HttpServletResponse response){
        Map<String,Object> map=new HashMap<String,Object>();
        Integer userId=userMapper.selectUserIdByEmailAndPassword(email, MyUtil.md5(password));
        if(userId==null){
            map.put("error","用户名或密码错误");
            return map;
        }
        Integer state=userMapper.selectStateByUserId(userId);
        if(state!=1){
            map.put("error","账号还没有激活，傻逼");
            return map;
        }
        //设置登录cookie
        String loginToken=MyUtil.createRandomCode();
        Cookie cookie=new Cookie("loginToken",loginToken);
        cookie.setPath("/");
        cookie.setMaxAge(60 * 60 * 24 * 30);
        response.addCookie(cookie);
        //将token，userId存入redistribution，并设置过期时间
        Jedis jedis = jedisPool.getResource();
        jedis.set(loginToken,userId.toString(),"NX","EX",60 * 60 * 24 * 30);
        jedisPool.returnResource(jedis);

        //将用户信息返回,存入localStorage
        User user=userMapper.selectUserInfoByUserId(userId);
        user.setUid(userId);
        map.put("userInfo",user);
        return map;
    }
}
