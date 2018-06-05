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

	
    //2018.06.05 여기부터 보기  
	public String searchId(HttpServletResponse response, String member_email) throws Exception {
		
		
		return dao.searchId(member_email);
	}

	// 비밀번호찾기
	public LoginDto searchPw(String member_name, String member_email, String member_id) {
		LoginDto res = new LoginDto();

		Map<String, String> map = new HashMap<String, String>();
		map.put("member_name", member_name);
		map.put("member_email", member_email);
		map.put("member_id", member_id);

		try {
			res = sqlSession.selectOne(namespace + "searchPw", map);
			System.out.println("searchPw ok");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchPw error");
		}
		return res;
	}

	// 회원정보 업데이트
	public int infoUpdate(LoginDto dto) {
		return dao.infoUpdate(dto);
	}

	// 회원등급조정(y->n)
	public int enableUpdate(LoginDto dto) {
		return dao.enableUpdate(dto);
	}
}
