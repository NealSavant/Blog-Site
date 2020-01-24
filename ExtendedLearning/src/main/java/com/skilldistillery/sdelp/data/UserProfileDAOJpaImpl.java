package com.skilldistillery.sdelp.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sdelp.entities.Profile;
import com.skilldistillery.sdelp.entities.User;

@Transactional
@Service
public class UserProfileDAOJpaImpl implements UserProfileDAO {
	
	@PersistenceContext
	private EntityManager em;
	

	@Override
	public User getUserByUsernamePassword(String username, String password) {
		User user = null;
		String jpql = "select user from User user where username = :username"
				+ " and password = :password";
		user = em.createQuery(jpql, User.class).setParameter("username", username)
				.setParameter("password", password).getResultList().get(0);
		return user;
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public User updateUser(User user) {
		User managedUser = em.find(User.class, user.getId());
		managedUser.setUsername(user.getUsername());
		managedUser.setPassword(user.getPassword());
		managedUser.setRole(user.getRole());
		managedUser.setActive(user.getActive());
		return managedUser;
	}
	
	@Override
	public Profile getProfileByUserUsernamePassword(String username, String password) {
		Profile profile = null;
		String jpql = "SELECT profile from Profile profile WHERE profile.user.username = :username"
				+ " AND profile.user.password = :password";
		profile = em.createQuery(jpql, Profile.class).setParameter("username", username)
				.setParameter("password", password).getResultList().get(0);
		return profile;
	}
	
	@Override
	public Profile createProfile(Profile profile) {
		em.persist(profile);
		return profile;
	}
	
	@Override
	public Profile updateProfile(Profile profile) {
		Profile managedProfile = em.find(Profile.class, profile.getId());
		managedProfile.setFirstName(profile.getFirstName());
		managedProfile.setLastName(profile.getLastName());
		managedProfile.setEmail(profile.getEmail());
		managedProfile.setJobTitle(profile.getJobTitle());
		managedProfile.setAbout(profile.getAbout());
		return managedProfile;
	}

}
