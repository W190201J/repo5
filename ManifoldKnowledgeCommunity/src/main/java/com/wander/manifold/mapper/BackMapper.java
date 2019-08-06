package com.wander.manifold.mapper;

import com.wander.manifold.pojo.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 *持久层
 */
@Repository
public interface BackMapper {
    //查询所有用户信息
    @Select("SELECT * FROM manifold_community.user_table limit 0, 10")
    List<User> queryAll();

    //分页查询
    @Select("SELECT * FROM manifold_community.user_table limit #{begin}, #{pagesize}")
    List<User> queryPage(@Param("begin") int begin, @Param("pagesize") int pagesize);

    List<User> query(Integer start,Integer size);

    List<User> queryblock(Integer start, Integer size);

    Integer count();

    Integer add(User user);

     Integer update(Long uid);

    Integer update2(Long uid);

}
