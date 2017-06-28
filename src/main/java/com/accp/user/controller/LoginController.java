package com.accp.user.controller;


import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.accp.user.model.User;
import com.accp.user.service.UserService;

@Controller
@SessionAttributes("loginUser")
public class LoginController {
	@Resource
	private UserService userService;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String login(@ModelAttribute User user) {
		return "pages/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public @ResponseBody
	Object login(@ModelAttribute User user, HttpSession httpSession) {
		User u = userService.login(user.getUserName(), user.getPwd());
		if (u != null) {
			httpSession.setAttribute("loginUser", u);
			return "1";
		} else{
			return "3";
		}
			
	}

	@RequestMapping("/logout")
	public String logout(Model model, HttpSession session) throws IOException {
		model.asMap().remove("loginUser");
		session.invalidate();
		return "pages/login";
	}

}
