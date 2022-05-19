package com.monami.board.dao;

import java.sql.Timestamp;

public class VBoardDTO {
	private int video_idx;
	private String video_title;
	private String video_writer;
	private String video_content;
	private String video_img;
	private String created_at;
	
	
	public int getVideo_idx() {
		return video_idx;
	}
	public void setVideo_idx(int video_idx) {
		this.video_idx = video_idx;
	}
	public String getVideo_title() {
		return video_title;
	}
	public void setVideo_title(String video_title) {
		this.video_title = video_title;
	}
	public String getVideo_writer() {
		return video_writer;
	}
	public void setVideo_writer(String video_writer) {
		this.video_writer = video_writer;
	}
	public String getVideo_content() {
		return video_content;
	}
	public void setVideo_content(String video_content) {
		this.video_content = video_content;
	}
	public String getVideo_img() {
		return video_img;
	}
	public void setVideo_img(String video_img) {
		this.video_img = video_img;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
}
