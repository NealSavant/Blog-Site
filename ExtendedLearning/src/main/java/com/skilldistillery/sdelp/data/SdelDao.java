package com.skilldistillery.sdelp.data;

import java.util.List;

import com.skilldistillery.sdelp.entities.Content;
import com.skilldistillery.sdelp.entities.Image;
import com.skilldistillery.sdelp.entities.Log;
import com.skilldistillery.sdelp.entities.Resource;
import com.skilldistillery.sdelp.entities.Topic;
import com.skilldistillery.sdelp.entities.TopicComment;

public interface SdelDao {
	

	

	
	Resource addResource(Resource resource);
	
	Resource updateResource(Resource resource);
	
	Content addContent(Content content);
	
	Content updateContent(Content content);
	
	Image addImage(Image image);
	


	
}
