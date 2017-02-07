package com.cgsj.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cgsj.entity.BlogArticle;
import com.cgsj.service.ArticleService;

import java.util.ArrayList;
import java.util.List;
@Controller
public class ListController {
	@Resource
	private ArticleService articleService;
	
	@RequestMapping("/list")
	public String List(HttpServletRequest request){
		List<BlogArticle> allArticles = new ArrayList<>();
//		HttpSession session = request.getSession();
//		if(session.getAttribute("username")==null||session.getAttribute("username")==""){
//			return "redirect:/login.do";
//		}
		allArticles=articleService.gainAll();
		System.out.println(allArticles.get(2).getReadingVolume());
		request.setAttribute("allArticles",allArticles);
		return "ArticleList";
	}
	
}
