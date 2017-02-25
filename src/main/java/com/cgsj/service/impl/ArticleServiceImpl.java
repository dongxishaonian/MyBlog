package com.cgsj.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cgsj.dao.ArticleDao;
import com.cgsj.entity.BlogArticle;
import com.cgsj.service.ArticleService;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

	@Resource
	private ArticleDao articleDao;

	@Override
	public ArrayList<BlogArticle> gainAll() {
		return articleDao.gainAll();
	}

	@Override
	public ArrayList<BlogArticle> gainByType(String articleType) {
		return articleDao.gainByType(articleType);
	}

	@Override
	public int deletebyId(Integer id) {
		return articleDao.deletebyId(id);
	}

	@Override
	public int topbyId(Integer id) {
		return articleDao.topbyId(id);
	}

	@Override
	public int untopbyId(Integer id) {
		return articleDao.untopbyId(id);
	}

}
