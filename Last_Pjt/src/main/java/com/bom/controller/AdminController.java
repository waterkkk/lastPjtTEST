package com.bom.controller;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.biz.AdminBiz;
import com.bom.biz.NoticeBoardBiz;
import com.bom.dto.AdminDto;
import com.bom.dto.NoticeBoardDto;

@Controller
public class AdminController {
	
	@Autowired
	AdminBiz biz;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/*Admin*/
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
		
		return "Admin_home";
	}
	
	/*목록*/
	@RequestMapping(value = "Admin_list.do")
	public String list(Model model) {
		
		List<AdminDto> list = biz.selectAll();
		model.addAttribute("admin_list", list);

		return "Admin_list";
	}
	
	/*상세*/
	@RequestMapping(value = "Admin_detail.do")
	public String detail(Model model,@RequestParam("member_id") String member_id) {
		//@RequestParam("seq") jsp파일에서 넘어오는 seq를 int seq에 넣어주겠다
		
		AdminDto dto = biz.selectOne(member_id);
		model.addAttribute("admin_dto", dto);
		return "Admin_detail";
	}
	
	/*입력페이지로 이동*/
	@RequestMapping("Admin_write.do")
	public String writeForm(Model model) {
		return "Admin_insert";
	}
	
	/*입력후 저장*/
	@RequestMapping(value="Admin_insert.do",method=RequestMethod.POST)
	public String insetRes(Model model,@ModelAttribute AdminDto dto) {
			
		int res = biz.insert(dto);
		model.addAttribute("admin_list", biz.selectAll());
		if (res>0) {
			//return "/WEB-INF/view/boardList.jsp";
			//위처럼 하면 새로고침할때 마다 글이 추가되기 때문에 
			return "redirect:/Admin_list.do";
		}else {
			return "Admin_list";
		}
	}
	
	/*수정*/
	@RequestMapping("Admin_update.do")
	public String updateRes(Model model,@ModelAttribute AdminDto dto) {
		//@ModelAttribute는 form 태그에서 sumit으로 jsp에서 컨트롤로
		//보내준것을 알아서 dto에 담겨서 가지고 온다
		int res = biz.update(dto);
		if (res>0) {
			model.addAttribute("admin_dto", biz.selectOne(dto.getMember_id()));
			return "forward:list.do";
		}else {
			model.addAttribute("admin_dto", biz.selectOne(dto.getMember_id()));
		}return "forward:list.do";
	}
	
	/*삭제*/
	@RequestMapping(value="Admin_delete.do")
	public String deleteRes(Model model,@RequestParam("member_id") String member_id) {
		//jsp에서 submit으로 보냈지만 id만 필요해서 id만 받기위해
		//@RequestParam("id") 사용
		int res = biz.delete(member_id);
		if (res>0) {
		model.addAttribute("admin_list", biz.selectAll());
		}
		return "Admin_list";
	}
	
	/*검색*/
	@RequestMapping(value="Admin_search.do")
	public String AdminSearchRes(Model model,@RequestParam("Admin_search") String Admin_search, @RequestParam("Admin_keyword") String Admin_keyword) {
		//jsp에서 submit으로 보냈지만 id만 필요해서 id만 받기위해
		//@RequestParam("id") 사용
		List<AdminDto> res = biz.searchList(Admin_search,Admin_keyword);
		model.addAttribute("admin_list", res);
		System.out.println("입력 : " + Admin_search);
		System.out.println("검색 : " + Admin_keyword);
		return "Admin_list";
	}
	
	/*등급조정*/
	@RequestMapping(value = "Admin_role.do",method=RequestMethod.POST)
	public String Adminrole(Model model,@RequestParam("member_id") String member_id, @RequestParam("member_role") String member_role) {
        System.out.println(member_id+"/"+member_role);
//        inter = session.getMapper(MyInterface.class);
//        inter.levelUp(level, id);
//        model.addAttribute("members", inter.members());
        int res = biz.roleUP(member_id,member_role);
        if (res>0) {
        model.addAttribute("admin_list", biz.selectAll());
        }
		return "Admin_list";
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////
	/*NoticeBoard*/
	
	@Autowired
	NoticeBoardBiz NoticeBoardbiz;
	
	/**/
	@RequestMapping(value = "NoticeBoard_list.do")
	public String NoticeBoardlist(Model model) {
		List<NoticeBoardDto> list = NoticeBoardbiz.selectAll();
		model.addAttribute("NoticeBoard_list", list);

		return "NoticeBoard_list";
	}
	
	@RequestMapping(value = "NoticeBoard_detail.do")
	public String NoticeBoarddetail(Model model,@RequestParam("noticeboard_no") int noticeboard_no) {
		//@RequestParam("seq") jsp파일에서 넘어오는 seq를 int seq에 넣어주겠다
		NoticeBoardbiz.readCount(noticeboard_no);
		NoticeBoardDto dto = NoticeBoardbiz.selectOne(noticeboard_no);
		model.addAttribute("NoticeBoard_dto", dto);
		return "NoticeBoard_detail";
	}
	
	@RequestMapping("NoticeBoard_write.do")
	public String NoticeBoardwriteForm(Model model) {
		System.out.println("[NoticeBoard - insert 페이지로 이동]");
		return "NoticeBoard_insert";
	}
	
	@RequestMapping(value="NoticeBoard_insert.do",method=RequestMethod.POST)
	public String NoticeBoardinsetRes(Model model,@ModelAttribute NoticeBoardDto dto) {
			
		int res = NoticeBoardbiz.insert(dto);
		model.addAttribute("NoticeBoard_list", NoticeBoardbiz.selectAll());
		if (res>0) {
			//return "/WEB-INF/view/boardList.jsp";
			//위처럼 하면 새로고침할때 마다 글이 추가되기 때문에 
			return "redirect:/NoticeBoard_list.do";
		}else {
			return "NoticeBoard_list";
		}
	}
	
	@RequestMapping("NoticeBoard_update.do")
	public String NoticeBoardupdateRes(Model model,@ModelAttribute NoticeBoardDto dto) {
		//@ModelAttribute는 form 태그에서 sumit으로 jsp에서 컨트롤로
		//보내준것을 알아서 dto에 담겨서 가지고 온다
		int res = NoticeBoardbiz.update(dto);
		if (res>0) {
			model.addAttribute("NoticeBoard_dto", NoticeBoardbiz.selectOne(dto.getNoticeboard_no()));
			return "forward:NoticeBoard_list.do";
		}else {
			model.addAttribute("NoticeBoard_dto", NoticeBoardbiz.selectOne(dto.getNoticeboard_no()));
		}return "forward:NoticeBoard_list.do";
	}
	
	@RequestMapping(value="NoticeBoard_delete.do")
	public String deleteRes(Model model,@RequestParam("noticeboard_no") int noticeboard_no) {
		//jsp에서 submit으로 보냈지만 id만 필요해서 id만 받기위해
		//@RequestParam("id") 사용
		int res = NoticeBoardbiz.delete(noticeboard_no);
		if (res>0) {
		model.addAttribute("NoticeBoard_list", NoticeBoardbiz.selectAll());
		}
		return "NoticeBoard_list";
	}
	
}
