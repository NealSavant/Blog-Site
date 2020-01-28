package com.skilldistillery.sdelp.controllers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.sdelp.data.TopicDAO;
import com.skilldistillery.sdelp.data.TopicDAOJpaImpl;
import com.skilldistillery.sdelp.entities.Topic;
import com.skilldistillery.sdelp.entities.TopicComment;

public class ClassWithAMain {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("SDELP");
	
	public static void main(String[] args) {
		EntityManager em = emf.createEntityManager();
		String jpql = "select tc from TopicComment tc where tc.topic = :topic";
		Topic firstTopic = em.find(Topic.class, 1);
		
		List<TopicComment> comments = em.createQuery(jpql, TopicComment.class).setParameter("topic", firstTopic).getResultList();
		
		
		System.out.println("***************************");
		System.out.println("***************************");
		System.out.println("***************************");
		System.out.println(comments.get(0));
		System.out.println("***************************");
		System.out.println("***************************");
		System.out.println("***************************");
		
		em.close();
		emf.close();
		
		
		
	}

}
