package com.bom.biz;

import java.util.List;

import com.bom.dto.IndiDto;

public interface IndiBiz {
	public List<IndiDto> getCallList(String id, String yyyyMMdd);
	public int insertCal(IndiDto dto);
	public IndiDto getCalOne(int inNo);
	public int updateCal(IndiDto dto);
	public int deleteCal(int inNo);
	public List<IndiDto> calViewList(String id, String yyyyMM);
}
