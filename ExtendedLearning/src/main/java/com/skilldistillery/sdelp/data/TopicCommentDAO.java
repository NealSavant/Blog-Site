package com.skilldistillery.sdelp.data;

import com.skilldistillery.sdelp.entities.TopicComment;

public interface TopicCommentDAO {
	
	TopicComment addTopicComment(TopicComment topicComment);
	
	TopicComment updateTopicComment(TopicComment topicComment);

}
