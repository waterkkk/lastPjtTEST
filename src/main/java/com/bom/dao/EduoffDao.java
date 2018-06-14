package com.bom.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import com.bom.dto.EduoffDto;


@Repository
public class EduoffDao {
	
	private String namespace="Eduoff_mapper.";
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<EduoffDto> selectAll() {
		List<EduoffDto> res = new ArrayList<EduoffDto>();
		try {		
			res = sqlSession.selectList(namespace + "selectAll");
			System.out.println("selectAll");
		} catch (Exception e) {
			System.out.println("selectAll error");
			e.printStackTrace();
		} 
		return res;
	}

	
	public int insert(List<EduoffDto> dtos) {
		int res = 0;

		try {
			res = sqlSession.insert(namespace + "insert", dtos);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insert error");
		}
		return res; // 쿼리에러 확인
	}
	
	
	public int delete() {
	int res=0;
	try {
		res=sqlSession.delete(namespace+"delete"); //parameter는? 확인
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("delete error");
	}
	return res;
	}


	
	// 검색
		public List<EduoffDto> searchList(String searching2, String keyword2){
			List<EduoffDto> res= new ArrayList<EduoffDto>();
			Map<String,String> map=new HashMap<String,String>();
			map.put("searching2", searching2);
			map.put("keyword2", keyword2);
			System.out.println("dao searching2:"+searching2);
			System.out.println("dao keyword2:"+keyword2);
			try {
				res=sqlSession.selectList(namespace+"searchList",map);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("searchList error");
			}
			return res;
		}
	

	// paging-1
	public List<EduoffDto> selectFTAll(int startPost, int endPost) {
		List<EduoffDto> res = new ArrayList<EduoffDto>();
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startPost", startPost);
		map.put("endPost", endPost);

		try {
			System.out.println("selectFTAll");
			res = sqlSession.selectList(namespace + "paging", map);
		} catch (Exception e) {
			System.out.println("selectFTAll error");
			e.printStackTrace();
		} 
		return res;
	}

	
	// paging-2 : 글 갯수 구하기
	public int getTotalCnt() {
		int res = 0;
		try {
			System.out.println("getTotalCnt");
			res = sqlSession.selectOne(namespace + "getTotalCnt");
		} catch (Exception e) {
			System.out.println("getTotalCnt error");
			e.printStackTrace();
		} 
		return res;
	}

	
	
	

	
	
	
	
	
	
	
	
	
}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	












