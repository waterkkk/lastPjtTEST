//package com.bom.controller;
//
//import java.text.DateFormat;
//import java.util.Date;
//import java.util.List;
//import java.util.Locale;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//import com.bom.biz.NoticeBoardBiz;
//import com.bom.dto.NoticeBoardDto;
//
//@Controller
//public class NoticeBoardController {
//	
//	@Autowired
//	NoticeBoardBiz biz;
//	
//	private static final Logger logger = LoggerFactory.getLogger(NoticeBoardController.class);
//	
//	@RequestMapping(value = "NoticeBoard_list.do")
//	public String list(Model model) {
//		
//		System.out.println("123");
//		List<NoticeBoardDto> list = biz.selectAll();
//		model.addAttribute("NoticeBoard_list", list);
//
//		return "NoticeBoard_list";
//	}
//	
//	@RequestMapping(value = "NoticeBoard_detail.do")
//	public String detail(Model model,@RequestParam("member_id") int noticeboard_no) {
//		//@RequestParam("seq") jsp파일에서 넘어오는 seq를 int seq에 넣어주겠다
//		
//		NoticeBoardDto dto = biz.selectOne(noticeboard_no);
//		model.addAttribute("NoticeBoard_dto", dto);
//		return "NoticeBoard_detail";
//	}
//	
//	@RequestMapping("NoticeBoard_write.do")
//	public String writeForm(Model model) {
//		return "NoticeBoard_insert";
//	}
//	
//	@RequestMapping(value="NoticeBoard_insert.do",method=RequestMethod.POST)
//	public String insetRes(Model model,@ModelAttribute NoticeBoardDto dto) {
//			
//		int res = biz.insert(dto);
//		model.addAttribute("NoticeBoard_list", biz.selectAll());
//		if (res>0) {
//			//return "/WEB-INF/view/boardList.jsp";
//			//위처럼 하면 새로고침할때 마다 글이 추가되기 때문에 
//			return "redirect:/list.do";
//		}else {
//			return "NoticeBoard_list";
//		}
//	}
//	
//	@RequestMapping("NoticeBoard_update.do")
//	public String updateRes(Model model,@ModelAttribute NoticeBoardDto dto) {
//		//@ModelAttribute는 form 태그에서 sumit으로 jsp에서 컨트롤로
//		//보내준것을 알아서 dto에 담겨서 가지고 온다
//		int res = biz.update(dto);
//		if (res>0) {
//			model.addAttribute("NoticeBoard_dto", biz.selectOne(dto.getNoticeboard_no()));
//			return "forward:list.do";
//		}else {
//			model.addAttribute("NoticeBoard_dto", biz.selectOne(dto.getNoticeboard_no()));
//		}return "forward:list.do";
//	}
//	
//	@RequestMapping(value="NoticeBoard_delete.do")
//	public String deleteRes(Model model,@RequestParam("member_id") int noticeboard_no) {
//		//jsp에서 submit으로 보냈지만 id만 필요해서 id만 받기위해
//		//@RequestParam("id") 사용
//		int res = biz.delete(noticeboard_no);
//		if (res>0) {
//		model.addAttribute("NoticeBoard_list", biz.selectAll());
//		}
//		return "NoticeBoard_list";
//	}
//	
//}
