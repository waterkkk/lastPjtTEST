package com.bom.dto;

import java.sql.Date;

public class NoticDto {
	private int noticeNo;
	private String noticeId;
	private String noticeWriter;
	private String noticeTitle;
	private Date noticeRegDate;
	private int noticeCount;
	private String noticeContent;
	
	public NoticDto() {
		
	}
	public NoticDto(String noticeId, String noticeWriter, String noticeTitle, String noticeContent) {
		this.noticeId = noticeId;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	public NoticDto(int noticeNo , String noticeId, String noticeWriter, String noticeTitle, Date noticeRegDate, int noticeCount, String noticeContent) {
		this.noticeNo = noticeNo;
		this.noticeId = noticeId;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;
		this.noticeRegDate = noticeRegDate;
		this.noticeCount = noticeCount;
		this.noticeContent = noticeContent;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public Date getNoticeRegDate() {
		return noticeRegDate;
	}

	public void setNoticeRegDate(Date noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}

	public int getNoticeCount() {
		return noticeCount;
	}

	public void setNoticeCount(int noticeCount) {
		this.noticeCount = noticeCount;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
}
