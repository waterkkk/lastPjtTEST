package com.bom.dao;

import java.util.HashMap;
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

	//회원정보 업데이트	
	public int infoUpdate(LoginDto dto) {
		int res = 0;

		try {
			res=sqlSession.update(namespace+"infoUpdate",dto);
			System.out.println("info updated.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error:info not updated.");
		}
		return res;
	}

	//회원등급조정(y->n)
	public int enableUpdate(LoginDto dto) {
		int res=0;
	
		try {
			res=sqlSession.update(namespace+"enabledUpdate",dto);
			System.out.println("enabled updated.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("error:enabled not updated.");
		}
		return res;
	}
	
	
}









