package com.skilldistillery.sdelp.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.Topic;
import com.skilldistillery.sdelp.entities.TopicComment;

@Transactional
@Service
public class TopicCommentDAOJpaImpl implements TopicCommentDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public TopicComment addTopicComment(TopicComment topicComment) {
		em.persist(topicComment);
		em.flush();
		return topicComment;
	}

	@Override
	public TopicComment updateTopicComment(TopicComment topicComment) {
		TopicComment managedTopicComment = em.find(TopicComment.class, topicComment.getId());
		managedTopicComment.setTitle(topicComment.getTitle());
		managedTopicComment.setContent(topicComment.getContent());
		return managedTopicComment;
	}
	
	public List<TopicComment> getAllCommentsForTopic(Topic topic){
		String jpql = "select tc from TopicComment tc where tc.topic = :topic ";
		
		List<TopicComment> comments = em.createQuery(jpql, TopicComment.class).setParameter("topic", topic).getResultList();
		
		return comments;
	}
	
}
