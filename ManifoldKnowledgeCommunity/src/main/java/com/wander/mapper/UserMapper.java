package com.wander.mapper;

import com.wander.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    //登录检验
    Integer selectUserIdByEmailAndPassword(@Param("email") String email, @Param("password") String password);
    User selectUserInfoByUserId(@Param("userId") Integer userId);
    Integer selectStateByUserId(@Param("userId") Integer userId);
}
