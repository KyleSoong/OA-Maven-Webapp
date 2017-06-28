package com.accp.common;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.accp.user.model.User;
@Controller
public class CommonController {
	
	@RequestMapping("/")
	public String CommonJump(HttpSession httpSession){
		User u = (User)httpSession.getAttribute("loginUser");
		if (u == null)
			return "redirect:/index";
		return "redirect:/pages/index.jsp";
	}
}
