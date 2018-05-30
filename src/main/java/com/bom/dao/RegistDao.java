package com.bom.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bom.dto.RegistDto;

@Repository
public class RegistDao {
	private String regispace="Regist_mapper.";
	
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
	
	//id 중복체크
	public RegistDto idChk(String member_id) {
		RegistDto res= new RegistDto();
		Map<String,String> map=new HashMap<String,String>();
		map.put("member_id", member_id);
		
		try {
			res=sqlSession.selectOne(regispace+"idChk",map);
			System.out.println("idchk returned");
		} catch (Exception e) {
			System.out.println("idchk error");
			e.printStackTrace();
		}
		return res;
	}
	
	
	//email 중복체크
		public RegistDto emailChk(String member_email) {
			RegistDto res= new RegistDto();
			Map<String,String> map=new HashMap<String,String>();
			map.put("member_email", member_email);
			
			try {
				res=sqlSession.selectOne(regispace+"emailChk",map);
				System.out.println("emailChk returned");
			} catch (Exception e) {
				System.out.println("emailChk error");
				e.printStackTrace();
			}
			return res;
		}
		
		
		//phone 중복체크
		public RegistDto phoneChk(String member_phone) {
			RegistDto res= new RegistDto();
			Map<String,String> map=new HashMap<String,String>();
			map.put("member_phone", member_phone);
			
			try {
				res=sqlSession.selectOne(regispace+"phoneChk",map);
				System.out.println("phoneChk returned");
			} catch (Exception e) {
				System.out.println("phoneChk error");
				e.printStackTrace();
			}
			return res;
		}
		
	
	
	
	
	

}
