package com.skilldistillery.sdelp.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.sdelp.data.ImageDAO;
import com.skilldistillery.sdelp.data.ImageDAOJpaImpl;
import com.skilldistillery.sdelp.data.LogDAO;
import com.skilldistillery.sdelp.data.UserProfileDAO;
import com.skilldistillery.sdelp.data.UserProfileDAOJpaImpl;
import com.skilldistillery.sdelp.entities.Image;
import com.skilldistillery.sdelp.entities.Log;
import com.skilldistillery.sdelp.entities.Profile;
import com.skilldistillery.sdelp.entities.User;

@Controller
public class UserController {

	@Autowired
	UserProfileDAO userProfileDao = new UserProfileDAOJpaImpl();

	@Autowired
	ImageDAO imagedao = new ImageDAOJpaImpl();
	
	@Autowired
	LogDAO logdao;

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
			
			//get logs all the time to display for side bar article viewer
			List<Log> currentLogList = logdao.retrieveCurrentLogs(profile.getUser().getId());
			session.setAttribute("profile", profile);
			session.setAttribute("logs", profile.getUser().getLogs());
			session.setAttribute("logList", currentLogList);
			return "redirect:userHome.do";
		} else {
			return "redirect:showLogin.do";
		}
	}

	// attempt create account

	@RequestMapping(path = "createAccount.do", method = RequestMethod.POST)
	public String attemptCreateAccount(@RequestParam String username, @RequestParam String password,
			@RequestParam String firstName, @RequestParam String lastName, @RequestParam String email,
			@RequestParam String jobTitle, @RequestParam String about, @RequestParam String image, HttpSession session
			, Model model) {
		if (userProfileDao.checkIfUsernameAndEmailAreAvailable(username, email)) {
			User user = new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setRole("USER");
			userProfileDao.createUser(user); // backend handles profile and user table in one method
			Profile profile = new Profile();
			profile.setFirstName(firstName);
			profile.setLastName(lastName);
			profile.setEmail(email);
			profile.setJobTitle(jobTitle);
			profile.setAbout(about);
			Image newImage = new Image();
			//if user wants an image, else, give it skill distillery logo
			if(image == null || image == "") {
				newImage.setImageUrl("https://imgur.com/m7LFcq8.png");
			} else {
				newImage.setImageUrl(image);
			}
			
			imagedao.addImage(newImage);
			profile.setImage(newImage);
			profile.setUser(user);
			userProfileDao.createProfile(profile);
			session.setAttribute("profile", profile);
			session.removeAttribute("fail");
			return "redirect:userHome.do";
		} else {
			session.setAttribute("fail", true);
			return "redirect:showCreateAccount.do";
		}
	}

	@RequestMapping(path = "showUpdateAccount.do")
	public String showUpdateAccount() {
		return "create_account";
	}

	@RequestMapping(path = "updateAccount.do", method = RequestMethod.POST)
	public String attemptUpdateAccount(@RequestParam String username, @RequestParam String password,
			@RequestParam String firstName, @RequestParam String lastName, @RequestParam String email,
			@RequestParam String jobTitle, @RequestParam String about, @RequestParam String image, HttpSession session) {
		Profile profile = (Profile) session.getAttribute("profile");
		profile.getUser().setUsername(username);
		profile.getUser().setPassword(password);
		profile.setFirstName(firstName);
		profile.setLastName(lastName);
		profile.setEmail(email);
		profile.setJobTitle(jobTitle);
		profile.setAbout(about);
		Image newImage = new Image();
		//if user wants an image, else, give it skill distillery logo
		if(image == null || image == "") {
			newImage.setImageUrl("https://imgur.com/m7LFcq8.png");
		} else {
			newImage.setImageUrl(image);
		}
		imagedao.addImage(newImage);
		profile.setImage(newImage);
		userProfileDao.updateProfile(profile);
		session.setAttribute("profile", profile);
		return "user_home";
		// TODO: probably need to add a form error message here
	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("profile"); // remove profile from session
		return "redirect:home.do";
	}

	// show user homepage

	@RequestMapping(path = "userHome.do")
	public String showUserHome(HttpSession session) {
		session.setAttribute("profile", session.getAttribute("profile"));
		return "user_home";
	}

	// Allows User to be directed to create a post page

	@RequestMapping(path = "createPost.do")
	public String createPost() {
		return "create_content";
	}

	@RequestMapping(path = "showAdminPage.do")
	public String showAdminPage(Model model) {
		List<User> nonAdminUsers = userProfileDao.getAllNonAdminUsers();
		model.addAttribute("users", nonAdminUsers);
		return "admin_home";
	}

	@RequestMapping(path = "disableUser.do")
	public String disableUser(@RequestParam Integer uid, HttpSession session) {
		Profile adminCheck = (Profile) session.getAttribute("profile");
		if (adminCheck.getUser().getRole().equals("ADMIN")) {
			User userToDisable = userProfileDao.getUserById(uid);
			userToDisable.setActive(false);
			userProfileDao.updateUser(userToDisable);
			return "redirect:showAdminPage.do";
		} else {
			return "redirect:home.do";
		}
	}

	@RequestMapping(path = "enableUser.do")
	public String enableUser(@RequestParam Integer uid, HttpSession session) {
		Profile adminCheck = (Profile) session.getAttribute("profile");
		if (adminCheck.getUser().getRole().equals("ADMIN")) {
			User userToEnable = userProfileDao.getUserById(uid);
			userToEnable.setActive(true);
			userProfileDao.updateUser(userToEnable);
			return "redirect:showAdminPage.do";
		} else {
			return "redirect:home.do";
		}
	}
	
	@RequestMapping(path="showUser.do")
	public String showUser(@RequestParam("uid") Integer uid, Model model) {
		Profile showProfile = userProfileDao.getProfileByUserId(uid);
		model.addAttribute("otherProfile", showProfile);
		return "show_user";
	}
	
}
