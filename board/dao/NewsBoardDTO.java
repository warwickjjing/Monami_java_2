package com.monami.board.dao;

public class NewsBoardDTO {
	private int news_idx;
    private String news_title;
    private String news_writer;
    private String news_content;
    private String created_at;
	public int getNews_idx() {
		return news_idx;
	}
	public void setNews_idx(int news_idx) {
		this.news_idx = news_idx;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String getNews_writer() {
		return news_writer;
	}
	public void setNews_writer(String news_writer) {
		this.news_writer = news_writer;
	}
	public String getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
    
	
}