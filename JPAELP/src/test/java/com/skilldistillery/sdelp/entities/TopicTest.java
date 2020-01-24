package com.skilldistillery.sdelp.entities;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDateTime;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class TopicTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Topic topic;

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
		topic = em.find(Topic.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		topic = null;
		em.close();
	}
	
	@Test
	@DisplayName("Test Topic entity mapping")
	void test1() {
		assertNotNull(topic);
		assertEquals("test", topic.getTitle());
	}
	
	@DisplayName("Testing topic list for resource")
	@Test
	void test2() {
		assertTrue(topic.getResources().size() > 0);
		assertEquals("www.google.com", topic.getResources().get(0).getResourceUrl());
	}
	
	@DisplayName("Testing topic list for log")
	@Test
	void test3() {
		assertTrue(topic.getLogs().size() > 0);
		assertEquals(LocalDateTime.of(2020, 01, 23, 00, 00, 00), topic.getLogs().get(0).getTimeStamp());
	}

	@DisplayName("Testing topic list for topic_comment")
	@Test
	void test4() {
		assertTrue(topic.getTopicComments().size() > 0);
		assertEquals("test", topic.getTopicComments().get(0).getTitle());
	}
	
	
	@DisplayName("Testing topic list for image")
	@Test
	void test5() {
		assertTrue(topic.getImages().size() > 0);
		assertEquals("www.google.com", topic.getResources().get(0).getResourceUrl());
	}
}
