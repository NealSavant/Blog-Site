package com.skilldistillery.sdelp.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class TopicCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TopicComment topicComment;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("SDELP");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		topicComment = em.find(TopicComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		topicComment = null;
		em.close();
	}

//	@Disabled
	@Test
	@DisplayName("Test Content entity mapping")
	void test1() {
		assertEquals("test", topicComment.getTitle());
		assertTrue(topicComment.getActive());
	}
}
