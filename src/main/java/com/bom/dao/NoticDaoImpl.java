package com.bom.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bom.dto.NoticDto;
@Repository
public class NoticDaoImpl implements NoticDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticDto> notice(int startPost, int endPost) {
		List<NoticDto> list = new ArrayList<NoticDto>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startPost", startPost);
		map.put("endPost", endPost);
		try {
			list = sqlSession.selectList(namespace + "notice", map);
			System.out.println("list ok");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("list error");
		}
		return list;
	}

	@Override
	public NoticDto noticeOne(int no) {
		NoticDto dto = new NoticDto();
		try {
			dto = sqlSession.selectOne(namespace + "noticeOne", no);
			System.out.println("check ok");
		} catch (Exception e) {
			System.out.println("check error");
		}
		return dto;
	}

	@Override
	public int noticeInsert(NoticDto dto) {
		int ins = 0;
		
		try {
			ins = sqlSession.insert(namespace + "noticeInsert", dto);
			System.out.println("insert complete");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert error");
		}
		
		return ins;
	}

	@Override
	public int noticeUpdate(NoticDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace + "noticeUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int noticeDelete(int no) {
		int res = 0;
		try {
			res =sqlSession.delete(namespace + "noticeDelete", no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	@Override
	public int ReadCount(int no) {
		int res = 0;
		try {
			sqlSession.update(namespace + "readCount", no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int countPost() {
		NoticDto res = null;
		
		try {
			res = sqlSession.selectOne(namespace + "countPost");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res.getNoticeNo();
	}

}
