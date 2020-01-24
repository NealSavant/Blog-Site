package com.skilldistillery.sdelp.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

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

public class ContentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Content content;

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
		content = em.find(Content.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		content = null;
		em.close();
	}

	@Test
	@DisplayName("Test Content entity mapping")
	void test1() {
		assertEquals("test", content.getContent());
		assertEquals(LocalDateTime.of(2020, 01, 23, 00, 00, 00), content.getCreatedAt());
		assertEquals(LocalDateTime.of(2020, 01, 23, 00, 00, 00), content.getUpdatedAt());
	}
}
