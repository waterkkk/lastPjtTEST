package com.bom.dto;
public class EduSearchDto {
	private String lectureId;
	private String lectureName;
	private String lectureNo;
	private String lectureTitle;
	private String lectureKind;
	private String lectureCheckStart;
	private String lectureCheckEnd;
	private String lectureOppsite;
	private String lectureDifficult;
	private String lectureURL;
	
	public EduSearchDto() {
		
	}
	
	public EduSearchDto(String lectureId, String lectureName, String lectureNo, String lectureTitle, String lectureKind, String lectureCheckStart, String lectureCheckEnd, String lectureOppsite, String lectureDifficult, String lectureURL) {
		this.lectureId = lectureId;
		this.lectureName = lectureName;
		this.lectureNo = lectureNo;
		this.lectureTitle = lectureTitle;
		this.lectureKind = lectureKind;
		this.lectureCheckStart = lectureCheckStart;
		this.lectureCheckEnd = lectureCheckEnd;
		this.lectureOppsite = lectureOppsite;
		this.lectureDifficult = lectureDifficult;
		this.lectureURL = lectureURL;
	}

	public String getLectureId() {
		return lectureId;
	}

	public void setLectureId(String lectureId) {
		this.lectureId = lectureId;
	}

	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	public String getLectureNo() {
		return lectureNo;
	}

	public void setLectureNo(String lectureNo) {
		this.lectureNo = lectureNo;
	}

	public String getLectureTitle() {
		return lectureTitle;
	}

	public void setLectureTitle(String lectureTitle) {
		this.lectureTitle = lectureTitle;
	}

	public String getLectureKind() {
		return lectureKind;
	}

	public void setLectureKind(String lectureKind) {
		this.lectureKind = lectureKind;
	}

	public String getLectureCheckStart() {
		return lectureCheckStart;
	}

	public void setLectureCheckStart(String lectureCheckStart) {
		this.lectureCheckStart = lectureCheckStart;
	}

	public String getLectureCheckEnd() {
		return lectureCheckEnd;
	}

	public void setLectureCheckEnd(String lectureCheckEnd) {
		this.lectureCheckEnd = lectureCheckEnd;
	}

	public String getLectureOppsite() {
		return lectureOppsite;
	}

	public void setLectureOppsite(String lectureOppsite) {
		this.lectureOppsite = lectureOppsite;
	}

	public String getLectureDifficult() {
		return lectureDifficult;
	}

	public void setLectureDifficult(String lectureDifficult) {
		this.lectureDifficult = lectureDifficult;
	}

	public String getLectureURL() {
		return lectureURL;
	}

	public void setLectureURL(String lectureURL) {
		this.lectureURL = lectureURL;
	}

	
}
