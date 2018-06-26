package com.bom.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bom.dao.IndiDao;
import com.bom.dto.IndiDto;

@Service
public class IndiBziImpl implements IndiBiz {
	
	@Autowired
	IndiDao dao;
	
	@Override
	public List<IndiDto> getCallList(String id, String yyyyMMdd) {		
		return dao.getCallList(id, yyyyMMdd);
	}

	@Override
	public int insertCal(IndiDto dto) {
		return dao.insertCal(dto);
	}

	@Override
	public IndiDto getCalOne(int inNo) {
		return dao.getCalOne(inNo);
	}

	@Override
	public int updateCal(IndiDto dto) {
		return dao.updateCal(dto);
	}

	@Override
	public int deleteCal(int inNo) {
		return dao.deleteCal(inNo);
	}

	@Override
	public List<IndiDto> calViewList(String id, String yyyyMM) {
		return dao.calViewList(id, yyyyMM);
	}

}
