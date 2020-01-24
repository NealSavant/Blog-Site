package com.skilldistillery.sdelp.data;

import com.skilldistillery.sdelp.entities.Content;
import com.skilldistillery.sdelp.entities.Log;
import com.skilldistillery.sdelp.entities.Topic;
import com.skilldistillery.sdelp.entities.TopicComment;
import com.skilldistillery.sdelp.entities.User;

public interface SdelDao {
	
	User getUserByUsernamePassword(String username, String password);
	
	User createUser(User user);
	
	User updateUser(User user);
	
	Topic findTopicsBySearchTerm(String keyword);
	
	Topic addTopic(Topic topic);
	
	Log writeLog(Log log);
	
	TopicComment addTopicComment(TopicComment topicComment);
	
	Content addContent(Content content);

}
