package com.skilldistillery.sdelp.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.Topic;

@Transactional
@Service
public class TopicDAOJpaImpl implements TopicDAO {
	
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Topic> findTopicsBySearchTerm(String keyword) {
		String jpql = "select t from Topic t where t.title like :string";
		List<Topic> topics = em.createQuery(jpql, Topic.class).setParameter("string", "%" + keyword + "%").getResultList();
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
		em.flush();
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

}
