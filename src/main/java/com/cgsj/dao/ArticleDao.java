package com.cgsj.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.cgsj.entity.BlogArticle;

public interface ArticleDao {

	// 获取数据库所有文章
	public ArrayList<BlogArticle> gainAll();

	// 获取指定类型文章
	public ArrayList<BlogArticle> gainByType(String articleType,RowBounds rowBounds);
	public ArrayList<BlogArticle> gainByType(String articleType);
	
	
	//获取指定类型置顶文章
	public ArrayList<BlogArticle> topByType(String articleType);
	

	// 删除指定文章
	public int deletebyId(Integer id);

	// 置顶置顶文章
	public int topbyId(Integer id);

	// 取消置顶文章
	public int untopbyId(Integer id);

}
