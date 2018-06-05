package com.bom.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	@RequestMapping(value = "regiStart.do")
	public String regiStart(Model model) {
		return "Regist_start";
	}

	
	// 회원추가
	@RequestMapping(value = "insertUser.do")
	public String insertUser(Model model, 
			@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw, 
			@RequestParam("member_pw2") String member_pw2,
			@RequestParam("member_name") String member_name, 
			@RequestParam("member_email") String member_email,
			@RequestParam("member_phone") String member_phone) {
		
		if ((member_pw).equals(member_pw2)) {
			RegistDto dto = new RegistDto(0, member_id, member_pw, 
					member_name, member_email, member_phone, "Y", "USER");
			
			int res = biz.insertUser(dto);
			
			if (res > 0) {
				System.out.println("가입 완료");
				return "Regist_ok";
			} else {
				System.out.println("가입 실패");
				return "Login_start";
			}
		}else {
			System.out.println("비밀번호를 다시 입력해 주세요.");
			return "Login_start";
		}
	}
	
	//가입완료-로그인화면으로 
	@RequestMapping(value="userMain.do")
	public String userMain(Model model) {
		return "Login_start";
	}
	

	// id 중복체크
	@RequestMapping(value = "idChk.do")
	public String idChk(Model model, @RequestParam("member_id") String member_id) {
		
		RegistDto idChkDto = biz.idChk(member_id);
	
		boolean idNotUsed = true;
		// 객체 자체가 null이면 null.getId()는 불가능!
		System.out.println("test3");
		if (idChkDto != null) {
			idNotUsed = false;
		}
		System.out.println("test-idNotUsed:"+idNotUsed);
		System.out.println("test-member_id:"+member_id);
		// controller에서 idNotUsed를 못넘겨준다. 여기부터 할것.
		return "Regist_idchk? idNotUsed="+idNotUsed;
	}

	
	// phone 중복체크
	@RequestMapping(value = "phoneChk.do")
	public String phoneChk(Model model, @RequestParam("member_phone") String member_phone) {
		RegistDto phoneChkDto = biz.phoneChk(member_phone);
		boolean phoneNotUsed = true;

		// 객체 자체가 null이면 null.getphone()는 불가능!
		if (phoneChkDto != null) {
			phoneNotUsed = false;
		}
		return "redirect: phoneChk.do?phoneNotUsed=" + phoneNotUsed;
	}

	
	// email 중복체크
	@RequestMapping(value = "emailChk.do")
	public String emailChk(Model model, @RequestParam("member_email") String member_email) {
		RegistDto emailChkDto = biz.idChk(member_email);
		boolean emailNotUsed = true;

		// 객체 자체가 null이면 null.getId()는 불가능!
		if (emailChkDto != null) {
			emailNotUsed = false;
		}
		return "redirect: emailChk.do?emailNotUsed=" + emailNotUsed;
	}
	
	
	@RequestMapping(value="login")
	public String login(Model model) {
	return "Login_start";
	}
}
