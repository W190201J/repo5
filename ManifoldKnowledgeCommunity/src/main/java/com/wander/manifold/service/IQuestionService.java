package com.wander.manifold.service;

import com.wander.manifold.pojo.Question;

/**
 * Created by 胥珂铭 on 2019/8/2.
 */
public interface IQuestionService {

    Integer addQuestion(Question question);

    Integer addRelation(Long topicId,Long questionId);

    Question queryByTitle(String title);

}
