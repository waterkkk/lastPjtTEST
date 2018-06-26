package com.bom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.runner.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.biz.FreecommBiz;
import com.bom.biz.FreetableBiz;
import com.bom.dao.FreetableDao;
import com.bom.dto.FreetableDto;
import com.bom.dto.FreecommDto;
import com.bom.dao.FreecommDao;

@Controller
public class FreetableController {

	private static final Logger logger = LoggerFactory.getLogger(FreetableController.class);

	@Autowired
	private FreetableBiz freebiz;

	@Autowired
	private FreecommBiz commbiz;

	

	
	// 메인화면으로
	@RequestMapping(value = "main.do")
	public String main(Model model) {
		model.addAttribute("allList", freebiz.selectAll());
		return "main";
	}

	// 전체출력
	@RequestMapping(value = "list.do")
	public String list(Model model) {
		model.addAttribute("allList", freebiz.selectAll());
		return "redirect:board.do?nowPage=1";
	}

	// 일부출력(원글/댓글)
	@RequestMapping(value = "freedetail.do")
	public String detail(Model model, @RequestParam int freetable_no) {
		model.addAttribute("detail", freebiz.selectOne(freetable_no));  // 나중에 정리할것
		model.addAttribute("list", commbiz.commSelectAll(freetable_no)); // 나중에 정리할것
		return "Freetable/Freetable_detail";
	}

	// 입력-1:페이지로 이동
	@RequestMapping(value = "writeForm.do")
	public String writeForm(Model model) {
		return "Freetable/Freetable_writeForm";
	}



	// 입력-2:내용입력
		@RequestMapping(value = "write.do", method = RequestMethod.POST)
		public String write(Model model, @ModelAttribute FreetableDto dto,
				@RequestParam("member_id") String member_id) {
		System.out.println("member_id: "+member_id);
		System.out.println("freetable_title: "+dto.getFreetable_title());
		System.out.println("freetable_content: "+dto.getFreetable_content());
		
		Map<String, String> map=new HashMap<String,String>();
		map.put("member_id",member_id);
		map.put("freetable_title", dto.getFreetable_title());
		map.put("freetable_content", dto.getFreetable_content());
		
			boolean res = freebiz.insert(map);
			
			if (res) {
				System.out.println("추가 성공");
				return "redirect:board.do?nowPage=1";
			} else {
				System.out.println("추가 실패");
				return "redirect:writeForm.do";
			}
		}
		
	
	// 수정-1:페이지로 이동
	@RequestMapping(value = "updateForm.do")
	public String updateForm(Model model, @RequestParam int freetable_no) {
		model.addAttribute("detail", freebiz.selectOne(freetable_no));
		return "Freetable/Freetable_detail";
	}

	
	// 수정-2:내용 수정
	@RequestMapping(value = "update.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String update(Model model, @ModelAttribute FreetableDto dto) {
		boolean res = freebiz.update(dto);
		if (res) {
			model.addAttribute("detail", freebiz.selectOne(dto.getFreetable_no()));
			System.out.println("수정 성공");
			return "forward:updateForm.do";
		} else {
			model.addAttribute("detail", freebiz.selectOne(dto.getFreetable_no()));
			System.out.println("수정 실패");
			return "forward:updateForm.do";
		}
	}

	
	// 글 삭제
	@RequestMapping(value = "freedelete.do", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam int freetable_no) {
		System.out.println("freetable_no: "+freetable_no);
		boolean res = freebiz.delete(freetable_no);
		System.out.println("delete 시험중");
		if (res) {
			System.out.println("삭제 성공");
			return "redirect:board.do?nowPage=1";
		} else {
			System.out.println("삭제 실패");
			return "redirect:freedetail.do?freetable_no=" + freetable_no;
		}
	}

	// 페이징
	// 분류:글>페이지>페이지블록
	 
	
	//0. 변수 
	// nowPage:현재 페이지 
	// startPost: 한 페이지의 시작글 
	// endPost: 한 페이지의 마지막글 
	// startPage: 한 페이지블록의 시작 페이지 
	// endPage: 한 페이지블록의 마지막 페이지 
	// countPost: 전체 글 갯수 
	// countPage: 전체 페이지 수 
	// 한페이지에 보여질 글 개수 : 10 
	// 한페이지블록에 보여질 페이지 수 : 10
	 
	@RequestMapping(value = "board.do")
	public String board(Model model, @RequestParam("nowPage") int nowPage) {// 현재 페이지(nowPage)

		// 1. 현재 페이지, 전체 글 개수
		int countPost = freebiz.selectAll().size(); // 전체 글 개수 (countPost) cf)dao-getTotalCnt

		
		 // 2-1. 전체 페이지 수를 구하기 (cf.math.ceil: 올림) 
		 // -1)countPost(전체 글)를 10(한 페이지당 글 수)으로 나눈다. 
		 // -2)대략의 페이지 수가 나온다.(그런데 딱 떨어지지 않을 경우는 페이지가 추가가 되어야 하므로) 
		 //   나머지 한 페이지도 고려하여 나눌때 double값으로 받은 뒤에 올림해준다. 그리고 다시 원래 int로 변환하여 마무리 
		 // -3)딱 떨어지지 않는 마지막 페이지까지 고려한 <전체 페이지 수>가 나온다.

		int countPage = (int) (Math.ceil(((double) countPost / 10))); // countPage: 전체 페이지

		
		 // 2-2. 현재 페이지의 시작, 마지막글 구하기 
		 // 현재 페이지*10 = (마지막 페이지 글 갯수가 10이라고 가정한) 전체 페이지 
		 // 글 갯수 0 빼면 해당 페이지의 마지막글, 9 빼면 해당 페이지의 첫글 
		 // (마지막 페이지에 글이 10개가 아닐 경우도 있으나 페이징에서는 페이지 수만 계산하면 되므로 pass)
		int startPost = (nowPage * 10) - 9; // startPost: 한 페이지의 시작글
		int endPost = (nowPage * 10); // endPost: 한 페이지의 마지막글

		
		 // 2-3. (현재 페이지가 들어있는) 페이지블록의 시작 페이지, 마지막 페이지 구하기 
		 // 현재 페이지/10 -> (페이지가 10개 미만인 페이지블록을 포함한)페이지블록의 수
		 // Math.ceil((double)현재 페이지/10)*10->올림
		 // (int)Math.ceil((double)현재 페이지/10)*10  현재 페이지가 들어있는 페이지블록의 마지막 페이지
		
		int startPage = ((int) Math.ceil(((double) nowPage / 10)) * 10) - 9;
		int endPage = (int) Math.ceil(((double) nowPage / 10)) * 10;
		if (endPage > countPage) {
			endPage = countPage;
		}
		// 3. DB에 startPost, endPost를 보내서 list(출력할 글들)을 리턴받자.
		List<FreetableDto> allList = freebiz.selectFTAll(startPost, endPost);

		// 4. boardList에 보낼 자료들을 세팅
		model.addAttribute("allList", allList);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("countPage", countPage);

		// 5. 보낸다.
		return "Freetable/Freetable_list";
	}

	// 답글(원글에 대한)
	@RequestMapping(value = "insertReply.do", method = RequestMethod.POST)
	public String insertReply(Model model, @ModelAttribute FreetableDto dto,
			@RequestParam("freetable_no") int parentfreetableNo) {
		boolean res = freebiz.insertReply(dto, parentfreetableNo);
		if (res) {
			System.out.println("reply 성공");
			model.addAttribute("allList", freebiz.selectAll());
			return "redirect:board.do?nowPage=1";
		} else {
			System.out.println("reply 실패");
			model.addAttribute("detail", freebiz.selectOne(parentfreetableNo));
			return "redirect:board.do?nowPage=1";
		}
	}
	

	
	// 댓글입력 
			
	@RequestMapping(value="commInsert.do", method=RequestMethod.GET)
	public String commInsert(Model model,
		@RequestParam("freetable_no") int freetable_no,
		@RequestParam("member_id") String member_id,
		@RequestParam("freecomm_content") String freecomm_content){
			FreecommDto dto = new FreecommDto();
			dto.setFreetable_no(freetable_no);
			dto.setFreecomm_id(member_id); // 주의 
			dto.setFreecomm_content(freecomm_content);
			int res = commbiz.commInsert(dto);
			if(res>0) {
				System.out.println("[controller]reply inserted");
			}else {
				System.out.println("[controller]reply not inserted");
			}
			return "redirect:freedetail.do?freetable_no="+freetable_no;
	}
	

	
	//대댓글-1 입력창으로 이동 
	@RequestMapping(value="commReForm.do")
	public String commReForm(Model model, @ModelAttribute FreecommDto dto,
	@RequestParam("freecomm_no") int parentFreeNo) {
	model.addAttribute("commRe", dto); 
	return "Freetable/Freetable_commRe";
	}
	
	
	// 대댓글-2 내용입력
	@RequestMapping(value = "commReInsert.do", method = RequestMethod.GET)
	public String commReInsert(Model model, @ModelAttribute FreecommDto dto,
			@RequestParam("freecomm_no") int parentFreeNo) {
		boolean res = commbiz.insertReply2(dto, parentFreeNo);
		if (res) {
			System.out.println("[controller] commRe ok");
			model.addAttribute("list", freebiz.selectAll());
			return "redirect:freedetail.do?freetable_no="+dto.getFreetable_no();
		} else {
			System.out.println("[controller] commRe error");
			model.addAttribute("list", freebiz.selectAll());
			return "redirect:freedetail.do?freetable_no="+dto.getFreetable_no();
		}
	}	
	
	// 댓글 삭제
		@RequestMapping(value = "delReply.do", method = RequestMethod.GET)
		public String delReply(Model model, @RequestParam int freecomm_no,
				@RequestParam int freetable_no) {
			System.out.println("freecomm_no: "+freecomm_no);
			System.out.println("freetable_no: "+freetable_no);
			boolean res = commbiz.delReply(freecomm_no);
			System.out.println("delete 시험중");
			if (res) {
				System.out.println("삭제 성공");
				return "redirect:detail.do?freetable_no=" + freetable_no;
			} else {
				System.out.println("삭제 실패");
				return "redirect:detail.do?freetable_no=" + freetable_no;
			}
		}

	// 검색
	@RequestMapping("search.do")
	public String search(Model model, 
			@RequestParam(value = "searching") String searching,
			@RequestParam(value = "keyword") String keyword) {
		List<FreetableDto> allList = freebiz.searchList(searching, keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("allList", allList);
		map.put("searching", searching);
		map.put("keyword", keyword);

		model.addAttribute("map", map);

		return "forward:board.do?nowPage=1";
	}

}
