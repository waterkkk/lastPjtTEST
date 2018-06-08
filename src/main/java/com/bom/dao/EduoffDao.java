package com.bom.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bom.dto.EduoffDto;

@Repository
public class EduoffDao {
	
	private String namespace="Eduoff_mapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//강의명으로 검색하기
	public List<EduoffDto> EduoffName(String course_nm){
		List<EduoffDto> res= new ArrayList<EduoffDto>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("course_nm", course_nm);
		
		try {
			res=sqlSession.selectList(namespace+"EduoffName", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("EduoffName error");
		}		
		return res;
	}
	

}











