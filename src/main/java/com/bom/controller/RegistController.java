package com.bom.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.biz.RegistBiz;
import com.bom.dao.RegistDao;
import com.bom.dto.RegistDto;

@Controller
public class RegistController {

	@Autowired
	private RegistBiz biz;
	private static final Logger logger = LoggerFactory.getLogger(RegistController.class);
	
	// 회원가입화면으로 이동 
	@RequestMapping(value="regiStart.do")
	public String regiStart(Model model) {
		return "Regist_start";
	}
	
	
	// id 중복체크
	@RequestMapping(value = "idChk.do")
	public String idChk(Model model, @RequestParam("member_id") String member_id) {
		RegistDto idChkDto = biz.idChk(member_id);
		boolean idNotUsed = true;
		
		// 객체 자체가 null이면 null.getId()는 불가능!
		if (idChkDto != null) {
			idNotUsed = false;
		}
		
		return "Regist_start";
	}
	
	//phone 중복체크
	@RequestMapping(value = "phoneChk.do")
	public String phoneChk(Model model, @RequestParam("member_phone") String member_phone) {
		RegistDto phoneChkDto = biz.phoneChk(member_phone);
		boolean phoneNotUsed = true;
		
		// 객체 자체가 null이면 null.getId()는 불가능!
		if (phoneChkDto != null) {
			phoneNotUsed = false;
		}
		return "redirect: phoneChk.do?phoneNotUsed=" + phoneNotUsed;
	}
	
	//email 중복체크
	@RequestMapping(value = "emailChk.do")
	public String emailChk(Model model, @RequestParam("member_email") String member_email) {
		RegistDto emailChkDto = biz.idChk(member_email);
		boolean emailNotUsed = true;
		
		// 객체 자체가 null이면 null.getId()는 불가능!
		if (emailChkDto != null) {
			emailNotUsed = false;
		}
		return "redirect: idChk.do?idNotUsed=" + emailNotUsed;
	}
}
