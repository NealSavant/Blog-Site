package com.skilldistillery.sdelp.data;

import com.skilldistillery.sdelp.entities.Profile;
import com.skilldistillery.sdelp.entities.User;

public interface UserProfileDAO {
	
	User getUserByUsernamePassword(String username, String password);
	
	User createUser(User user);
	
	User updateUser(User user);
	
	Profile createProfile(Profile profile);
	
	Profile updateProfile(Profile profile);

}
