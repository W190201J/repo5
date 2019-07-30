package com.wander.manifold.service;

import com.wander.manifold.pojo.User;

public interface IUserService {

    User queryByEmailPsw(String email, String password);

    Integer activation(String email);

    Integer addUser(User user);
}
