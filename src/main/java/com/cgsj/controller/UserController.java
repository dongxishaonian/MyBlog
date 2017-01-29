package com.cgsj.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgsj.entity.BlogUser;
import com.cgsj.service.UserSevice;

@Controller
// @RequestMapping("/user")
public class UserController {

	private static final Log logger = LogFactory.getLog(UserController.class);
	@Resource
	private UserSevice userService;

	@RequestMapping("/login")
	public String login(@ModelAttribute BlogUser user, HttpServletRequest request, Model model) {
		model.addAttribute("user", new BlogUser());
		if (null == user.getUsername() || null == user.getPassword()) {
			return "Login";
		}
		BlogUser resultUser = userService.login(user);
		if (resultUser == null) {
			request.setAttribute("user", user);
			request.setAttribute("errorMsg", "用户名或密码错误！");
			return "Login";
		} else {
			HttpSession  session= request.getSession();
			System.out.println("username  = "+resultUser.getUsername());
			session.setAttribute("username", resultUser.getUsername());
			return "redirect:/index.jsp";
		}
	}
	
	@RequestMapping("/loginout.do")
	public String loginout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.setAttribute("username", null);
		return "index";
	}

}
