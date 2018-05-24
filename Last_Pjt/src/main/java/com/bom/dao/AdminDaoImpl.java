package com.bom.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bom.dto.AdminDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<AdminDto> selectAll() {
		List<AdminDto> list = new ArrayList<AdminDto>();
		
		try {
			list = sqlSession.selectList(namespace+"selectAll");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public AdminDto selectOne(String member_id) {
		AdminDto dto = new AdminDto();
		try {
			dto = sqlSession.selectOne(namespace+"selectOne",member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int insert(AdminDto dto) {
		int res = 0;
		try {
			dto = sqlSession.selectOne(namespace+"insert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(String member_id) {
		int res = 0;
		try {
			res = sqlSession.delete(namespace+"delete",member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(AdminDto dto) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"update",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public List<AdminDto> searchList(String Admin_search,String Admin_keyword){
		List<AdminDto> res = null;
		try {
			if (Admin_search.equals("member_id")) {
				System.out.println("[ID 검색]");
				Map<String, String> map = new HashMap<>();
				map.put("Admin_search", Admin_search);
				map.put("Admin_keyword", "%" + Admin_keyword + "%");
				res = sqlSession.selectList(namespace + "search", map);
			} else if (Admin_search.equals("member_name")) {
				System.out.println("[이름 검색]");
				Map<String, String> map = new HashMap<>();
				map.put("Admin_search", Admin_search);
				map.put("Admin_keyword", "%" + Admin_keyword + "%");
				res = sqlSession.selectList(namespace + "search", map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int roleUP(String member_id, String member_role) {
		int res = 0;
		
		Map<String, String> map = new HashMap<>();
		map.put("member_id", member_id);
		map.put("member_role", member_role);
		try {
			res = sqlSession.delete(namespace+"roleUP", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
}
}
