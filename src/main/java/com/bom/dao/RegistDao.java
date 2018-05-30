package com.bom.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bom.dto.RegistDto;

@Repository
public class RegistDao {
	private String regispace="Regist_mapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//회원정보입력
	public int insertUser(RegistDto dto) {
		int res = 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", dto.getMember_id());
		map.put("member_pw", dto.getMember_pw());
		map.put("member_name", dto.getMember_name());
		map.put("member_email", dto.getMember_email());
		map.put("member_phone", dto.getMember_phone());
		map.put("member_enabled", dto.getMember_enabled());
		map.put("member_role", dto.getMember_role());

		try {
			res = sqlSession.insert(regispace + "insertUser", map);
			if (res > 0) {
				sqlSession.commit();
			}
		} catch (Exception e) {
			System.out.println("insert error");
			e.printStackTrace();
		}
		return res;
	}
	
	
		
	
	
	
	
	

}
