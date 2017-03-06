package com.cgsj.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cgsj.Util.fileIO;
import com.cgsj.entity.BlogArticle;
import com.cgsj.service.ArticleService;

@Controller
public class WriteController {

	@Resource
	private ArticleService articleService;

	@RequestMapping("/write")
	public String write(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("username") == null || session.getAttribute("username") == "") {
			return "redirect:/login.do";
		}
		return "Wordpad";
	}

	@RequestMapping("/save")
	// 服务器储存文章过程
	public String save(@RequestParam("textcontent") String textcontent, @RequestParam("articleType") String articleType,
			@RequestParam("title") String title, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		fileIO io = new fileIO();
		//String textContent = "";
		BlogArticle article = new BlogArticle();
		Calendar calendar = Calendar.getInstance();
		article.setArticleType(articleType);
		article.setTitle(title);
		article.setReadingVolume(0);
		article.setReleaseDate(calendar.getTime());
		// 文章基本信息写入数据库
		articleService.addArticle(article);
		System.out.println(article.getId());
		// 文章内容写入文件系统
		//textContent = request.getParameter("textcontent");
		io.fileWrite(textcontent, articleType, article.getId());
		return "redirect:/readPad.do?articleType=" + articleType + "&articleId=" + article.getId();
	}

}
