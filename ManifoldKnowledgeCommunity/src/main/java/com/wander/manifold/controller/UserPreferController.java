package com.wander.manifold.controller;

import com.wander.manifold.pojo.Prefer;
import com.wander.manifold.service.IPreferService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * Created by 胥珂铭 on 2019/8/7.
 * 记录用户行为
 */
@RestController
@RequestMapping("/manifold")
public class UserPreferController {

    @Resource(name="preferService")
    private IPreferService preferService;

    @PostMapping("/user/prefer")
    public void addPrefer(Long uid, Long topicId) {
        Prefer prefer=preferService.queryByUidTopicId(uid,topicId);
        if(prefer!=null){
            preferService.update(uid,topicId);
        }else{
            preferService.insert(uid,topicId);
        }
    }

}
