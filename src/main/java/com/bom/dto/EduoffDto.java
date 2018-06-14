package com.bom.dto;

public class EduoffDto {

	private String course_id;
	private String course_nm; 
	private String course_gubun;
	private String course_request_str_dt; 
	private String course_request_end_dt; 
	private String course_str_dt; 
	private String course_end_dt; 
	private String course_target;
	private String capacity; 
	private String course_apply_url;
		
	
	public EduoffDto() {
		super();
	}
	
	public EduoffDto(String course_id, String course_nm, String course_gubun, String course_request_str_dt,
			String course_request_end_dt, String course_str_dt, String course_end_dt, String course_target,
			String capacity, String course_apply_url) {
		super();
		this.course_id = course_id;
		this.course_nm = course_nm;
		this.course_gubun = course_gubun;
		this.course_request_str_dt = course_request_str_dt;
		this.course_request_end_dt = course_request_end_dt;
		this.course_str_dt = course_str_dt;
		this.course_end_dt = course_end_dt;
		this.course_target = course_target;
		this.capacity = capacity;
		this.course_apply_url = course_apply_url;
	}
	
	
	public String getCourse_id() {
		return course_id;
	}
	public void setCourse_id(String course_id) {
		this.course_id = course_id;
	}
	public String getCourse_nm() {
		return course_nm;
	}
	public void setCourse_nm(String course_nm) {
		this.course_nm = course_nm;
	}
	public String getCourse_gubun() {
		return course_gubun;
	}
	public void setCourse_gubun(String course_gubun) {
		this.course_gubun = course_gubun;
	}
	public String getCourse_request_str_dt() {
		return course_request_str_dt;
	}
	public void setCourse_request_str_dt(String course_request_str_dt) {
		this.course_request_str_dt = course_request_str_dt;
	}
	public String getCourse_request_end_dt() {
		return course_request_end_dt;
	}
	public void setCourse_request_end_dt(String course_request_end_dt) {
		this.course_request_end_dt = course_request_end_dt;
	}
	public String getCourse_str_dt() {
		return course_str_dt;
	}
	public void setCourse_str_dt(String course_str_dt) {
		this.course_str_dt = course_str_dt;
	}
	public String getCourse_end_dt() {
		return course_end_dt;
	}
	public void setCourse_end_dt(String course_end_dt) {
		this.course_end_dt = course_end_dt;
	}
	public String getCourse_target() {
		return course_target;
	}
	public void setCourse_target(String course_target) {
		this.course_target = course_target;
	}
	public String getCapacity() {
		return capacity;
	}
	public void setCapacity(String capacity) {
		this.capacity = capacity;
	}
	public String getCourse_apply_url() {
		return course_apply_url;
	}
	public void setCourse_apply_url(String course_apply_url) {
		this.course_apply_url = course_apply_url;
	}
	
	
	
}
