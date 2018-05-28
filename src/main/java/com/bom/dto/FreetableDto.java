package com.bom.dto;

public class FreetableDto {
	
	private int freetable_no;
	private String freetable_id;
	private String freetable_title;
	private String freetable_content;
	private String freetable_regDate;
	private int freetable_readCount;
	
	private int freetable_groupNo;
	private int freetable_step;
	private int freetable_titleTab;
	private String freetable_delFlag;
	
	
	
	public FreetableDto() {
	super();
	}
	

	public FreetableDto(int freetable_no, String freetable_id, 
			String freetable_title, String freetable_content,
			String freetable_regDate, int freetable_readCount, 
			int freetable_groupNo, int freetable_step,
			int freetable_titleTab, String freetable_delFlag) {
		super();
		this.freetable_no = freetable_no;
		this.freetable_id = freetable_id;
		this.freetable_title = freetable_title;
		this.freetable_content = freetable_content;
		this.freetable_regDate = freetable_regDate;
		this.freetable_readCount = freetable_readCount;
		this.freetable_groupNo = freetable_groupNo;
		this.freetable_step = freetable_step;
		this.freetable_titleTab = freetable_titleTab;
		this.freetable_delFlag = freetable_delFlag;
	}
	
	




	
	public FreetableDto(String freetable_id, String freetable_title, String freetable_content) {
		super();
		this.freetable_id = freetable_id;
		this.freetable_title = freetable_title;
		this.freetable_content = freetable_content;
	}

	
	public FreetableDto(int freetable_no, String freetable_title, String freetable_content) {
		super();
		this.freetable_no = freetable_no;
		this.freetable_title = freetable_title;
		this.freetable_content = freetable_content;
	}


	public int getFreetable_no() {
		return freetable_no;
	}


	public void setFreetable_no(int freetable_no) {
		this.freetable_no = freetable_no;
	}


	public String getFreetable_id() {
		return freetable_id;
	}


	public void setFreetable_id(String freetable_id) {
		this.freetable_id = freetable_id;
	}


	public String getFreetable_title() {
		return freetable_title;
	}


	public void setFreetable_title(String freetable_title) {
		this.freetable_title = freetable_title;
	}


	public String getFreetable_content() {
		return freetable_content;
	}


	public void setFreetable_content(String freetable_content) {
		this.freetable_content = freetable_content;
	}


	public String getFreetable_regDate() {
		return freetable_regDate;
	}


	public void setFreetable_regDate(String freetable_regDate) {
		this.freetable_regDate = freetable_regDate;
	}


	public int getFreetable_readCount() {
		return freetable_readCount;
	}


	public void setFreetable_readCount(int freetable_readCount) {
		this.freetable_readCount = freetable_readCount;
	}


	public int getFreetable_groupNo() {
		return freetable_groupNo;
	}


	public void setFreetable_groupNo(int freetable_groupNo) {
		this.freetable_groupNo = freetable_groupNo;
	}


	public int getFreetable_step() {
		return freetable_step;
	}


	public void setFreetable_step(int freetable_step) {
		this.freetable_step = freetable_step;
	}


	public int getFreetable_titleTab() {
		return freetable_titleTab;
	}


	public void setFreetable_titleTab(int freetable_titleTab) {
		this.freetable_titleTab = freetable_titleTab;
	}


	public String getFreetable_delFlag() {
		return freetable_delFlag;
	}


	public void setFreetable_delFlag(String freetable_delFlag) {
		this.freetable_delFlag = freetable_delFlag;
	}
	
	
	
	

	
	
}
