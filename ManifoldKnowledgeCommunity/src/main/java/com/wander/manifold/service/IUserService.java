package com.wander.manifold.service;

import com.wander.manifold.pojo.User;

public interface IUserService {
    public User queryByEmailPsw(String email, String password);
}
