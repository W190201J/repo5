package com.wander.manifold.controller;

import com.wander.manifold.pojo.User;
import com.wander.manifold.service.IUserService;
import com.wander.manifold.utils.KemingCodeUtil;
import com.wander.manifold.utils.MailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/manifold")
public class UserController {

    //Redis操作Template
    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    //keming加密-密钥
    @Value("${keming.secretKey}")
    private String kmSecretKey;

    //用户服务层
    @Resource(name = "userService")
    private IUserService userService;

    /**
     * 登录
     * @param email
     * @param password
     * @return
     */
    @GetMapping("/user")
    public ResponseEntity<?> login(String email, String password) {
        User user = userService.queryByEmailPsw(email, password);
        if(user.getStatus()==1){
            return new ResponseEntity<User>(user, HttpStatus.OK);
        }else{
            return new ResponseEntity<Integer>(0, HttpStatus.UNAUTHORIZED);
        }
    }

    /**
     * 注册
     * @param email
     * @param username
     * @param password
     * @return
     */
    @PostMapping("/user")
    public ResponseEntity<?> register(String email, String username, String password) {
        User user = new User();
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        user.setJoinTime(new Date());

        //生成随机数
        String userCode = String.valueOf((int) (Math.random() * 100000));
        //保存激活码到Redis，有效时间30分钟
        ValueOperations<String, Object> value = redisTemplate.opsForValue();
        value.set(user.getEmail(), userCode, 5, TimeUnit.MINUTES);
        //user对象暂时保存到Redis，失效时间30分钟
        value.set(user.getEmail() + "_info", user, 5, TimeUnit.MINUTES);

        String activationCode = KemingCodeUtil.encode(user.getEmail() + "#div#" + userCode, kmSecretKey);

        try {
            MailUtil.sendMail(user.getEmail(), activationCode);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return new ResponseEntity<String>(user.getEmail(), HttpStatus.OK);
    }

}
