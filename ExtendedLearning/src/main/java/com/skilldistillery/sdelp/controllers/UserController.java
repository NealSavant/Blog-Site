package com.skilldistillery.sdelp.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.sdelp.data.SdelDao;
import com.skilldistillery.sdelp.data.SdelDaoJpaImpl;
import com.skilldistillery.sdelp.entities.User;

@Controller
public class UserController {

	@Autowired
	SdelDao dao = new SdelDaoJpaImpl();

	@RequestMapping(path = { "/", "home.do" })
	public String home() {
		return "index";
	}

	// show login page to user

	@RequestMapping(path = "showLogin.do")
	public String showLogin() {
		return "login";
	}

	// attempt login

	@RequestMapping(path = "login.do")
	public String attemptLogin(@RequestParam String username, @RequestParam String password, HttpSession session) {
		User user = dao.getUserByUsernamePassword(username, password);

		if (user != null) {
			// need to add the profile
			session.setAttribute("user", user);
			return "redirect:userHome.do";
		} else {

			return "redirect:showLogin.do";
		}
	}
	
	// show user homepage
	
	@RequestMapping(path="userHome.do")
	public String showUserHome(HttpSession session) {
		return "home";
	}

}
