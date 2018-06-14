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
	
	
	public FreecommDto commSelectOne(int freecomm_no) {
		return dao.commSelectOne(freecomm_no);
	}
	
	public int commInsert(FreecommDto dto) {
	return dao.commInsert(dto);
}
	
	public boolean delReply(int freecomm_no) {
	return dao.delReply(freecomm_no);
}
	
	public boolean updateStep2(int freecomm_groupNo, int freecomm_step) {
		return dao.updateStep2(freecomm_groupNo, freecomm_step);
	}
	
	public boolean insertReply2(FreecommDto dto, int parentFreeNo) {
		
		boolean res=false;
		//0) 부모글 정보 가져오기 
		FreecommDto parent2= dao.commSelectOne(parentFreeNo);
		//1) 두번째답글 달기전에 기존답글 step밀어주기: [groupNo 같고 step이 하나 많은 글이 있으면]이글의 step을 +1 
		boolean stepUp2 = dao.updateStep2(parent2.getFreecomm_groupNo(),parent2.getFreecomm_step());
		//2) 두번째답글달기: 부모글의 step+1, titletab+1
		dto.setFreecomm_groupNo(parent2.getFreecomm_groupNo());
		dto.setFreecomm_step(parent2.getFreecomm_step()+1);
		dto.setFreecomm_titleTab(parent2.getFreecomm_titleTab()+1);
		
		res=dao.insertReply2(dto);
		return res;
	}
	
	
	
}
