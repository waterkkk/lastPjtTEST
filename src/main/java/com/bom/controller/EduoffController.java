package com.bom.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class EduoffController extends HttpServlet {

       
	private static final Logger logger = LoggerFactory.getLogger(FreetableController.class);
  

	
	//교육게시판으로 이동
    @RequestMapping(value="eduoffList.do")
    public String eduoffList(Model model) {
    	return "Eduoff_list";
    }

	
	
}
