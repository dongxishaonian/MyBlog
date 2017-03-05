package com.cgsj.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cgsj.Util.fileIO;
import com.cgsj.entity.BlogArticle;
import com.cgsj.service.ArticleService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ListController {
	@Resource
	private ArticleService articleService;
	private fileIO fileio = new fileIO();

	@RequestMapping("/list")
	public String List(@RequestParam("articleType") String articleType, HttpServletRequest request,
			HttpSession session) {
		List<BlogArticle> allArticles = new ArrayList<>();
		List<BlogArticle> topArticles = new ArrayList<>();
		PageInfo<BlogArticle> page = new PageInfo<>();
		int curr = 1;
		if (request.getParameter("page") != null || request.getParameter("page") == "") {
			curr = Integer.parseInt(request.getParameter("page"));
		}

		PageHelper.startPage(1, 10);
		if (session.getAttribute("username") == null || session.getAttribute("username") == "") {
			allArticles = articleService.gainByTypeyk(articleType);
			topArticles = articleService.topByTypeyk(articleType);
		} else {
			allArticles = articleService.gainByType(articleType);
			topArticles = articleService.topByType(articleType);
		}
		page = new PageInfo<BlogArticle>(allArticles);
		if (curr >= page.getPages()) {
			curr = page.getPages();
		}
		request.setAttribute("topArticles", topArticles);
		request.setAttribute("indexSum", page.getPages());
		request.setAttribute("articleType", articleType);
		request.setAttribute("curr", curr);
		return "ArticleList";
	}

	@RequestMapping("page")
	public void page(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		List<BlogArticle> allArticles = new ArrayList<>();
		PageInfo<BlogArticle> page = new PageInfo<>();
		String data = "";
		String panduan = "";
		String status = "selected=\"selected\"";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		int pageindex = Integer.parseInt(request.getParameter("page"));
		System.out.println("pageindex的值为：" + pageindex);
		String articleType = request.getParameter("articleType");
		PageHelper.startPage(pageindex, 10);
		if (session.getAttribute("username") == null || session.getAttribute("username") == "") {
			allArticles = articleService.gainByTypeyk(articleType);
		} else {
			allArticles = articleService.gainByType(articleType);
		}
		System.out.println("allArticle的长度：" + allArticles.size());
		page = new PageInfo<BlogArticle>(allArticles);
		System.out.println("allArticle的长度：" + allArticles.size());
		for (int i = 1; i <= allArticles.size(); i++) {
			System.out.println(dateFormat.format(allArticles.get(i - 1).getReleaseDate()));
			data += "<tr>" + "<td>" + i + "</td>" + "<td><a href=\"/MyBlog/readPad.do?articleType=" + articleType
					+ "&articleId=" + allArticles.get(i - 1).getId() + "&page=" + pageindex + "\""
					+ " data-method=\"offset\" data-type=\"auto\" class=\"\">" + allArticles.get(i - 1).getTitle()
					+ " </a></td>" + "<td>" + allArticles.get(i - 1).getReadingVolume() + "</td>" + "<td>"
					+ dateFormat.format(allArticles.get(i - 1).getReleaseDate()) + "</td>";
			if (session.getAttribute("username") != null || session.getAttribute("username") == "admin") {
				panduan = "<td>" + "<select id=\"" + allArticles.get(i - 1).getId()
						+ "\" class=\"articleStatus\" name=\"articleStatus\" lay-verify=\"\">" + "<option value=\"1\""
						+ (allArticles.get(i - 1).getArticleStatus() == 1 ? status : "") + ">可视</option>"
						+ "<option value=\"0\"" + (allArticles.get(i - 1).getArticleStatus() != 1 ? status : "")
						+ ">不可视</option>" + "</select>" + "</td>" + "<td>"
						+ "<a  href=\"/MyBlog/updatePad.do?articleType=" + allArticles.get(i - 1).getArticleType()
						+ "&updateId=" + allArticles.get(i - 1).getId() + "&page=" + pageindex
						+ "\" data-method=\"offset\" data-type=\"auto\" class=\"\">编辑</a>|<a id=\""
						+ allArticles.get(i - 1).getId()
						+ "\" href=\"javascript:void(0)\" data-method=\"offset\" data-type=\"auto\" class=\"layer_btn\">分类</a>|<a class=\"top_article\"  href=\"/MyBlog/top.do?articleType="
						+ allArticles.get(i - 1).getArticleType() + "&topId=" + allArticles.get(i - 1).getId()
						+ "&page=" + pageindex + "\"" + ">置顶</a>|<a id=" + "\"" + allArticles.get(i - 1).getId() + "\""
						+ " class=\"delete_article\"  href=\"javascript:void(0)\">删除</a>" + "</td>" + "</tr>";
				data = data + panduan;
			}
		}
		try {
			response.setContentType("text/xml;charset=UTF-8");
			response.setHeader("Cache-Control", "no-cache");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/changeStatus")
	public void changeStatus(@RequestParam("id") int id, @RequestParam("status") int status, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException {
		BlogArticle blogArticle = articleService.getOne(id);
		blogArticle.setArticleStatus(status);
		articleService.updateArticle(blogArticle);
		response.setContentType("text/xml;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write("修改成功");
		} catch (Exception e) {
			response.getWriter().write("修改失败");
			e.printStackTrace();
		}
	}

	@RequestMapping("/delete")
	public String Dalete(@RequestParam("deleteId") int deleteId, @RequestParam("articleType") String articleType,
			HttpServletRequest request) {
		articleService.deletebyId(deleteId);
		return "redirect:/list.do?articleType=" + articleType + "&page=" + request.getParameter("page");
	}

	@RequestMapping("/top")
	public String Top(@RequestParam("topId") int topId, @RequestParam("articleType") String articleType,
			HttpServletRequest request) {
		articleService.topbyId(topId);
		return "redirect:/list.do?articleType=" + articleType + "&page=" + request.getParameter("page");
	}

	@RequestMapping("/untop")
	public String unTop(@RequestParam("untopId") int untopId, @RequestParam("articleType") String articleType,
			HttpServletRequest request) {
		articleService.untopbyId(untopId);
		return "redirect:/list.do?articleType=" + articleType + "&page=" + request.getParameter("page");
	}

	@RequestMapping("/classIficat")
	public String classIficat(@RequestParam("lastType") String lastType, @RequestParam("classId") int classId,
			@RequestParam("articleType") String articleType, HttpServletRequest request) throws IOException {
		System.out.println(classId);
		System.out.println(articleType);
		System.out.println(request.getParameter("articleType"));
		articleService.classIficat(articleType, classId);
		fileio.deleteFile(lastType, articleType, classId);
		return "redirect:/list.do?articleType=" + articleType;
	}

}
