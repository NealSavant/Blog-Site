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


@Transactional
@Service
public class SdelDaoJpaImpl implements SdelDao {
	
	@PersistenceContext
	private EntityManager em;


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





}
