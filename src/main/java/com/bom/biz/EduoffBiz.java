package com.bom.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bom.dao.EduoffDao;
import com.bom.dto.EduoffDto;


@Service
public class EduoffBiz {

	@Autowired
	EduoffDao dao= new EduoffDao();
	
	public List<EduoffDto> selectAll() {
		return dao.selectAll();
	}
	
	
	public int delete() {
		return dao.delete();
	}
	
	public int insert(List<EduoffDto> dtos) {
		return dao.insert(dtos);
	}
	
	
// 검색	
	public List<EduoffDto> searchList(String searching2, String keyword2){
		return dao.searchList(searching2, keyword2);
	}
	
	
	public List<EduoffDto> selectFTAll(int startPost, int endPost) {
		return dao.selectFTAll(startPost, endPost);
	}

	
	public int getTotalCnt() {
		return dao.getTotalCnt();
	}
	
	
	
	
	
	
	
	
	
	
	
}
