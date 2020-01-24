package com.skilldistillery.sdelp.data;

import java.util.List;

import com.skilldistillery.sdelp.entities.Content;
import com.skilldistillery.sdelp.entities.Image;
import com.skilldistillery.sdelp.entities.Log;
import com.skilldistillery.sdelp.entities.Profile;
import com.skilldistillery.sdelp.entities.Resource;
import com.skilldistillery.sdelp.entities.Topic;
import com.skilldistillery.sdelp.entities.TopicComment;
import com.skilldistillery.sdelp.entities.User;

public interface SdelDao {
	
	User getUserByUsernamePassword(String username, String password);
	
	User createUser(User user);
	
	User updateUser(User user);
	
	Profile createProfile(Profile profile);
	
	Profile updateProfile(Profile profile);
	
	List<Topic> findTopicsBySearchTerm(String keyword);
	
	List<Topic> getAllTopics();
	
	Topic getTopicById(int id);
	
	Topic addTopic(Topic topic);
	
	Topic updateTopic(Topic topic);
	
	Resource addResource(Resource resource);
	
	Resource updateResource(Resource resource);
	
	Content addContent(Content content);
	
	Content updateContent(Content content);
	
	Image addImage(Image image);
	
	Log writeLog(Log log);
	
	TopicComment addTopicComment(TopicComment topicComment);
	
	TopicComment updateTopicComment(TopicComment topicComment);
	
}
