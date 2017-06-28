package com.accp.email.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.accp.email.model.Email;
import com.accp.email.service.EmailService;
import com.accp.user.model.User;
import com.accp.user.service.UserService;
import com.accp.utils.FileUtil;
import com.accp.utils.Page;

@Controller
@RequestMapping("/email")
public class EmailController {
	@Resource
	private EmailService emailService;
	@Resource
	private UserService userService;

	Page page = new Page();
	
	@RequestMapping(value="/send",method=RequestMethod.GET)
	public Object writeEmail(Model model){
		List<User> users = userService.getUserList();
		model.addAttribute("users",users);
		return "pages/writemail";
	}
	
	@RequestMapping(value="/send",method=RequestMethod.POST)
	public String sendEmail(@RequestParam(value = "attachFile",required = false) MultipartFile attachFile,@ModelAttribute Email email){
		//处理文件上传
		String fileUrl = FileUtil.upload(attachFile);
		if (attachFile.isEmpty()){
			email.setAttach("");
		}else{
			email.setAttach(fileUrl);
			}
		email.setDeleted(0);
		email.setIsread(0);
		email.setDelBySender(0);
		emailService.save(email);
		return "redirect:/email/sent?p=1";
	}
	
	@RequestMapping(value="/download")
	 public ModelAndView download(@RequestParam("attachFile") String attachFile,HttpServletRequest request,
				HttpServletResponse response ) throws Exception{
		FileUtil. download(request, response, attachFile);
		return null;
	 }  
	   
	  
	@RequestMapping(value="/inbox")
	public String inbox(int p, Model model, HttpSession httpSession){
		User u = (User)httpSession.getAttribute("loginUser");
		Email email = new Email();
		email.setToUser(u.getId());
		email.setDeleted(0);
		page.setPageSize(5);
		page.setCurrentPage(p);
		List<Email> mlist = emailService.getEmailPage(page,email);
		page.setPagedata(mlist);
		model.addAttribute("page",page);
		return "pages/inbox";
	}

	@RequestMapping(value="/trash")
	public String trash(int p, Model model, HttpSession httpSession){
		
		User u = (User)httpSession.getAttribute("loginUser");
		Email email = new Email();
		email.setToUser(u.getId());
		email.setDeleted(1);
		page.setPageSize(5);
		page.setCurrentPage(p);
		List<Email> mlist = emailService.getEmailPage(page,email);
		page.setPagedata(mlist);
		model.addAttribute("page",page);
		return "pages/trash";
	}
	
	@RequestMapping(value="/sent")
	public String sent(int p, Model model, HttpSession httpSession){
		User u = (User)httpSession.getAttribute("loginUser");
		Email email = new Email();
		email.setFromUser(u.getId());
		email.setDelBySender(0);
		page.setPageSize(5);
		page.setCurrentPage(p);
		List<Email> mlist = emailService.getEmailPage(page,email);
		page.setPagedata(mlist);
		model.addAttribute("page",page);
		return "pages/sent";
	}
	
	@RequestMapping(value="/read/{id}")
	public String read(@PathVariable int id, Model model, HttpSession httpSession){
		User u = (User)httpSession.getAttribute("loginUser");
		Email email = emailService.selectById(id);
		if(u.getId() == email.getToUser() && email.getIsread() == 0) {
			emailService.markRead(email.getId());
		}
		model.addAttribute("email",email);
		return "pages/emaildetail";
	}
	
/*	@RequestMapping("/selectByCondition")
	public @ResponseBody Object findByCondition(@ModelAttribute Email email){
		List<Email> result = emailService.selectByCondition(email);
		return result;
	}*/

	@RequestMapping("/deleteById/{id}")
	public @ResponseBody Object deleteById(@PathVariable("id") Integer id){
		//emailService.deleteById(id);
		return "ok";		
	}
	
	@RequestMapping("/moveToTrash/{id}")
	public Object moveToTrash(@PathVariable("id") Integer id){
		emailService.moveToTrash(id);
		return "forward:/email/inbox?p=1";
	}

	@RequestMapping("/remove/{id}")
	public Object remove(@PathVariable("id") Integer id){
		emailService.remove(id);
		return "forward:/email/trash?p=1";
	}
	
	@RequestMapping("/recover/{id}")
	public Object recover(@PathVariable("id") Integer id){
		emailService.recover(id);
		return "forward:/email/trash?p=1";
	}

	@RequestMapping("/senderDel/{id}")
	public Object senderDel(@PathVariable("id") Integer id){
		emailService.senderDel(id);
		return "forward:/email/sent?p=1";
	}
}
