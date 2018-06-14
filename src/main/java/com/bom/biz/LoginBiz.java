package com.bom.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import com.bom.dao.LoginDao;
import com.bom.dto.LoginDto;

@Service
public class LoginBiz {
	String namespace = "Login_mapper.";

	@Autowired
	private LoginDao dao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 로그인
	public LoginDto login(LoginDto dto) {
		LoginDto res = new LoginDto();

		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", dto.getMember_id());
		map.put("member_pw", dto.getMember_pw());
		map.put("member_enabled", dto.getMember_enabled());

		try {
			res = sqlSession.selectOne(namespace + "login", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("login error");
		}
		return res;
	}
	

	
	// 아이디찾기 : 전화번호
	public LoginDto searchIdByPhone(String member_phone) { 
		return dao.searchIdByPhone(member_phone);
	}

	// 아이디찾기 : 이메일
	public LoginDto searchIdByEmail(String member_email) {
		return dao.searchIdByEmail(member_email);
	}	


	// 비밀번호찾기 : 전화번호
	public LoginDto searchPwByPhone(Map<String, String> map) {
		return dao.searchPwByPhone(map);
	}

	
	// 비밀번호찾기 : 이메일
	public LoginDto searchPwByEmail(Map<String, String> map) {
		return dao.searchPwByEmail(map);
	}

		
	// 회원정보 업데이트
	public int infoUpdate(LoginDto dto) {
		return dao.infoUpdate(dto);
	}

	
	//가입여부조정  	y->n(확인)
	public int changeEnabled(String member_id) {
		return dao.changeEnabled(member_id);
	}
	
}
