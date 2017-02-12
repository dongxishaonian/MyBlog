package com.cgsj.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cgsj.entity.BlogArticle;
import com.cgsj.service.ArticleService;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ListController {
	@Resource
	private ArticleService articleService;

	@RequestMapping("/list")
	public String List(@RequestParam("articleType") String articleType,HttpServletRequest request) {
		List<BlogArticle> allArticles = new ArrayList<>();
		if (null == articleType || articleType == "") {
			allArticles = articleService.gainAll();
		} else {
			allArticles = articleService.gainByType(articleType);
		}
		request.setAttribute("allArticles", allArticles);
		request.setAttribute("articleType", articleType);
		return "ArticleList";
	}
	
	@RequestMapping("/delete")
	public String Dalete(@RequestParam("deleteId") int deleteId,@RequestParam("articleType") String articleType,HttpServletRequest request){
		articleService.deletebyId(deleteId);
		return "redirect:/list.do?articleType="+articleType;
	}

}
