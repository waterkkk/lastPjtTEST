package com.bom.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bom.dao.FreecommDao;
import com.bom.dto.FreecommDto;

@Service
public class FreecommBiz {
	
	@Autowired
	FreecommDao dao= new FreecommDao();
	
	public List<FreecommDto> commSelectAll(int freetable_no) {
		return dao.commSelectAll(freetable_no);
	}
	
	
	public FreecommDto commSelectOne(int freetable_no) {
		return dao.commSelectOne(freetable_no);
	}
	

	
	public int commInsert(FreecommDto dto) {
		return dao.commInsert(dto);
	}
	
	public int stepUpdate(int freecomm_groupNo, int freecomm_step) {
		return dao.stepUpdate(freecomm_groupNo, freecomm_step);
	}
	
	public int insertReply2(FreecommDto dto) {
		return dao.insertReply2(dto);
	}
	
	
	
}
