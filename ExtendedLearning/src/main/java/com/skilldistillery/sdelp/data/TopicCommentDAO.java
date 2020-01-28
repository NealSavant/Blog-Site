package com.skilldistillery.sdelp.data;

import java.util.List;

import com.skilldistillery.sdelp.entities.Topic;
import com.skilldistillery.sdelp.entities.TopicComment;

public interface TopicCommentDAO {
	
	TopicComment addTopicComment(TopicComment topicComment);
	
	TopicComment updateTopicComment(TopicComment topicComment);

	List<TopicComment> getAllCommentsForTopic(Topic topic);

	TopicComment getTopicCommentById(int tid);

}
