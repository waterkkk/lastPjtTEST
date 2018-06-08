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

	// 회원정보 업데이트
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

	// 회원등급조정(y->n)
	public int enableUpdate(LoginDto dto) {
		int res = 0;

		try {
			res = sqlSession.update(namespace + "enabledUpdate", dto);
			System.out.println("enabled updated.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error:enabled not updated.");
		}
		return res;
	}

	// 아이디찾기: 전화번호
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

	// 아이디찾기: 이메일
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

	// 비밀번호찾기: 전화번호
	public LoginDto searchPwByPhone(Map<String, String> map) {
		LoginDto res = new LoginDto();
				try {
			res = sqlSession.selectOne(namespace + "searchPwByPhone", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	// 비밀번호찾기: 이메일
	public LoginDto searchPwByEmail(Map<String, String> map) {
		LoginDto res = new LoginDto();
		try {
			res = sqlSession.selectOne(namespace + "searchPwByEmail", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
