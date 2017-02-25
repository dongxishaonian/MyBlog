package com.cgsj.entity;

import java.util.Date;

public class BlogArticle {

	private Integer id;
	private String title;
	private String articleType;
	private Integer articleStatus;
	private Date releaseDate;
	private Integer readingVolume;
	private Integer stickTop;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArticleType() {
		return articleType;
	}

	public void setArticleType(String articleType) {
		this.articleType = articleType;
	}

	public Integer getArticleStatus() {
		return articleStatus;
	}

	public void setArticleStatus(Integer articleStatus) {
		this.articleStatus = articleStatus;
	}

	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	public Integer getReadingVolume() {
		return readingVolume;
	}

	public void setReadingVolume(Integer readingVolume) {
		this.readingVolume = readingVolume;
	}

	public Integer getStickTop() {
		return stickTop;
	}

	public void setStickTop(Integer stickTop) {
		this.stickTop = stickTop;
	}
	
}
