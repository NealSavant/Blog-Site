package com.skilldistillery.sdelp.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.TopicComment;

@Transactional
@Service
public class TopicCommentDAOJpaImpl implements TopicCommentDAO {

	@PersistenceContext
	private EntityManager em;
	
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
