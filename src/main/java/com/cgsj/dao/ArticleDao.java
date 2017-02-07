package com.cgsj.dao;

import java.util.ArrayList;

import com.cgsj.entity.BlogArticle;

public interface ArticleDao {
	
	//获取数据库所有文章
	public ArrayList<BlogArticle> gainAll();
	//获取指定类型文章
	public ArrayList<BlogArticle> gainByType(String articleType);
	

}
