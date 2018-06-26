package com.bom.dto;


import org.apache.poi.hssf.usermodel.HSSFCell;

public class EducDto {
	private HSSFCell name;
	private HSSFCell teacher;
	private HSSFCell start;
	private HSSFCell end;
	private HSSFCell startTime;
	private HSSFCell endTime;
	private HSSFCell content;
	private HSSFCell object;
	private HSSFCell way;
	private HSSFCell opWeek;
	private HSSFCell place;
	private HSSFCell max;
	private HSSFCell price;
	private HSSFCell RoadName;
	private HSSFCell opName;
	private HSSFCell callNum;
	private HSSFCell acceptStart;
	private HSSFCell acceptEnd;
	private HSSFCell acceptWay;
	private HSSFCell selectWay;
	private HSSFCell URL;
	
	public EducDto() {
		
	}
	public EducDto(HSSFCell name, HSSFCell teacher, HSSFCell start, HSSFCell end, HSSFCell startTime, HSSFCell endTime,
			HSSFCell content, HSSFCell object, HSSFCell way, HSSFCell opWeek, HSSFCell place, HSSFCell max,
			HSSFCell price, HSSFCell roadName, HSSFCell opName, HSSFCell callNum, HSSFCell acceptStart,
			HSSFCell acceptEnd, HSSFCell acceptWay, HSSFCell selectWay, HSSFCell uRL) {
		super();
		this.name = name;
		this.teacher = teacher;
		this.start = start;
		this.end = end;
		this.startTime = startTime;
		this.endTime = endTime;
		this.content = content;
		this.object = object;
		this.way = way;
		this.opWeek = opWeek;
		this.place = place;
		this.max = max;
		this.price = price;
		this.RoadName = roadName;
		this.opName = opName;
		this.callNum = callNum;
		this.acceptStart = acceptStart;
		this.acceptEnd = acceptEnd;
		this.acceptWay = acceptWay;
		this.selectWay = selectWay;
		this.URL = uRL;
	}
	public HSSFCell getName() {
		return name;
	}
	public void setName(HSSFCell name) {
		this.name = name;
	}
	public HSSFCell getTeacher() {
		return teacher;
	}
	public void setTeacher(HSSFCell teacher) {
		this.teacher = teacher;
	}
	public HSSFCell getStart() {
		return start;
	}
	public void setStart(HSSFCell start) {
		this.start = start;
	}
	public HSSFCell getEnd() {
		return end;
	}
	public void setEnd(HSSFCell end) {
		this.end = end;
	}
	public HSSFCell getStartTime() {
		return startTime;
	}
	public void setStartTime(HSSFCell startTime) {
		this.startTime = startTime;
	}
	public HSSFCell getEndTime() {
		return endTime;
	}
	public void setEndTime(HSSFCell endTime) {
		this.endTime = endTime;
	}
	public HSSFCell getContent() {
		return content;
	}
	public void setContent(HSSFCell content) {
		this.content = content;
	}
	public HSSFCell getObject() {
		return object;
	}
	public void setObject(HSSFCell object) {
		this.object = object;
	}
	public HSSFCell getWay() {
		return way;
	}
	public void setWay(HSSFCell way) {
		this.way = way;
	}
	public HSSFCell getOpWeek() {
		return opWeek;
	}
	public void setOpWeek(HSSFCell opWeek) {
		this.opWeek = opWeek;
	}
	public HSSFCell getPlace() {
		return place;
	}
	public void setPlace(HSSFCell place) {
		this.place = place;
	}
	public HSSFCell getMax() {
		return max;
	}
	public void setMax(HSSFCell max) {
		this.max = max;
	}
	public HSSFCell getPrice() {
		return price;
	}
	public void setPrice(HSSFCell price) {
		this.price = price;
	}
	public HSSFCell getRoadName() {
		return RoadName;
	}
	public void setRoadName(HSSFCell roadName) {
		RoadName = roadName;
	}
	public HSSFCell getOpName() {
		return opName;
	}
	public void setOpName(HSSFCell opName) {
		this.opName = opName;
	}
	public HSSFCell getCallNum() {
		return callNum;
	}
	public void setCallNum(HSSFCell callNum) {
		this.callNum = callNum;
	}
	public HSSFCell getAcceptStart() {
		return acceptStart;
	}
	public void setAcceptStart(HSSFCell acceptStart) {
		this.acceptStart = acceptStart;
	}
	public HSSFCell getAcceptEnd() {
		return acceptEnd;
	}
	public void setAcceptEnd(HSSFCell acceptEnd) {
		this.acceptEnd = acceptEnd;
	}
	public HSSFCell getAcceptWay() {
		return acceptWay;
	}
	public void setAcceptWay(HSSFCell acceptWay) {
		this.acceptWay = acceptWay;
	}
	public HSSFCell getSelectWay() {
		return selectWay;
	}
	public void setSelectWay(HSSFCell selectWay) {
		this.selectWay = selectWay;
	}
	public HSSFCell getURL() {
		return URL;
	}
	public void setURL(HSSFCell uRL) {
		URL = uRL;
	}
}
