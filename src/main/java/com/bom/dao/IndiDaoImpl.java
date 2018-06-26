package com.bom.dao;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bom.dto.IndiDto;

@Repository
public class IndiDaoImpl implements IndiDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<IndiDto> getCallList(String id, String yyyyMMdd) {
		List<IndiDto> list = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("yyyyMMdd", yyyyMMdd);
		try {
			list = sqlSession.selectList(nameSpace + "calList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertCal(IndiDto dto) {
		int res = 0;
		try {
			res = sqlSession.insert(nameSpace + "calInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return res;
	}

	@Override
	public IndiDto getCalOne(int inNo) {
		IndiDto dto = null;
		try {
			dto = sqlSession.selectOne(nameSpace + "calDetail" , inNo); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int updateCal(IndiDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(nameSpace + "calUpdate", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int deleteCal(int inNo) {
		int res = 0;
		try {
			res = sqlSession.delete(nameSpace + "calDelete", inNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<IndiDto> calViewList(String id, String yyyyMM) {
		List<IndiDto> res = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("yyyyMM", yyyyMM);
		
		try {
			res = sqlSession.selectList(nameSpace + "calViewList", map);
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return res;
	}

}
