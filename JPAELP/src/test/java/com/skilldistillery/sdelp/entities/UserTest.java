package com.skilldistillery.sdelp.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.LocalDateTime;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		user = null;
		em.close();
	}

	@Test
	@DisplayName("Test user entity mapping")
	void test1() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
	}
	
	@DisplayName("Testing User list for log")
	@Test
	void test2() {
		assertTrue(user.getLogs().size() > 0);
		assertEquals(LocalDateTime.of(2020, 01, 23, 00, 00, 00), user.getLogs().get(0).getTimeStamp());
	}
	
	@DisplayName("Testing User list for log")
	@Test
	void test3() {
		assertTrue(user.getTopicComments().size() > 0);
		assertEquals("test", user.getTopicComments().get(0).getTitle());
	}
}
