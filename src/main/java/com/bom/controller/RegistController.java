package com.bom.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "Regist/Regist_start";
	}

	
	// 회원정보 입력
	@RequestMapping(value = "insertUser.do")
	@ResponseBody
	public int insertUser(Model model, 
			@RequestParam String member_id,
			@RequestParam String member_pw, 
			@RequestParam String member_name, 
			@RequestParam String member_email,
			@RequestParam String member_phone
			) {
		System.out.println("rest");
		   int res=0;
			RegistDto dto = new RegistDto(0, member_id, member_pw,
					member_name, member_email, member_phone, "Y", "USER" );
			
			res = biz.insertUser(dto);
			System.out.println("res:"+res);
			System.out.println("test-member_email:"+member_email);
			System.out.println("test-member_id:"+member_id);
			if (res > 0) {
				System.out.println("가입 완료");
				
			} else {
				System.out.println("가입 실패");
				
			}
			return res;
		}
	


	// id 중복체크
	@RequestMapping(value = "idChk.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Boolean> idChk(Model model, 
			@RequestParam("member_id") String member_id) {
		
		RegistDto idChkDto = biz.idChk(member_id);
		boolean idNotUsed = true;	
	
		 if (idChkDto !=null) {
			idNotUsed = false;
		}
		
		Map<String,Boolean> map=new HashMap<String,Boolean>();
		map.put("idNotUsed", idNotUsed); 
		
		model.addAttribute("idNotUsed",idNotUsed);
		System.out.println("test-idNotUsed:"+idNotUsed);
		System.out.println("test-member_id:"+member_id);
		return map;
	}	
	
	//가입완료
	@RequestMapping(value="login")
	public String login(Model model) {
	return "Login/Login_start";
	}
}
