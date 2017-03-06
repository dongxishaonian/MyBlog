package com.cgsj.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.cgsj.entity.BlogArticle;

public interface ArticleDao {
	
	//获取指定文章
	public BlogArticle getOne(Integer id);

	// 获取数据库所有文章
	public ArrayList<BlogArticle> gainAll();

	// 获取指定类型文章
	public ArrayList<BlogArticle> gainByType(String articleType,RowBounds rowBounds);
	public ArrayList<BlogArticle> gainByType(String articleType);
	public ArrayList<BlogArticle> gainByTypeyk(String articleType);
	
	//获取指定类型置顶文章
	public ArrayList<BlogArticle> topByType(String articleType);
	public ArrayList<BlogArticle> topByTypeyk(String articleType);
	

	// 删除指定文章
	public int deletebyId(Integer id);

	// 置顶置顶文章
	public int topbyId(Integer id);

	// 取消置顶文章
	public int untopbyId(Integer id);
	
	//改变文章分类
	public int  classIficat(String articleType,Integer id);
	
	//改变文章内容或标题
	public int  updateArticle(BlogArticle blogArticle);
	
	//添加新文章
	public int  addArticle(BlogArticle blogArticle);
	
	//阅读后增加阅读量
	public int  addVolume(int id);

}
