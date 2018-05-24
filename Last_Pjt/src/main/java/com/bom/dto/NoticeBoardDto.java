package com.bom.dto;

import java.sql.Date;

public class NoticeBoardDto {

	private int noticeboard_no;
	private String noticeboard_writer;
	private String noticeboard_title;
	private String noticeboard_content;
	private Date noticeboard_regdate;
	private int noticeboard_count;

	public NoticeBoardDto() {
	}

	public NoticeBoardDto(int noticeboard_no, String noticeboard_writer, String noticeboard_title,
			String noticeboard_content, Date noticeboard_regdate, int noticeboard_count) {
		this.noticeboard_no = noticeboard_no;
		this.noticeboard_writer = noticeboard_writer;
		this.noticeboard_title = noticeboard_title;
		this.noticeboard_content = noticeboard_content;
		this.noticeboard_regdate = noticeboard_regdate;
		this.noticeboard_count = noticeboard_count;
	}

	public int getNoticeboard_no() {
		return noticeboard_no;
	}

	public void setNoticeboard_no(int noticeboard_no) {
		this.noticeboard_no = noticeboard_no;
	}

	public String getNoticeboard_writer() {
		return noticeboard_writer;
	}

	public void setNoticeboard_writer(String noticeboard_writer) {
		this.noticeboard_writer = noticeboard_writer;
	}

	public String getNoticeboard_title() {
		return noticeboard_title;
	}

	public void setNoticeboard_title(String noticeboard_title) {
		this.noticeboard_title = noticeboard_title;
	}

	public String getNoticeboard_content() {
		return noticeboard_content;
	}

	public void setNoticeboard_content(String noticeboard_content) {
		this.noticeboard_content = noticeboard_content;
	}

	public Date getNoticeboard_regdate() {
		return noticeboard_regdate;
	}

	public void setNoticeboard_regdate(Date noticeboard_regdate) {
		this.noticeboard_regdate = noticeboard_regdate;
	}

	public int getNoticeboard_count() {
		return noticeboard_count;
	}

	public void setNoticeboard_count(int noticeboard_count) {
		this.noticeboard_count = noticeboard_count;
	}

}
