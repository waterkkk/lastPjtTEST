package com.bom.dao;

import java.util.List;

import com.bom.dto.IndiDto;

public interface IndiDao {
	String nameSpace = "mapper.";
	public List<IndiDto> getCallList(String id, String yyyyMMdd);
	public int insertCal(IndiDto dto);
	public IndiDto getCalOne(int inNo);
	public int updateCal(IndiDto dto);
	public int deleteCal(int inNo);
	public List<IndiDto> calViewList(String id, String yyyyMM);
}
