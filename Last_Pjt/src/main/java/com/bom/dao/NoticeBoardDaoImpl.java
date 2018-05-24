package com.bom.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bom.dto.NoticeBoardDto;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeBoardDto> selectAll() {
		List<NoticeBoardDto> list = new ArrayList<NoticeBoardDto>();
		
		try {
			list = sqlSession.selectList(namespace+"selectAll");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public NoticeBoardDto selectOne(int noticeboard_no) {
		NoticeBoardDto dto = new NoticeBoardDto();
		try {
			dto = sqlSession.selectOne(namespace+"selectOne",noticeboard_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(NoticeBoardDto dto) {
		int res = 0;
		try {
			dto = sqlSession.selectOne(namespace+"insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int noticeboard_no) {
		int res = 0;
		try {
			res = sqlSession.delete(namespace+"delete",noticeboard_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(NoticeBoardDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"update",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int readCount(int noticeboard_no) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"readCount",noticeboard_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
}
