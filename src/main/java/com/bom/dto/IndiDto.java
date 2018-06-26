package com.bom.dto;

import java.sql.Date;

public class IndiDto {
	private int inNo;
	private String inId;
	private String inTitle;
	private String inContent;
	private String inMdate;
	private Date inRegDate;
	
	public IndiDto() {
		
	}
	
	public IndiDto(int inNo, String inId, String inTitle, String inContent, String inMdate, Date inRegDate) {
		this.inNo = inNo;
		this.inId = inId;
		this.inTitle = inTitle;
		this.inContent = inContent;
		this.inMdate = inMdate;
		this.inRegDate = inRegDate;
	}
	
	public IndiDto(String inId, String inTitle, String inContent , String inMdate) {
		this.inId = inId;
		this.inTitle = inTitle;
		this.inContent = inContent;
		this.inMdate = inMdate;
	}
	
	public IndiDto(int inNo, String inTitle, String inContent) {
		this.inNo = inNo;
		this.inTitle = inTitle;
		this.inContent = inContent;
	}

	public int getInNo() {
		return inNo;
	}

	public void setInNo(int inNo) {
		this.inNo = inNo;
	}

	public String getInId() {
		return inId;
	}

	public void setInId(String inId) {
		this.inId = inId;
	}

	public String getInTitle() {
		return inTitle;
	}

	public void setInTitle(String inTitle) {
		this.inTitle = inTitle;
	}

	public String getInContent() {
		return inContent;
	}

	public void setInContent(String inContent) {
		this.inContent = inContent;
	}

	public String getInMdate() {
		return inMdate;
	}

	public void setInMdate(String inMdate) {
		this.inMdate = inMdate;
	}

	public Date getInRegDate() {
		return inRegDate;
	}

	public void setInRegDate(Date inRegDate) {
		this.inRegDate = inRegDate;
	}
}
