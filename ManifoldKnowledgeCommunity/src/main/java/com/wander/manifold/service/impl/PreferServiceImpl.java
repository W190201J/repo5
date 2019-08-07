package com.wander.manifold.service.impl;

import com.wander.manifold.mapper.IPreferMapper;
import com.wander.manifold.pojo.Prefer;
import com.wander.manifold.service.IPreferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by 胥珂铭 on 2019/8/7.
 */
@Service("preferService")
public class PreferServiceImpl implements IPreferService {

    @Autowired
    private IPreferMapper preferMapper;

    @Override
    public Prefer queryByUidTopicId(Long uid, Long topicId) {
        return preferMapper.queryByUidTopicId(uid,topicId);
    }

    @Override
    public Integer insert(Long uid, Long topicId) {
        return preferMapper.insert(uid,topicId);
    }

    @Override
    public Integer update(Long uid, Long topicId) {
        return preferMapper.update(uid,topicId);
    }
}
