package com.bom.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bom.biz.EduoffBiz;
import com.bom.dto.EduoffDto;


@Controller
public class EduoffController  {
	private static final Logger logger = LoggerFactory.getLogger(EduoffController.class);
	
	@Autowired
	private EduoffBiz biz;
	
	// 테스트
		@RequestMapping(value = "test.do")
		public String test(Model model) {
			
			return "test3";
		}
		

	//교육게시판으로 이동
    @RequestMapping(value="eduoffList.do")
    public String eduoffList(Model model) {
    	model.addAttribute("allList", biz.selectAll());
    	return "redirect:board2.do?nowPage=1";
    }
    
	//교육게시판-지도로 이동
    @RequestMapping(value="eduoffMap.do")
    public String eduoffMap(Model model) {
    	return "Eduoff/Eduoff_map";
    }
    
    

    //검색
	@RequestMapping("gangSelect.do")
	public String search(Model model, 
			@RequestParam("searching2") String searching2,
			@RequestParam("keyword2") String keyword2) {
	
		System.out.println("searching2:"+searching2);
		System.out.println("keyword2:"+keyword2);
		List<EduoffDto> allList = biz.searchList(searching2, keyword2);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("allList", allList);
		map2.put("searching2", searching2);
		map2.put("keyword2", keyword2);
		
		System.out.println("searching2/"+searching2);
		System.out.println("keyword2/"+keyword2);
		

		model.addAttribute("map2", map2);
		return "forward:board2.do?nowPage=1"; 
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
 	 
    
//페이징    
 	@RequestMapping(value = "board2.do")
 	public String board(Model model, @RequestParam("nowPage") int nowPage) {// 현재 페이지(nowPage)
 		
 		// 1. 현재 페이지, 전체 글 개수
 		int countPost = biz.selectAll().size(); // 전체 글 개수 (countPost) cf)dao-getTotalCnt

 		
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
 		List<EduoffDto> allList = biz.selectFTAll(startPost, endPost);

 		// 4. boardList에 보낼 자료들을 세팅
 		model.addAttribute("allList", allList);
 		model.addAttribute("startPage", startPage);
 		model.addAttribute("endPage", endPage);
 		model.addAttribute("nowPage", nowPage);
 		model.addAttribute("countPage", countPage);
 		
 		// 5. 보낸다.
 		return "Eduoff/Eduoff_list";
 	}
	
    
    

    
    
}














