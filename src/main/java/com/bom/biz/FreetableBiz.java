package com.bom.biz;

import com.bom.dto.*;
import com.bom.dao.FreetableDao;
import java.util.List;
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
	

	public boolean insert(FreetableDto dto) {
		return dao.insert(dto);
	}

	
	public boolean update(FreetableDto dto) {
		return dao.update(dto);
	}

	
	public boolean delete(String freetable_id) {
		return dao.delete(freetable_id);
	}

	
	public boolean insertReply(FreetableDto dto, int parentfreetableNo) {
		FreetableDto parent = dao.selectOne(parentfreetableNo);
		boolean stepUp = dao.updateStep(parent.getFreetable_groupNo(), parent.getFreetable_step());
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
