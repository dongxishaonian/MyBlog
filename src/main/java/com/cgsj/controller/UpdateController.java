package com.cgsj.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cgsj.Util.fileIO;
import com.cgsj.entity.BlogArticle;
import com.cgsj.service.ArticleService;

@Controller
public class UpdateController {
	@Resource
	private ArticleService articleService;

	@RequestMapping("/updatePad")
	public String updatePad(@RequestParam("articleType") String articleType, @RequestParam("updateId") int updateId,
			HttpServletRequest request) {
		// HttpSession session = request.getSession();
		// if (session.getAttribute("username") == null ||
		// session.getAttribute("username") == "") {
		// return "redirect:/login.do";
		// }

		BlogArticle blogArticle = articleService.getOne(updateId);
		// 修改文章时间 为修改时间
		// blogArticle.setReleaseDate(Calendar.getInstance().getTime());
		request.setAttribute("blogArticle", blogArticle);
		request.setAttribute("page", request.getParameter("page"));
		return "updatePad";
	}

	@RequestMapping("/update")
	public String update(@RequestParam("articleId") int articleId, @RequestParam("textcontent") String textcontent,
			@RequestParam("articleType") String articleType, @RequestParam("title") String title,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		fileIO io = new fileIO();
		// String textContent = "";
		BlogArticle article = articleService.getOne(articleId);
		Calendar calendar = Calendar.getInstance();
		article.setArticleType(articleType);
		article.setTitle(title);
		article.setReleaseDate(calendar.getTime());
		// 文章基本信息写入数据库
		articleService.updateArticle(article);
		System.out.println(article.getId());
		// 文章内容写入文件系统(修改)
		// textContent = request.getParameter("textcontent");
		io.fileWrite(textcontent, articleType, article.getId());
		return "redirect:/readPad.do?articleType=" + articleType + "&articleId=" + article.getId()+"&page=" +request.getParameter("page") ;
	}

	// @RequestMapping("/getData")
	// public void getData(@RequestParam("articleType") String articleType,
	// @RequestParam("articleId") int articleId,
	// HttpServletRequest request, HttpServletResponse response) throws
	// IOException {
	// File file = new File("F:/MyBlog/"+articleType+"/" + articleId + ".txt");
	// fileIO fileIO = new fileIO();
	// String content = "";
	// content = fileIO.fileRead(file);
	// try {
	// response.setContentType("text/xml;charset=UTF-8");
	// response.setHeader("Cache-Control", "no-cache");
	// response.setCharacterEncoding("UTF-8");
	// response.getWriter().write(content);
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	//
	// }
}
