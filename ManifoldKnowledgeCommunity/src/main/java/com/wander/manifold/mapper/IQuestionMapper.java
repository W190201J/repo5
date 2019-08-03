package com.wander.manifold.mapper;

import com.wander.manifold.pojo.Question;
import org.springframework.stereotype.Repository;

/**
 * Created by 胥珂铭 on 2019/8/2.
 */

@Repository("questionMapper")
public interface IQuestionMapper {

    Integer insert(Question question);

    Integer insertRelation(Long topicId,Long questionId);

    Question queryByTitle(String title);

}
