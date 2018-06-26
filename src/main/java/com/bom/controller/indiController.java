package com.bom.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.biz.IndiBiz;
import com.bom.dao.Util;
import com.bom.dto.IndiDto;

@Controller
public class indiController {
	@Autowired
	IndiBiz indiBiz;
	
	@RequestMapping(value="indi.do", method=RequestMethod.GET)
	public String indi(Model model,HttpServletRequest request, @RequestParam("id") String id) {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		String yyyyMM = year + Util.isTwo(String.valueOf(month));
		List<IndiDto> clist = indiBiz.calViewList(id, yyyyMM);
		model.addAttribute("clist", clist);
		request.setAttribute("clist", clist);
		
		return "indivisual/Individual_info";
	}
	@RequestMapping(value="List.do", method=RequestMethod.GET)
	public String list(Model model , HttpSession session, HttpServletRequest request, @RequestParam("id") String id, @RequestParam("year") String year, @RequestParam("month") String month, @RequestParam("date") String date) {
		String yyyyMMdd = year + Util.isTwo(month) + Util.isTwo(date);
		
		session.setAttribute("ymd", yyyyMMdd);
		
		List<IndiDto> list = indiBiz.getCallList(id, yyyyMMdd);
		
		model.addAttribute("list", list);
		
		return "indivisual/Individual_callist";
	}
	@RequestMapping(value="insert.do", method=RequestMethod.GET)
	public String insert(Model model, HttpServletRequest request ,HttpSession session, @RequestParam("id") String id, @RequestParam("year") String year, @RequestParam("month") String month, @RequestParam("date") String date, @RequestParam("hour") String hour, @RequestParam("min") String min, @RequestParam("title") String title, @RequestParam("content") String content) {
		String mDate =   year + Util.isTwo(month)
						+ Util.isTwo(date)
						+ Util.isTwo(hour)
						+Util.isTwo(min);
		IndiDto dto = new IndiDto(id, title, content, mDate);
		int res = indiBiz.insertCal(dto);
		System.out.println(dto.getInMdate());
		session.setAttribute("mdate", dto.getInMdate());
		if(res > 0) {
			return "redirect:/indi.do?id="+id;
		}else {
			return "redirect:/indi.do"+id;
		}
	}
	
	@RequestMapping(value="detail.do", method=RequestMethod.GET)
	   public String detail(Model model, @RequestParam("No") String No) {
	      int no = Integer.parseInt(No);
	      
	      IndiDto dto = indiBiz.getCalOne(no);
	      model.addAttribute("list", dto);
	      
	      return "indivisual/Individual_detail";   
	   }
	@RequestMapping(value="updat.do", method=RequestMethod.GET)
	public String update(Model model, @RequestParam("no") String no, @RequestParam("title") String title, @RequestParam("content") String content) {
		int No = Integer.parseInt(no);
		int res = indiBiz.updateCal(new IndiDto(No, title, content));
		
		if(res > 0) {
			return "redirect:/detail.do?No="+no;
		}else {
			return "redirect:/detail.do?No="+no;
		}
	}
	@RequestMapping(value="del.do", method=RequestMethod.GET)
	public String del(Model model, @RequestParam("No") String No, @RequestParam("id") String id) {
		int no = Integer.parseInt(No);
		
		int res = indiBiz.deleteCal(no);
		
		if(res > 0) {
			return "redirect://indi.do?id="+id;
		}else {
			return "redirect:/detail.do?No="+no;
		}
	}
}
