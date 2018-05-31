package com.bom.biz;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bom.dao.LoginDao;
import com.bom.dto.LoginDto;

@Service
public class LoginBiz {
	String loginspace = "Login_mapper.";

	@Autowired
	private LoginDao dao;

	@Autowired
	private SqlSessionTemplate sqlSession;

	//로그인
	public LoginDto Login(LoginDto dto) {
		LoginDto res = new LoginDto();

		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", dto.getMember_id());
		map.put("member_pw", dto.getMember_pw());
		map.put("member_enabled", "Y");

		try {
			res = sqlSession.selectOne(loginspace + "login", map);
			System.out.println("login ok");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("login error");
		}
		return res;
	}

	// 아이디찾기
	public LoginDto idFind(String member_name, String member_email) {
		// public LoginDto idFind(LoginDto dto ) { // 이것도 되나 해볼것
		LoginDto res = new LoginDto();

		Map<String, String> map = new HashMap<String, String>();
		map.put("member_name", member_name);
		map.put("member_email", member_email);

		try {
			res = sqlSession.selectOne(loginspace + "idFind" + map);
			System.out.println("idFind ok");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("idFind error");
		}
		return res;
	}

	// 비밀번호찾기
	public LoginDto passFind(String member_name, String member_email, String member_id) {
		LoginDto res = new LoginDto();

		Map<String, String> map = new HashMap<String, String>();
		map.put("member_name", member_name);
		map.put("member_email", member_email);
		map.put("member_id", member_id);

		try {
			res = sqlSession.selectOne(loginspace + "passFind", map);
			System.out.println("passFind ok");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("passFind error");
		}
		return res;
	}

	//회원정보 업데이트
	public int infoUpdate(LoginDto dto) {
		return dao.infoUpdate(dto);
	}

	//회원등급조정(y->n)
	public int enableUpdate(LoginDto dto) {
		return dao.enableUpdate(dto);
	}
}
