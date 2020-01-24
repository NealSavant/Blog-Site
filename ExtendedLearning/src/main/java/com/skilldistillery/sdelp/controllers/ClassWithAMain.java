package com.skilldistillery.sdelp.controllers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.sdelp.entities.Profile;

public class ClassWithAMain {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("SDELP");
	
	public static void main(String[] args) {
		EntityManager em = emf.createEntityManager();
		String jpql = "select profile from Profile profile where profile.user.username = :username and profile.user.password"
				+ " = :password";
		String username = "admin";
		String password = "admin";
		
		List<Profile> profiles = em.createQuery(jpql, Profile.class)
				.setParameter("username", username)
				.setParameter("password", password)
				.getResultList();
		
		
		System.out.println("***************************");
		System.out.println("***************************");
		System.out.println("***************************");
		System.out.println(profiles.get(0).);
		System.out.println("***************************");
		System.out.println("***************************");
		System.out.println("***************************");
		
		em.close();
		emf.close();
		
		
		
	}

}
