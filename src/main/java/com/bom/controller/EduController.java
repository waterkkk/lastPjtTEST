package com.bom.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.biz.EducationBiz;
import com.bom.biz.EducationBizImpl;
import com.bom.biz.EducationNameBiz;
import com.bom.biz.EducationNameBizImpl;
import com.bom.biz.EducationTeacherBiz;
import com.bom.biz.EducationTeacherBizImpl;
import com.bom.dto.EduSearchDto;
import com.bom.dto.EducDto;

@Controller
public class EduController {
	@RequestMapping(value="edu.do", method=RequestMethod.GET)
	public String education(Model model, HttpServletRequest request, @RequestParam("currentPage") String currentPage) throws FileNotFoundException, IOException {
		String fileName ="C:\\SpringWorkspace\\Last_Pjt_180620_01_gathered\\src\\main\\resources\\xls\\전국평생학습강좌표준데이터_온라인.xls";
		EducationBiz biz = new EducationBizImpl();
		List<EducDto> list = biz.education(fileName);
		int total = list.size();
		int current = Integer.parseInt(currentPage);
		int start = (current * 10) - 9;
		int end = (current * 10) - 1;
		int startPage = (int)(((Math.ceil((current/9)))*9))+1;
		int endPage = (int)((((Math.ceil((current/9)))+1)*9));
		int before = (int)(Math.ceil((current/10)))+1;
		int lastPage = 0;
		if((total%10) == 0) {
			lastPage = (int)(Math.ceil(total/10));
		}else if((total%10)!=0) {
			lastPage = (int)(Math.ceil(total/10))+1;
		}
		if(lastPage <= endPage) {
			endPage = lastPage;
		}
		if(current == lastPage && (int)(total%10) != 0) {
			end = (int)(start+((total)%10)-2);
		}
		System.out.println(endPage);
		System.out.println(start);
		System.out.println(end);
		System.out.println(list.size());
	
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("current", current);
		model.addAttribute("before", before);
		model.addAttribute("list", list);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		return "education/Education_list";
	}
	@RequestMapping(value="Search.do", method= RequestMethod.GET)
	public String Search(Model model, @RequestParam("currentPage") String currentPage, @RequestParam("search")  String search, @RequestParam("kind") String kind) throws FileNotFoundException, IOException {
		String fileName ="C:\\\\SpringWorkspace\\\\Last_Pjt_180620_01_gathered\\\\src\\\\main\\\\resources\\\\xls\\\\전국평생학습강좌표준데이터_온라인.xls";
		List<EducDto> clist = null;
		if(kind.equals("teacher")) {
			EducationTeacherBiz biz = new EducationTeacherBizImpl();
			clist = biz.educationTeacher(fileName, search);
		}else if(kind.equals("name")){
			EducationNameBiz biz = new EducationNameBizImpl();
			clist = biz.educationName(fileName, search);
		}
		int total = clist.size();
		int current = Integer.parseInt(currentPage);
		int start = (current * 10) - 9;
		int end = (current * 10) - 1;
		int startPage = (int)(((Math.ceil((current/9)))*9))+1;
		int endPage = (int)((((Math.ceil((current/9)))+1)*9));
		int before = (int)(Math.ceil((current/10)))+1;
		int next = before + 9;
		int lastPage = 0;
		if((total%10) == 0) {
			lastPage = (int)(Math.ceil(total/10));
		}else if((total%10)!=0) {
			lastPage = (int)(Math.ceil(total/10))+1;
		}
		if(lastPage <= endPage) {
			endPage = lastPage;
		}
		if(current == lastPage && (int)(total%10) != 0) {
			end = (int)(start+((total)%10)-2);
		}
		
		System.out.println(endPage);
		System.out.println(start);
		System.out.println(end);
		System.out.println(clist.size());
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("current", current);
		model.addAttribute("before", before);
		model.addAttribute("next", next);
		model.addAttribute("slist", clist);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("search", search);
		model.addAttribute("kind", kind);
		return "education/Education_list";
	}
}
