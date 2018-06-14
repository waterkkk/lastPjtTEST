package com.bom.biz;

import com.bom.dto.*;
import com.bom.dao.FreetableDao;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreetableBiz {
	
	@Autowired
	private FreetableDao dao;

	

	public List<FreetableDto> selectFTAll(int startPost, int endPost) {
		return dao.selectFTAll(startPost, endPost);
	}

	
	public int getTotalCnt() {
		return dao.getTotalCnt();
	}

	
	public List<FreetableDto> selectAll() {
		return dao.selectAll();
	}

	
	public FreetableDto selectOne(int freetable_no) {
		boolean read = dao.updateReadCount(freetable_no);
		if (read) {
			System.out.println("조회수+1");
		}
		FreetableDto res = dao.selectOne(freetable_no);
		return res;
	}
	


	
	public boolean insert(Map<String,String> map) {
		return dao.insert(map);
	}

	
	public boolean update(FreetableDto dto) {
		return dao.update(dto);
	}

	
	public boolean delete(int freetable_no) {
		return dao.delete(freetable_no);
	}

	
	public boolean insertReply(FreetableDto dto, int parentfreetableNo) {
		//0) 부모글 정보 가져오기 
		FreetableDto parent = dao.selectOne(parentfreetableNo);
		//1) 두번째답글 달기전에 기존답글 step밀어주기: [groupNo 같고 step이 하나 많은 글이 있으면]이글의 step을 +1 
		boolean stepUp = dao.updateStep(parent.getFreetable_groupNo(), parent.getFreetable_step());
		//2) 두번째답글달기: 부모글의 step+1, titletab+1
		dto.setFreetable_groupNo(parent.getFreetable_groupNo());
		dto.setFreetable_step(parent.getFreetable_step() + 1);
		dto.setFreetable_titleTab(parent.getFreetable_titleTab() + 1);

		boolean res = dao.insertReply(dto);
		return res;
	}
	
	public List<FreetableDto> searchList(String searching, String keyword){
		return dao.searchList(searching,keyword);
	}

}
