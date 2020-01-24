package com.skilldistillery.sdelp.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.Content;
import com.skilldistillery.sdelp.entities.Image;
import com.skilldistillery.sdelp.entities.Log;
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
	public List<Topic> findTopicsBySearchTerm(String keyword) {
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Topic updateTopic(Topic topic) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Resource addResource(Resource resource) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Resource updateResource(Resource resource) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Content addContent(Content content) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Content updateContent(Content content) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Image addImage(Image image) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Log writeLog(Log log) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TopicComment addTopicComment(TopicComment topicComment) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TopicComment updateTopicComment(TopicComment topicComment) {
		// TODO Auto-generated method stub
		return null;
	}

}
