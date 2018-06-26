package com.bom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.biz.NoticBiz;
import com.bom.dto.NoticDto;
@Controller
public class NoticeController {
	@Autowired
	NoticBiz noticBiz;
	
	@RequestMapping(value="notice.do", method=RequestMethod.GET)
	public String notice(Model model, @RequestParam("currentPage") String currentPage) {
		int current = Integer.parseInt(currentPage);
		int countPost = noticBiz.countPost();
		int startPost = (current * 15) - 14;
		int endPost = current * 15;
		int startPage = (int)(((Math.ceil((current/9)))*9))+1;
		int endPage = (int)((((Math.ceil((current/9)))+1)*9));
		int before = (int)(Math.ceil((current/10))+1);
		int next = before + 9;
		int lastPage = 0;
		List<NoticDto> list = noticBiz.notice(startPost, endPost);
		if((countPost%10) == 0) {
			lastPage = (int)(Math.ceil(countPost/10));
		}else if((countPost%10)!=0) {
			lastPage = (int)(Math.ceil(countPost/10))+1;
		}
		if(lastPage <= endPage) {
			endPage = lastPage;
		}
		if(current == lastPage && (int)(countPost%10) != 0) {
			endPost = (int)(startPost+(countPost%10)-1);
		}
		model.addAttribute("list", list);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("current", current);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("before", before);
		model.addAttribute("next", next);
		return "notice/Notice_list";
	}
	@RequestMapping(value="insertForm.do", method=RequestMethod.GET)
	public String insertForm(Model model) {
		return "notice/Notice_insert";
	}
	@RequestMapping(value="noticeInsert.do", method=RequestMethod.GET) 
	public String insert(Model model, @RequestParam("id") String id,
			@RequestParam("writer") String writer, @RequestParam("title") String title, 
			@RequestParam("content") String content) {
			NoticDto dto = new NoticDto(id, writer, title, content);
			int res = noticBiz.noticeInsert(dto);
			if(res > 0) {			
				return "redirect:/notice.do?currentPage=1";
			}else {
				return "redirect:/insertForm.do";
			}
	}
	@RequestMapping(value="noticeOne.do", method=RequestMethod.GET)
	public String noticeOne(Model model, @RequestParam("no") String no) {
		int noticNo = Integer.parseInt(no);
		NoticDto dto = noticBiz.noticeOne(noticNo);
		
		model.addAttribute("list", dto);
		return "notice/Notice_detail";
	}
	@RequestMapping(value="upda.do", method=RequestMethod.GET)
	public String update(Model model, @RequestParam("no") String no) {
		int no1 = Integer.parseInt(no);
		NoticDto dto = noticBiz.noticeOne(no1);
		model.addAttribute("list", dto);
		
		return "notice/Notice_update";		
	}
	@RequestMapping(value="noticeUpdate.do", method=RequestMethod.GET)
	public String noticeUpdate(Model model, @RequestParam("no") String no, @RequestParam("title") String title, @RequestParam("content") String content) {
		int no1 = Integer.parseInt(no);
		NoticDto dto = new NoticDto();
		dto.setNoticeNo(no1);
		dto.setNoticeTitle(title);
		dto.setNoticeContent(content);
		int res = noticBiz.noticeUpdate(dto);
		if(res > 0) {
			return "redirect:/noticeOne.do?no="+no1;
		}else {
			return "redirect:/update.do?no="+no1;
		}
	}
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
	public String delete(Model model, @RequestParam("no") String no) {
		int no1 = Integer.parseInt(no);
		int res =  noticBiz.noticeDelete(no1);
		
		if(res > 0) {
			System.out.println("삭제 성공");
			return "redirect:/notice.do?currentPage=1";
		}else {
			System.out.println("삭제 실패");
			return "redirect:/noticeOne.do?no="+no1;
		}			
	}
}
