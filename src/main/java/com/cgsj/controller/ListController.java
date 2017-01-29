package com.cgsj.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ListController {
	@RequestMapping("/list")
	public String List(HttpServletRequest request){
//		HttpSession session = request.getSession();
//		if(session.getAttribute("username")==null||session.getAttribute("username")==""){
//			return "redirect:/login.do";
//		}
		return "ArticleList";
	}
	
}
