package com.wander.manifold.service;

import com.wander.manifold.pojo.Topic;

import java.util.List;

/**
 * Created by 胥珂铭 on 2019/7/31.
 */
public interface ITopicService {

    Topic queryRoot();

    Topic queryAncestor(Long topicId);

    List<Topic> querySonTopic(Long topicId);

    Integer addTopic(Topic topic);

}
