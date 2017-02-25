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
		List<BlogArticle> topArticles = new ArrayList<>();
		List<BlogArticle> untopArticles = new ArrayList<>();
		if (null == articleType || articleType == "") {
			allArticles = articleService.gainAll();
		} else {
			allArticles = articleService.gainByType(articleType);
		}
		for (BlogArticle blogArticle:allArticles) {
			if(blogArticle.getStickTop()!=null&&blogArticle.getStickTop()!=0){
				topArticles.add(blogArticle);
			}
			else{
				untopArticles.add(blogArticle);
			}
		}
		request.setAttribute("topArticles", topArticles);
		request.setAttribute("allArticles", untopArticles);
		request.setAttribute("articleType", articleType);
		return "ArticleList";
	}
	
	@RequestMapping("/delete")
	public String Dalete(@RequestParam("deleteId") int deleteId,@RequestParam("articleType") String articleType,HttpServletRequest request){
		articleService.deletebyId(deleteId);
		return "redirect:/list.do?articleType="+articleType;
	}
	@RequestMapping("/top")
	public String Top(@RequestParam("topId") int topId,@RequestParam("articleType") String articleType,HttpServletRequest request){
		articleService.topbyId(topId);
		return "redirect:/list.do?articleType="+articleType;
	}
	
	@RequestMapping("/untop")
	public String unTop(@RequestParam("untopId") int untopId,@RequestParam("articleType") String articleType,HttpServletRequest request){
		articleService.untopbyId(untopId);
		return "redirect:/list.do?articleType="+articleType;
	}
	
	

}
