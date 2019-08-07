package com.wander.manifold.mapper;

import com.wander.manifold.pojo.Prefer;
import org.springframework.stereotype.Repository;

/**
 * Created by 胥珂铭 on 2019/8/7.
 */
@Repository("preferMapper")
public interface IPreferMapper {

    Prefer queryByUidTopicId(Long uid,Long topicId);

    Integer insert(Long uid,Long topicId);

    Integer update(Long uid,Long topicId);
}
