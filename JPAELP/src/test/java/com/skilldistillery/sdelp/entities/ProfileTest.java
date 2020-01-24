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

class ProfileTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Profile profile;

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
		profile = em.find(Profile.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		profile = null;
		em.close();
	}

	@Test
	@DisplayName("Test Profile entity mapping")
	void test1() {
		assertNotNull(profile);
		assertEquals("test", profile.getFirstName());
		assertEquals("test", profile.getLastName());
		assertEquals("test@test.com", profile.getEmail());
	}

}
