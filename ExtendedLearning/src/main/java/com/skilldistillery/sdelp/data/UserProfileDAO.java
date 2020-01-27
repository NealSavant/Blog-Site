package com.skilldistillery.sdelp.data;

import java.util.List;

import com.skilldistillery.sdelp.entities.Profile;
import com.skilldistillery.sdelp.entities.User;

public interface UserProfileDAO {
	
	User getUserByUsernamePassword(String username, String password);
	
	User createUser(User user);
	
	User updateUser(User user);
	
	Profile getProfileByUserUsernamePassword(String username, String password);
	
	Profile createProfile(Profile profile);
	
	Profile updateProfile(Profile profile);

	boolean checkIfUsernameAndEmailAreAvailable(String username, String email);

	List<User> getAllNonAdminUsers();

}
