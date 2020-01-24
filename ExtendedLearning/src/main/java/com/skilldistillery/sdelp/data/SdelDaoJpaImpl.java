package com.skilldistillery.sdelp.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.Content;
import com.skilldistillery.sdelp.entities.Image;
import com.skilldistillery.sdelp.entities.Log;
import com.skilldistillery.sdelp.entities.Profile;
import com.skilldistillery.sdelp.entities.Resource;
import com.skilldistillery.sdelp.entities.Topic;
import com.skilldistillery.sdelp.entities.TopicComment;
import com.skilldistillery.sdelp.entities.User;


@Transactional
@Service
public class SdelDaoJpaImpl implements SdelDao {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User getUserByUsernamePassword(String username, String password) {
		User user = null;
		String jpql = "select user from User user where username = :username"
				+ " and password = :password";
		user = em.createQuery(jpql, User.class).setParameter("username", username)
				.setParameter("password", password).getResultList().get(0);
		return user;
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public User updateUser(User user) {
		User managedUser = em.find(User.class, user.getId());
		managedUser.setUsername(user.getUsername());
		managedUser.setPassword(user.getPassword());
		managedUser.setRole(user.getRole());
		managedUser.setActive(user.getActive());
		return managedUser;
	}
	
	@Override
	public Profile createProfile(Profile profile) {
		em.persist(profile);
		return profile;
	}
	
	@Override
	public Profile updateProfile(Profile profile) {
		Profile managedProfile = em.find(Profile.class, profile.getId());
		managedProfile.setFirstName(profile.getFirstName());
		managedProfile.setLastName(profile.getLastName());
		managedProfile.setEmail(profile.getEmail());
		managedProfile.setJobTitle(profile.getJobTitle());
		managedProfile.setAbout(profile.getAbout());
		return managedProfile;
	}

	@Override
	public List<Topic> findTopicsBySearchTerm(String keyword) {
		String jpql = "select t from Topic t where t.title like '%:string%'";
		List<Topic> topics = em.createQuery(jpql, Topic.class).setParameter("string", keyword).getResultList();
		return topics;
	}

	@Override
	public List<Topic> getAllTopics() {
		String jpql = "select t from Topic t";
		List<Topic> topics = em.createQuery(jpql, Topic.class).getResultList();
		return topics;
	}

	@Override
	public Topic getTopicById(int id) {
		Topic topic = em.find(Topic.class, id);
		return topic;
	}

	@Override
	public Topic addTopic(Topic topic) {
		em.persist(topic);
		return topic;
	}

	@Override
	public Topic updateTopic(Topic topic) {
		Topic managedTopic = em.find(Topic.class, topic.getId());
		managedTopic.setTitle(topic.getTitle());
		managedTopic.setActive(topic.getActive());
		// add in list updates?
		return managedTopic;
	}

	@Override
	public Resource addResource(Resource resource) {
		em.persist(resource);
		return resource;
	}

	@Override
	public Resource updateResource(Resource resource) {
		Resource managedResource = em.find(Resource.class, resource.getId());
		managedResource.setTitle(resource.getTitle());
		managedResource.setResourceUrl(resource.getResourceUrl());
		managedResource.setActive(resource.getActive());
		return managedResource;
	}

	@Override
	public Content addContent(Content content) {
		em.persist(content);
		return content;
	}

	@Override
	public Content updateContent(Content content) {
		Content managedContent = em.find(Content.class, content.getId());
		managedContent.setContent(content.getContent());
		managedContent.setActive(content.getActive());
		return managedContent;
	}

	@Override
	public Image addImage(Image image) {
		em.persist(image);
		return image;
	}

	@Override
	public Log writeLog(Log log) {
		em.persist(log);
		return log;
	}

	@Override
	public TopicComment addTopicComment(TopicComment topicComment) {
		em.persist(topicComment);
		return topicComment;
	}

	@Override
	public TopicComment updateTopicComment(TopicComment topicComment) {
		TopicComment managedTopicComment = em.find(TopicComment.class, topicComment.getId());
		managedTopicComment.setTitle(topicComment.getTitle());
		managedTopicComment.setContent(topicComment.getContent());
		return managedTopicComment;
	}

}
