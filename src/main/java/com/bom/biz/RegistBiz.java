package com.bom.biz;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bom.dao.RegistDao;
import com.bom.dto.RegistDto;

@Service
public class RegistBiz {
	private String namespace = "Regist_mapper.";

	@Autowired
	private RegistDao dao;

	
	// 회원정보 입력
	public int insertUser(RegistDto dto) {
		return dao.insertUser(dto);
	}

	
	//아이디 중복체크
	public RegistDto idChk(String member_id) {
		return dao.idChk(member_id);
	}

}
