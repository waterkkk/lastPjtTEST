package com.bom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.servlet.ModelAndView;

import com.bom.biz.LoginBiz;
import com.bom.dto.LoginDto;

@Controller
public class LoginController {

	@Autowired
	private LoginBiz biz;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	// 로그인-1
	@RequestMapping(value = "loginStart.do")
	public String start(Model model) {
		return "Login/Login_start";
	}

	// 로그인-2
	@RequestMapping(value = "loginAjax.do", method = RequestMethod.POST)
	@ResponseBody // ->ajax 쓸때 
	// return되는 값을 일반적인 경로로 가는 것이 아니라 (view resolver->view로 가는 것이 아니라)
	// 서버로 간 뒤 바로 ajax로 response되는 객체 body에 결과를 담아서 보내준다.
	
	public Map<String, Boolean> loginAjax(HttpSession session, 
			@RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw) {
			System.out.println("member_id: "+member_id);
			System.out.println("member_pw: "+member_pw);
		LoginDto dto = new LoginDto(member_id, member_pw);
		LoginDto mapRes = biz.login(dto);

		boolean lc = false;
		if (mapRes != null) {
			lc = true;
			session.setAttribute("dto", mapRes);
			session.setAttribute("loginSuccess", mapRes);
		}

		Map<String, Boolean> rMap = new HashMap<String, Boolean>();
		rMap.put("lc", lc);
		System.out.println("lc:" + lc);
		return rMap;
	}

	// 로그인-3
	@RequestMapping("loginRes.do")
	public String loginRes(Model model, @RequestParam("member_id") String member_id,
			@RequestParam("member_pw") String member_pw) {
		String res = null;

		LoginDto parame = new LoginDto(member_id, member_pw);
		LoginDto dto = biz.login(parame);

		System.out.println("dto.getMember_role(): " + dto.getMember_role());
		System.out.println("dto.getMember_pw(): " + dto.getMember_pw());

		if (dto.getMember_id() != null || dto.getMember_pw() != null) {
			model.addAttribute("dto", dto);

			if (dto.getMember_role().equals("USER")) {
				res = "Login/Login_userMain";
			} else if (dto.getMember_role().equals("ADMIN")) {
				res = "Login/Login_adminMain";
			}
		}
		return res;
	}
	
	
	//로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest request) throws Exception{
		request.getSession().removeAttribute("dto");
		ModelAndView mav=new ModelAndView("main");	
		return mav;
	}

	// 아이디 찾기 :1.메인
	@RequestMapping(value = "searchId.do")
	public String searchId(Model model) {
		return "Login/Login_searchId";
	}

	// 아이디 찾기:2-1.전화번호로 찾기
	@RequestMapping(value = "searchIdByPhone.do")
	@ResponseBody
	public LoginDto searchByPhone(HttpSession session, @RequestParam String member_phone) {
		LoginDto res = new LoginDto();
		res = biz.searchIdByPhone(member_phone);
		System.out.println("member_id:" + res.getMember_id());

		return res;
	}

	// 아이디 찾기:2-2.이메일로 찾기
	@RequestMapping(value = "searchIdByEmail.do")
	@ResponseBody
	public LoginDto searchByEmail(HttpSession session, @RequestParam String member_email) {
		LoginDto res = new LoginDto();
		res = biz.searchIdByEmail(member_email);
		System.out.println("member_id:" + res.getMember_id());

		return res;
	}

	// 비밀번호 찾기: 1. 메인
	@RequestMapping("searchPw.do")
	public String searchPw(Model model) {
		return "Login/Login_searchPw";
	}

	// 비밀번호 찾기:2-1.전화번호로 찾기
	@RequestMapping(value = "searchPwByPhone.do")
	@ResponseBody
	public LoginDto searchPwByPhone(HttpSession session, @RequestParam String member_id,
			@RequestParam String member_phone) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_phone", member_phone);

		LoginDto mapRes2 = biz.searchPwByPhone(map);
		session.setAttribute("member_pw", mapRes2.getMember_pw());
		return mapRes2;
	}

	// 비밀번호 찾기:2-2.이메일로 찾기
	@RequestMapping(value = "searchPwByEmail.do")
	@ResponseBody
	public LoginDto searchPwByEmail(HttpSession session, @RequestParam String member_id,
			@RequestParam String member_email) {
		System.out.println("member_id:" + member_id);
		System.out.println("member_email:" + member_email);

		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_email", member_email);

		LoginDto mapRes2 = biz.searchPwByEmail(map);
		System.out.println("member_pw: " + mapRes2.getMember_pw());
		session.setAttribute("member_pw", mapRes2.getMember_pw());

		return mapRes2;
	}

	//가입여부조정  	y->n(확인)
	@RequestMapping(value="changeEnabled.do")
	public String changeEnabled(Model model, 
			@RequestParam("member_id") String member_id) {
		System.out.println("member_id : "+member_id);
		int res=0;
		String res2=null;
		res=biz.changeEnabled(member_id);
		if(res>0) {
			System.out.println("[controller]logout ok");
			res2="main";
		}else {
			System.out.println("[controller]logout error");
			res2="main";
		}
		return res2;
	}
}
