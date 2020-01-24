package com.skilldistillery.sdelp.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.sdelp.data.UserProfileDAO;
import com.skilldistillery.sdelp.data.UserProfileDAOJpaImpl;
import com.skilldistillery.sdelp.entities.Profile;

@Controller
public class UserController {

	@Autowired
	UserProfileDAO userProfileDao = new UserProfileDAOJpaImpl();

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
			@RequestParam String about
			) {
		
		
		
		
		
		return "user_home";
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
