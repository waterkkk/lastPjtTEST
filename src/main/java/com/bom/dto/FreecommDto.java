package com.bom.dto;

public class FreecommDto {
	
	private int freetable_no;
	private int freecomm_no;
	private String freecomm_id;
	private String freecomm_content;
	private String freecomm_regDate; // 작성일
	private int freecomm_groupNo; // 그룹번호
	private int freecomm_step; // 그룹순서(1부터)
	private int freecomm_titleTab; // 제목탭(0부터)
	
	public FreecommDto() {
		super();
	}

	public FreecommDto(int freetable_no, int freecomm_no, 
			String freecomm_id, String freecomm_content,
			String freecomm_regDate, int freecomm_groupNo, 
			int freecomm_step, int freecomm_titleTab) {
		super();
		this.freetable_no = freetable_no;
		this.freecomm_no = freecomm_no;
		this.freecomm_id = freecomm_id;
		this.freecomm_content = freecomm_content;
		this.freecomm_regDate = freecomm_regDate;
		this.freecomm_groupNo = freecomm_groupNo;
		this.freecomm_step = freecomm_step;
		this.freecomm_titleTab = freecomm_titleTab;
	}
	
	

	public int getFreetable_no() {
		return freetable_no;
	}

	public void setFreetable_no(int freetable_no) {
		this.freetable_no = freetable_no;
	}

	public int getFreecomm_no() {
		return freecomm_no;
	}

	public void setFreecomm_no(int freecomm_no) {
		this.freecomm_no = freecomm_no;
	}

	public String getFreecomm_id() {
		return freecomm_id;
	}

	public void setFreecomm_id(String freecomm_id) {
		this.freecomm_id = freecomm_id;
	}

	public String getFreecomm_content() {
		return freecomm_content;
	}

	public void setFreecomm_content(String freecomm_content) {
		this.freecomm_content = freecomm_content;
	}

	public String getFreecomm_regDate() {
		return freecomm_regDate;
	}

	public void setFreecomm_regDate(String freecomm_regDate) {
		this.freecomm_regDate = freecomm_regDate;
	}

	public int getFreecomm_groupNo() {
		return freecomm_groupNo;
	}

	public void setFreecomm_groupNo(int freecomm_groupNo) {
		this.freecomm_groupNo = freecomm_groupNo;
	}

	public int getFreecomm_step() {
		return freecomm_step;
	}

	public void setFreecomm_step(int freecomm_step) {
		this.freecomm_step = freecomm_step;
	}

	public int getFreecomm_titleTab() {
		return freecomm_titleTab;
	}

	public void setFreecomm_titleTab(int freecomm_titleTab) {
		this.freecomm_titleTab = freecomm_titleTab;
	}


	
	
}
