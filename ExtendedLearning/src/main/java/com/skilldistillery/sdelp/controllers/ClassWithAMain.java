package com.skilldistillery.sdelp.controllers;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.skilldistillery.sdelp.entities.User;

public class ClassWithAMain {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("SDELP");
	
	public static void main(String[] args) {
		EntityManager em = emf.createEntityManager();
		String jpql = "select user from User user where user.username = :username and user.password"
				+ " = :password";
		String username = "admin";
		String password = "admin";
		
		List<User> users = em.createQuery(jpql, User.class)
				.setParameter("username", username)
				.setParameter("password", password)
				.getResultList();
		
		
		System.out.println("***************************");
		System.out.println("***************************");
		System.out.println("***************************");
		System.out.println(users.get(0).getLogs().get(0));
		System.out.println("***************************");
		System.out.println("***************************");
		System.out.println("***************************");
		
		em.close();
		emf.close();
		
		
		
	}

}
