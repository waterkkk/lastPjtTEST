package com.bom.dto;

public class APItest {

	private String COURSE_CATEGORY;
	private String COURSE_CATEGORY_NM;
	private String SOUTH_NORTH_DIV;
	private String SOUTH_NORTH_DIV_NM;
	private String AREA_GU;
	private String DISTANCE;
	private String LEAD_TIME;
	private String COURSE_LEVEL;
	private String VOTE_CNT;
	private String RELATE_SUBWAY;
	private String TRAFFIC_INFO;
	private String CONTENT;
	private String PDF_FILE_PATH;
	private String COURSE_NAME;
	private String REG_DATE;
	private String DETAIL_COURSE;
	private String CPI_IDX;
	private String CPI_NAME;
	private String X;
	private String Y;
	private String CPI_CONTENT;

	public APItest() {
	}

	public APItest(String COURSE_CATEGORY, String COURSE_CATEGORY_NM, String SOUTH_NORTH_DIV, String SOUTH_NORTH_DIV_NM,
			String AREA_GU, String DISTANCE, String LEAD_TIME, String COURSE_LEVEL, String VOTE_CNT,
			String RELATE_SUBWAY, String TRAFFIC_INFO, String CONTENT, String PDF_FILE_PATH, String COURSE_NAME,
			String REG_DATE, String DETAIL_COURSE, String CPI_IDX, String CPI_NAME, String X, String Y,
			String CPI_CONTENT) {
		super();
		this.COURSE_CATEGORY = COURSE_CATEGORY;
		this.COURSE_CATEGORY_NM = COURSE_CATEGORY_NM;
		this.SOUTH_NORTH_DIV = SOUTH_NORTH_DIV;
		this.SOUTH_NORTH_DIV_NM = SOUTH_NORTH_DIV_NM;
		this.AREA_GU = AREA_GU;
		this.DISTANCE = DISTANCE;
		this.LEAD_TIME = LEAD_TIME;
		this.COURSE_LEVEL = COURSE_LEVEL;
		this.VOTE_CNT = VOTE_CNT;
		this.RELATE_SUBWAY = RELATE_SUBWAY;
		this.TRAFFIC_INFO = TRAFFIC_INFO;
		this.CONTENT = CONTENT;
		this.PDF_FILE_PATH = PDF_FILE_PATH;
		this.COURSE_NAME = COURSE_NAME;
		this.REG_DATE = REG_DATE;
		this.DETAIL_COURSE = DETAIL_COURSE;
		this.CPI_IDX = CPI_IDX;
		this.CPI_NAME = CPI_NAME;
		this.X = X;
		this.Y = Y;
		this.CPI_CONTENT = CPI_CONTENT;
	}
	
	public APItest(String COURSE_CATEGORY, String COURSE_CATEGORY_NM, String SOUTH_NORTH_DIV, String SOUTH_NORTH_DIV_NM
			) {
		super();
		this.COURSE_CATEGORY = COURSE_CATEGORY;
		this.COURSE_CATEGORY_NM = COURSE_CATEGORY_NM;
		this.SOUTH_NORTH_DIV = SOUTH_NORTH_DIV;
		this.SOUTH_NORTH_DIV_NM = SOUTH_NORTH_DIV;
	
	}
	

	public String getCOURSE_CATEGORY() {
		return COURSE_CATEGORY;
	}

	public void setCOURSE_CATEGORY(String COURSE_CATEGORY) {
		this.COURSE_CATEGORY = COURSE_CATEGORY;
	}

	public String getCOURSE_CATEGORY_NM() {
		return COURSE_CATEGORY_NM;
	}

	public void setCOURSE_CATEGORY_NM(String COURSE_CATEGORY_NM) {
		this.COURSE_CATEGORY_NM = COURSE_CATEGORY_NM;
	}

	public String getSOUTH_NORTH_DIV() {
		return SOUTH_NORTH_DIV;
	}

	public void setSOUTH_NORTH_DIV(String SOUTH_NORTH_DIV) {
		this.SOUTH_NORTH_DIV = SOUTH_NORTH_DIV;
	}

	public String getSOUTH_NORTH_DIV_NM() {
		return SOUTH_NORTH_DIV_NM;
	}

	public void setSOUTH_NORTH_DIV_NM(String SOUTH_NORTH_DIV_NM) {
		this.SOUTH_NORTH_DIV_NM = SOUTH_NORTH_DIV_NM;
	}

	public String getAREA_GU() {
		return AREA_GU;
	}

	public void setAREA_GU(String AREA_GU) {
		this.AREA_GU = AREA_GU;
	}

	public String getDISTANCE() {
		return DISTANCE;
	}

	public void setDISTANCE(String DISTANCE) {
		this.DISTANCE = DISTANCE;
	}

	public String getLEAD_TIME() {
		return LEAD_TIME;
	}

	public void setLEAD_TIME(String LEAD_TIME) {
		this.LEAD_TIME = LEAD_TIME;
	}

	public String getCOURSE_LEVEL() {
		return COURSE_LEVEL;
	}

	public void setCOURSE_LEVEL(String course_level) {
		this.COURSE_LEVEL = COURSE_LEVEL;
	}

	public String getVOTE_CNT() {
		return VOTE_CNT;
	}

	public void setVOTE_CNT(String VOTE_CNT) {
		this.VOTE_CNT = VOTE_CNT;
	}

	public String getRELATE_SUBWAY() {
		return RELATE_SUBWAY;
	}

	public void setRELATE_SUBWAY(String RELATE_SUBWAY) {
		this.RELATE_SUBWAY = RELATE_SUBWAY;
	}

	public String getTRAFFIC_INFO() {
		return TRAFFIC_INFO;
	}

	public void setTRAFFIC_INFO(String TRAFFIC_INFO) {
		this.TRAFFIC_INFO = TRAFFIC_INFO;
	}

	public String getCONTENT() {
		return CONTENT;
	}

	public void setCONTENT(String CONTENT) {
		this.CONTENT = CONTENT;
	}

	public String getPDF_FILE_PATH() {
		return PDF_FILE_PATH;
	}

	public void setPDF_FILE_PATH(String PDF_FILE_PATH) {
		this.PDF_FILE_PATH = PDF_FILE_PATH;
	}

	public String getCOURSE_NAME() {
		return COURSE_NAME;
	}

	public void setCOURSE_NAME(String COURSE_NAME) {
		this.COURSE_NAME = COURSE_NAME;
	}

	public String getREG_DATE() {
		return REG_DATE;
	}

	public void setReg_date(String REG_DATE) {
		this.REG_DATE = REG_DATE;
	}

	public String getDETAIL_COURSE() {
		return DETAIL_COURSE;
	}

	public void setDETAIL_COURSE(String DETAIL_COURSE) {
		this.DETAIL_COURSE = DETAIL_COURSE;
	}

	public String getCPI_IDX() {
		return CPI_IDX;
	}

	public void setCPI_IDX(String CPI_IDX) {
		this.CPI_IDX = CPI_IDX;
	}

	public String getCPI_NAME() {
		return CPI_NAME;
	}

	public void setCPI_NAME(String CPI_NAME) {
		this.CPI_NAME = CPI_NAME;
	}

	public String getX() {
		return X;
	}

	public void setX(String X) {
		this.X = X;
	}

	public String getY() {
		return Y;
	}

	public void setY(String Y) {
		this.Y = Y;
	}

	public String getCPI_CONTENT() {
		return CPI_CONTENT;
	}

	public void setCPI_CONTENT(String CPI_CONTENT) {
		this.CPI_CONTENT = CPI_CONTENT;
	}

}
