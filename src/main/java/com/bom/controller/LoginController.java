package com.bom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
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

import com.bom.biz.LoginBiz;
import com.bom.dto.LoginDto;

@Controller
public class LoginController {
	
	
	@Autowired
	private LoginBiz biz;	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	@RequestMapping(value="loginStart.do")
	public String start(Model model) {		
		return "Login_start";
	}
	
	@RequestMapping(value="loginAjax.do")
	@ResponseBody
	// return되는 값을 일반적인 경로로 가는 것이 아니라 (view resolver-view로 가는 것이 아니라)
	// 서버로 간 뒤  바로 ajax로 response되는애의 객체 body에 rMap을 담아서 보내준다. 
	//->ajax 쓸때는  @ResponseBody가 붙음!
	
	public Map<String,Boolean> loginAjax(HttpSession session, 
			@RequestParam("member_id") String member_id, 
			@RequestParam ("member_pw") String member_pw ){ 

		LoginDto dto =new LoginDto(member_id, member_pw);
		LoginDto mapRes =biz.login(dto);
			
		boolean lc=false;
		if(mapRes!=null) {
			lc=true;
			session.setAttribute("dto", mapRes);
		}

		Map<String, Boolean> rMap= new HashMap<String, Boolean>();
		rMap.put("lc", lc);
			System.out.println("lc:"+lc);
		return rMap;
	}
	
	
	@RequestMapping("loginRes.do")
	public String loginRes(Model model, @RequestParam("member_id") 
	String member_id, @RequestParam("member_pw") String member_pw) {
		String res=null;	
	
		LoginDto parame= new LoginDto(member_id, member_pw);
		LoginDto dto=biz.login(parame);
		
		System.out.println("dto.getMember_role(): "+dto.getMember_role());
		System.out.println("dto.getMember_pw(): "+ dto.getMember_pw());
		
		if (dto.getMember_id() != null || dto.getMember_pw() != null) {
			model.addAttribute("dto", dto);
		
		if (dto.getMember_role().equals("USER")) {
				res= "Login_userMain";		
			}else if (dto.getMember_role().equals("ADMIN")) {
				res= "Login_adminMain";			
				}
		} 
		return res;
	}
		
	
	
	
	@RequestMapping(value="searchId.do")
	public String searchId(Model model) {
		return "Login_searchId";
	}	
	
	
	@RequestMapping(value="searchIdx.do")
	@ResponseBody
	public String searchIdx(Model model, @ModelAttribute LoginDto dto) {
		System.out.println(dto.toString());
		
		ArrayList<String> emailList =biz.searchId(dto);
		System.out.println(emailList.toString());
		System.out.println(emailList.get(0));
		String findEmail="{\"member_email\":\""+emailList+"\"}";
		System.out.println(findEmail);
				return findEmail;
	}
	
	@RequestMapping("searchPw.do")
	public String searchPw(Model model) {
		return "Login_searchPw";
	}	
}
