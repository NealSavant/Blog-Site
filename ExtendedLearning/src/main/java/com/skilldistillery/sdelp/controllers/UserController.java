package com.skilldistillery.sdelp.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.sdelp.data.ImageDAO;
import com.skilldistillery.sdelp.data.ImageDAOJpaImpl;
import com.skilldistillery.sdelp.data.UserProfileDAO;
import com.skilldistillery.sdelp.data.UserProfileDAOJpaImpl;
import com.skilldistillery.sdelp.entities.Image;
import com.skilldistillery.sdelp.entities.Profile;
import com.skilldistillery.sdelp.entities.User;

@Controller
public class UserController {

	@Autowired
	UserProfileDAO userProfileDao = new UserProfileDAOJpaImpl();
	
	@Autowired
	ImageDAO imagedao = new ImageDAOJpaImpl();

	@RequestMapping(path = { "/", "home.do" })
	public String home() {
		return "index";
	}

	// show login page to user

	@RequestMapping(path = "showLogin.do")
	public String showLogin() {
		return "login";
	}
	
	// show create account page to user
	
	@RequestMapping(path = "showCreateAccount.do")
	public String showCreateAccount() {
		return "create_account";
	}

	// attempt login

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String attemptLogin(@RequestParam String username, @RequestParam String password, HttpSession session) {
		Profile profile = userProfileDao.getProfileByUserUsernamePassword(username, password);

		if (profile != null) {
			// need to add the profile
			session.setAttribute("profile", profile);
			return "redirect:userHome.do";
		} else {

			return "redirect:showLogin.do";
		}
	}
	
	// attempt create account
	
	@RequestMapping(path="createAccount.do", method = RequestMethod.POST)
	public String attemptCreateAccount(@RequestParam String username,
			@RequestParam String password,
			@RequestParam String firstName,
			@RequestParam String lastName,
			@RequestParam String email,
			@RequestParam String jobTitle,
			@RequestParam String about,
			HttpSession session
			) {
		if (userProfileDao.checkIfUsernameAndEmailAreAvailable(username, email)) {
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setRole("USER");
			userProfileDao.createUser(user);	//backend handles profile and user table in one method
			Profile profile = new Profile();
			profile.setFirstName(firstName);
			profile.setLastName(lastName);
			profile.setEmail(email);
			profile.setJobTitle(jobTitle);
			profile.setAbout(about);
			Image newImage = new Image();
			newImage.setImageUrl("https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwjCnL-ss53nAhUHAZ0JHbhJCmcQjRx6BAgBEAQ&url=https%3A%2F%2Fwww.amazon.com%2FMunchkin-White-Safety-Bath-Ducky%2Fdp%2FB000GUZC2A&psig=AOvVaw1ZQGH-0l0EMx_BFKI6ZQiX&ust=1579995311416096");
			imagedao.addImage(newImage);
			profile.setImage(newImage);
			profile.setUser(user);
			userProfileDao.createProfile(profile);
			session.setAttribute("profile", profile);
			return "user_home";
		} else {
			// probably need to add a form error message here
			return "redirect:showCreateAccount.do";
		}		
	}
	
	@RequestMapping(path="showUpdateAccount.do")
	public String showUpdateAccount(){
		return "updateAccount";
	}
	
	@RequestMapping(path="updateAccount.do", method = RequestMethod.POST)
	public String attemptUpdateAccount(@RequestParam String username,
			@RequestParam String password,
			@RequestParam String firstName,
			@RequestParam String lastName,
			@RequestParam String email,
			@RequestParam String jobTitle,
			@RequestParam String about,
			HttpSession session
			) {
		if (userProfileDao.checkIfUsernameAndEmailAreAvailable(username, email)) {
			Profile profile = (Profile) session.getAttribute("profile");
			profile.getUser().setUsername(username);
			profile.getUser().setPassword(password);
			profile.setFirstName(firstName);
			profile.setLastName(lastName);
			profile.setEmail(email);
			profile.setJobTitle(jobTitle);
			profile.setAbout(about);
			userProfileDao.updateProfile(profile);
			session.setAttribute("profile", profile);
			return "user_home";
		} else {
			// probably need to add a form error message here
			return "redirect:showUpdateAccount.do";
		}		
	}
	
	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("profile");	//remove profile from session
		return "redirect:home.do";
	}
	
	// show user homepage
	
	@RequestMapping(path="userHome.do")
	public String showUserHome(HttpSession session) {
		session.setAttribute("profile", session.getAttribute("profile"));
		return "user_home";
	}
	

}
