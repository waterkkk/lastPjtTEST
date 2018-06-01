package com.bom.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bom.biz.LoginBiz;

@Controller
public class LoginController {
	
	
	@Autowired
	private LoginBiz biz;	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	
	@RequestMapping(value="loginStart.do")
	public String start(Model model) {
		
		return "Login_start";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
