package com.bom.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bom.dto.NoticeBoardDto;

public interface NoticeBoardDao {
	
	String namespace = "noticeBoard.";
	
	public List<NoticeBoardDto> selectAll();
	public NoticeBoardDto selectOne(int noticeboard_no);
	public int insert(NoticeBoardDto dto);
	public int delete(int noticeboard_no);
	public int update(NoticeBoardDto dto);
	public int readCount(int noticeboard_no);

}
