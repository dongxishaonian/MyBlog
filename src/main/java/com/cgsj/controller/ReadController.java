package com.cgsj.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

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
public class ReadController {
	@Resource
	private ArticleService articleService;

	@RequestMapping("/readPad")
	public String readPad(@RequestParam("articleType") String articleType, @RequestParam("articleId") int articleId,
			HttpServletRequest request) {
//		HttpSession session = request.getSession();
//		if (session.getAttribute("username") == null || session.getAttribute("username") == "") {
//			return "redirect:/login.do";
//		}
		articleService.addVolume(articleId);
		BlogArticle blogArticle = articleService.getOne(articleId);
		request.setAttribute("blogArticle", blogArticle);
		request.setAttribute("page", request.getParameter("page"));
		return "readPad";
	}

	@RequestMapping("/getData")
	public void getData(@RequestParam("articleType") String articleType, @RequestParam("articleId") int articleId,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		File file = new File("F:/MyBlog/"+articleType+"/" + articleId + ".md");
		fileIO fileIO = new fileIO();
		String content = "";
		content = fileIO.fileRead(file);
		try {
			response.setContentType("text/xml;charset=UTF-8");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(content);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
