package com.bom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.bom.biz.LoginBiz;

@Controller
public class LoginController {
	
	
	@Autowired
	private LoginBiz biz;
	
	

}
