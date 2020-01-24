package com.skilldistillery.sdelp.data;

import java.util.List;

import com.skilldistillery.sdelp.entities.Topic;

public interface TopicDAO {
	
	List<Topic> findTopicsBySearchTerm(String keyword);
	
	List<Topic> getAllTopics();
	
	Topic getTopicById(int id);
	
	Topic addTopic(Topic topic);
	
	Topic updateTopic(Topic topic);

}
