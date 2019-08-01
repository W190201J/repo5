package com.wander.manifold.mapper;

import com.wander.manifold.pojo.Topic;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 胥珂铭 on 2019/7/31.
 */

@Repository("topicMapper")
public interface ITopicMapper {

    Topic queryRoot();

    Topic queryAncestor(Long topicId);

    List<Topic> querySonTopic(Long topicId);

    Integer insert(Topic topic);

}
