package com.bom.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bom.dto.RegistDto;

@Repository
public class RegistDao {
	private String namespace="Regist_mapper.";
	
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
		
	

		try {
			res = sqlSession.insert(namespace + "insertUser", map);
			
		} catch (Exception e) {
			System.out.println("insert error");
			e.printStackTrace();
		}
		return res;
	}
	
	// id 중복체크
		public RegistDto idChk(String member_id) {
			RegistDto res=new RegistDto();
			try { 
				res = sqlSession.selectOne(namespace + "idChk", member_id);
				System.out.println("idChk ok");
			} catch (Exception e) {
				System.out.println("idChk error");
				e.printStackTrace();
			}
			return res;
		}
	
	
		
	
	
	
	
	

}
