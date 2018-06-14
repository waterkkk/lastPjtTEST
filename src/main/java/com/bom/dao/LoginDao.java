package com.bom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bom.dto.LoginDto;

@Repository
public class LoginDao {
	String namespace = "Login_mapper.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	

	

	// 아이디 찾기:전화번호로 찾기
	public LoginDto searchIdByPhone(String member_phone) {
		System.out.println("member_phone: " + member_phone);
		LoginDto res = new LoginDto();

		try {
			res = sqlSession.selectOne(namespace + "searchIdByPhone", member_phone);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchIdByPhone error");
		}
		return res;
	}

	// 아이디 찾기:이메일로 찾기
	public LoginDto searchIdByEmail(String member_email) {
		System.out.println("member_email: " + member_email);
		LoginDto res = new LoginDto();

		try {
			res = sqlSession.selectOne(namespace + "searchIdByEmail", member_email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchIdByEmail error");
		}
		return res;
	}

	// 비밀번호 찾기:전화번호로 찾기
	public LoginDto searchPwByPhone(Map<String, String> map) {
		LoginDto res = new LoginDto();
				try {
			res = sqlSession.selectOne(namespace + "searchPwByPhone", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	// 비밀번호 찾기:이메일로 찾기
	public LoginDto searchPwByEmail(Map<String, String> map) {
		LoginDto res = new LoginDto();
		try {
			res = sqlSession.selectOne(namespace + "searchPwByEmail", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	// 회원정보 업데이트(확인)
	public int infoUpdate(LoginDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(namespace + "infoUpdate", dto);
			System.out.println("info updated.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error:info not updated.");
		}
		return res;
	}

	//가입여부조정  	y->n(확인)
	public int changeEnabled(String member_id) {
		int res = 0;
		try {
			res = sqlSession.update(namespace + "changeEnabled", member_id);
			System.out.println("[Dao]changeEnabled ok.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("[Dao]changeEnabled error.");
		}
		return res;
	}

}
