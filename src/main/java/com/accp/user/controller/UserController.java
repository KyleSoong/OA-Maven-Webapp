package com.accp.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.accp.user.model.User;
import com.accp.user.service.UserService;
import com.accp.utils.Page;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;
	Page page = new Page();

	@RequestMapping(value="/userinfo",method=RequestMethod.GET)
	public String userInfo(ModelMap map,HttpSession session) {
		map.addAttribute("user",userService.getUserById(((User)session.getAttribute("loginUser")).getId()).get(0));		
		return "pages/userinfo";
	}
	@RequestMapping(value="/userinfo",method=RequestMethod.POST)
	public String userUpdate(@ModelAttribute User user,ModelMap map) {
		userService.update(user);
		return "pages/userinfo";
	}

	@RequestMapping("/adduser")
	public @ResponseBody String adduser(@ModelAttribute User user) {
		Integer id = userService.register(user);
		if (id!=null) {
			return "1";
		}else{
			return "添加失败！";
		}
	}

	@RequestMapping("/skip/{page}")
	public String skip(@PathVariable("page") String page) {
		return "pages/" + page;
	}
	
	@RequestMapping("/mgr")
	public  String mgr(Model model, HttpSession httpSession) {
		User u = (User) httpSession.getAttribute("loginUser");
		if (u.getRole() != "管理员") return null;
//		User user = 
		return "ok";
	}
}
