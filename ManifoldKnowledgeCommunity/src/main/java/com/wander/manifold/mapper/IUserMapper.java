package com.wander.manifold.mapper;

import com.wander.manifold.pojo.User;
import org.springframework.stereotype.Repository;

@Repository("userMapper")
public interface IUserMapper {

    public User queryByEmailPsw(String email, String password);

}
