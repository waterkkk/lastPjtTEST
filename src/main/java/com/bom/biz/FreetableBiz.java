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

	
	public FreetableDto selectOne(String freetable_id) {
		boolean read = dao.updateReadCount(freetable_id);
		if (read) {
			System.out.println("조회수+1");
		}
		FreetableDto res = dao.selectOne(freetable_id);
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

	
	public boolean insertReply(FreetableDto dto, String ParentFreetable_id) {
		FreetableDto parent = dao.selectOne(ParentFreetable_id);
		boolean stepUp = dao.updateStep(parent.getFreetable_groupNo(), parent.getFreetable_step());
		dto.setFreetable_groupNo(parent.getFreetable_groupNo());
		dto.setFreetable_step(parent.getFreetable_step() + 1);
		dto.setFreetable_titleTab(parent.getFreetable_titleTab() + 1);

		boolean res = dao.insertReply(dto);
		return res;
	}

}
