package com.bom.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.dto.EduoffDto;


@Controller
public class EduoffController extends HttpServlet {

       
	private static final Logger logger = LoggerFactory.getLogger(FreetableController.class);
  
    @RequestMapping(value="eduoffList.do")
    public String eduoffList(Model model) {
    	return "Eduoff_list";
    }
    
    @RequestMapping(value="firstDB.do")
    public String firstDB(Model model,
    		@RequestParam("eduoff") String[] eduoffList) {
    	for (int i = 0; i < eduoffList[i].length; i++) {
	String[] eduoffOne=eduoffList[i].split("/");
	
	
	EduoffDto dto= new EduoffDto();
	dto.setCourse_id(eduoffOne[0]);
	dto.setCourse_nm(eduoffOne[1]);
	dto.setCourse_request_str_dt(eduoffOne[2]);
	dto.setCourse_request_end_dt(eduoffOne[3]);
	dto.setCourse_str_dt(eduoffOne[4]);
	dto.setCourse_end_dt(eduoffOne[5]);
	dto.setCapacity(eduoffOne[6]);
	dto.setCourse_apply_url(eduoffOne[7]);
	
	list.add(dto);
}
    	return "";
    }
	
	
}
