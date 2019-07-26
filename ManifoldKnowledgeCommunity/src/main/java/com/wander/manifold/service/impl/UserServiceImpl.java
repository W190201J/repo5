package com.wander.manifold.service.impl;

import com.wander.manifold.mapper.IUserMapper;
import com.wander.manifold.pojo.User;
import com.wander.manifold.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserMapper userMapper;

    @Override
    public User queryByEmailPsw(String email, String password) {
        return userMapper.queryByEmailPsw(email, password);
    }
}
