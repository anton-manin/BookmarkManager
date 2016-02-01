package com.anton.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.anton.project.security.dao.UserDao;
import com.anton.project.security.domain.User;

@Controller
public class LoginController {
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView model = new ModelAndView("register");
		model.addObject("user", new User());
		
		return model;
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String register(@ModelAttribute User user) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));		
		user.setEnabled(true);
		
		System.out.println(user.getPassword());
		
		userDao.addUser(user, "USER");
		
		return "redirect:/";		
	}
}
