package com.bom.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bom.dao.NoticeBoardDao;
import com.bom.dto.NoticeBoardDto;

@Service
public class NoticeBoardBizImpl implements NoticeBoardBiz {
	
	@Autowired
	private NoticeBoardDao dao;

	@Override
	public List<NoticeBoardDto> selectAll() {
		return dao.selectAll();
	}

	@Override
	public NoticeBoardDto selectOne(int noticeboard_no) {
		return dao.selectOne(noticeboard_no);
	}

	@Override
	public int insert(NoticeBoardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(int noticeboard_no) {
		return dao.delete(noticeboard_no);
	}

	@Override
	public int update(NoticeBoardDto dto) {
		return dao.update(dto);
	}
	
	@Override
	public int readCount(int noticeboard_no) {
		return dao.readCount(noticeboard_no);
	}

}
