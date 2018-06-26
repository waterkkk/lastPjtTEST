package com.bom.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
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
import com.bom.dto.AdminDto;

@Controller
public class AdminController {

	@Autowired
	AdminBiz biz;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	/* Admin */

	/* 목록 */
	@RequestMapping(value = "Admin_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(Model model, @RequestParam(required = false) String page) {

		if (page == null) {
			page = "1";
		}

		// DB - 1페이지당 5개씩 가져 올 것
		// 페이징 처리 - 3블럭

		int currentPage = Integer.parseInt(page); // 현재 내가 보고 있는 페이지
		int endNum = Integer.parseInt(page) * 5; // 각 페이지마다 5개씩 가져오므로 끝 숫자는 5, 10, 15...
		int startNum = endNum - 4; // 각 페이지마다 시작하는 수는 1, 6, 11...

		List<AdminDto> list = biz.selectAll(startNum, endNum);
		int totalA = biz.getTotalCount(); // 전체 글의 수
		// int totalP = (totalA+4)/5;
		System.out.println("글 갯수 : " + totalA);

		int totalP = 0; // 모든 글을 띄우기 위한 전체 페이지수

		if (totalA % 5 == 0) {
			totalP = totalA / 5; // 전체글이 5로 나누어 떨어지면(한 페이지당 5개씩 보여주므로) 전체 필요한 페이지수는 이렇게 됨
		} else if (totalA % 5 != 0) {
			totalP = totalA / 5 + 1; // 전체글이 5로 나누어 떨어지지 않으면 전체 필요한 페이지수는 이렇게 됨
		}

		int pageBlock = 3; // [1] [2] [3] 3개씩만 보여줄 것 (보통은 10개임)

		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1; // 내가 보고 있는 페이지 기준으로 시작 페이지
		// 예를 들어 내가 [5]를 보고 있다면 그 페이지 기준으로 시작은 [4] [5] [6] 이므로 startPage는 4가 된다
		int endPage = startPage + pageBlock - 1;
		// 그리고 endPage는 6이 된다.

		if (endPage > totalP) // 만약 보고있는 페이지 기준으로 끝 페이지가 전체 글의 수보다 많다면
			endPage = totalP; // 끝 페이지는 전체 페이지의 수가 된다.
		// 예를 들어 전체 작성된 글의 수가 40개(totalA = 40) 이라면 전체 페이지 수는 8페이지가 되고(totalP = 8)
		// 내가 7페이지를 보고 있다면(currentPage =7) [7] [8] [9] 가 보여지게 되는데,
		// [9]페이지는 존재하지 않으므로 전체 페이지수(totalP)를 마지막 페이지(endPage)에 넣어주면 된다 (endPage = totalP)

		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalP", totalP);// 페이징 처리를 위해 가져감
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("admin_list", list);

		return "/Admin/Admin_List";
	}

	/* 상세 */
	@RequestMapping(value = "Admin_detail.do")
	public String detail(Model model, @RequestParam("member_id") String member_id) {
		// @RequestParam("seq") jsp파일에서 넘어오는 seq를 int seq에 넣어주겠다

		AdminDto dto = biz.selectOne(member_id);
		model.addAttribute("admin_dto", dto);
		return "/Admin/Admin_Detail";
	}

	/* 입력페이지로 이동 */
	@RequestMapping("Admin_write.do")
	public String writeForm(Model model) {
		return "/Admin/Admin_Insert";
	}

	/* 입력후 저장 */
	@RequestMapping(value = "Admin_insert.do", method = RequestMethod.POST)
	public String insetRes(Model model, @ModelAttribute AdminDto dto) {

		int res = biz.insert(dto);
		model.addAttribute("admin_list", res);
		if (res > 0) {
			// return "/WEB-INF/view/boardList.jsp"; 처럼 하면 새로고침할때 마다 글이 추가되기 때문에 redirect 사용
			return "redirect:/Admin_list.do";
		} else {
			return "redirect:/Admin_list.do";
		}
	}

	/* 수정 */
	@RequestMapping("Admin_update.do")
	public String updateRes(Model model, @ModelAttribute AdminDto dto, @RequestParam(required = false) String page) {
		// @ModelAttribute는 form 태그에서 submit으로 jsp에서 controller로 보내준것을 dto에 담겨서 가지고 온다
		int res = biz.update(dto);
		if (res > 0) {
			model.addAttribute("admin_dto", biz.selectOne(dto.getMember_id()));
			model.addAttribute("page", page);
			return "forward:Admin_list.do";
		} else {
			model.addAttribute("admin_dto", biz.selectOne(dto.getMember_id()));
		}
		return "forward:Admin_list.do";
	}

	/* 삭제 */
	@RequestMapping(value = "Admin_delete.do")
	public String deleteRes(Model model, @RequestParam("member_id") String member_id) {
		// jsp에서 submit으로 보낸 member_id를 받기 위해  @RequestParam("member_id") 사용
		int res = biz.delete(member_id);
		if (res > 0) {
			model.addAttribute("admin_list", res);
		} else {
			return "redirect:/Admin_list.do";
		}
		return "redirect:/Admin_list.do";
	}

	/* 회원 검색 */
	@RequestMapping(value = "Admin_search.do")
	public String AdminSearchRes(Model model, @RequestParam("Admin_search") String Admin_search,
			@RequestParam("Admin_keyword") String Admin_keyword) {

		//id,이름으로 검색
		List<AdminDto> res = biz.searchList(Admin_search, Admin_keyword);
		model.addAttribute("admin_list", res);
		System.out.println("입력 : " + Admin_search);
		System.out.println("검색 : " + Admin_keyword);
		return "/Admin/Admin_List";
	}

	/* 회원 등급조정 */
	@RequestMapping(value = "Admin_role.do", method = RequestMethod.POST)
	public String Adminrole(Model model, @RequestParam("member_id") String member_id,
			@RequestParam("member_role") String member_role, @RequestParam(required = false) String page) {
		System.out.println(member_id + "/" + member_role);

		//해당 id의 등급을 관리자/회원 으로 선택해서 변경 값을 저장
		int res = biz.roleUP(member_id, member_role);
		if (res > 0) {
			model.addAttribute("admin_list", res);
			model.addAttribute("page", page);
		}
		return "forward:Admin_list.do";
	}

	//////////////////////////////////////////////////////////////////////////////////////////////
	/* 걷기 게시판으로 이동 */
	@RequestMapping("Exercise_Walk.do")
	public String Exercise_walk(Model model) {
		return "/Exercise/Exercise_Walk";
	}

	/* 길찾기/지도 */
	@RequestMapping("Exercise_Search.do")
	public String Exercise_search(Model model) {

		return "/Exercise/Exercise_Search";
	}

	/* 등산 게시판으로 이동 */
	@RequestMapping("Exercise_Hiking.do")
	public String Exercise_hiking(Model model) {

		return "/Exercise/Exercise_Hiking";
	}

	/* 등산 게시판 내 지역 검색 */
	@RequestMapping("Exercise_Hiking_Page.do")
	public String Exercise_hiking1(Model model, @RequestParam(required = false) String hiking_keyword)
			throws IOException {
		//StringBuilder : 변경가능한 문자열(문자열을 담기 위함)
		 //URLEncoder.encode : URL 뒤에 데이터를 덧붙일때 String을 URL에 맞에 인코딩하는 것(서버의 인코딩 방식에 맞추어서 UTF-8로 한 것)
	      //               운영체제마다 일부 문자를 인식하는 방식이 다르므로 일반 문자열을 웹에서 통용되는 형식으로 변환(URL의 문자를 코드화. 숫자, 대소문자, 밑줄은 제외됨)
		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.forest.go.kr/openapi/service/cultureInfoService/gdTrailInfoOpenAPI"); /* URL */
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8")
				+ "=lgVtVTsJEuXKfNpq8RSVgdwFIDbku065dngPfBYOMYz4KauXQuCilV9aVwqZ2m2Z8kc9eGxiXmCY7zAWkV4m%2Bg%3D%3D"); /* Service Key */
		urlBuilder.append("&" + URLEncoder.encode("searchArNm", "UTF-8") + "="
				+ URLEncoder.encode(hiking_keyword, "UTF-8")); /* 검색 단어 */

		System.out.println(urlBuilder);
		 //URL : URL을 나타낼 때 사용함
		URL url = new URL(urlBuilder.toString());
		 //HttpURLConnection : url의 정보를 담고 있는 객체 생성(웹페이지 URL 연결)
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		 //전달 방식을 GET방식으로 요청
		conn.setRequestMethod("GET");
		 //헤더 값 설정(전달시 application/json으로 전달)
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		 //BufferReader : 응답받은 메시지의 길이만큼 버퍼를 생성해서 읽어들인다
		BufferedReader rd;
		//서버로 요청. 200이면 성공
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			   //문자열 셋팅
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		StringBuilder sb = new StringBuilder();
		String line;
		 //한 라인씩 출력
		while ((line = rd.readLine()) != null) {
			System.out.println("line :" + line);
			String text = line;
			//api 파일 자체의 오타 때문에 replace 사용한 것
			line = text.replace("00", " ").replace("NORMAL SERVICE.", "<br/>")
					.replace("<aeatreason>", "<aeatreason><br/>♡♡안내♡♡<br/>").replace("&amp;lt;", "<")
					.replace("&amp;gt;", ">").replace("&lt;BR&gt;", "<br/>")
					.replace("<mntheight>", "<br/><br/><mntheight> ● 해발 : ")
					.replace("</mntheight>", " m</mntheight><br/>").replace("<mntncd>", "<mntncd> ● 산코드 : ")
					.replace("</mntncd>", "</mntncd><br/><br/> ").replace("<tourisminf>", "<br/><tourisminf><br/>")
					.replace("<areanm>", "<br/><areanm><br/> ● 위치 :").replace("<details>", "<br/><details>")
					.replace("<numOfRows>10</numOfRows>", " ").replace("<pageNo>1</pageNo>", " ")
					.replace("</transport>", "<br/></transport><br/>")
					.replace("<totalCount>", "<totalCount><br/> ● 해당 지역의 명산  갯수 : ");

			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());

		String abc = sb.toString();

		System.out.println("검색 단어 : " + hiking_keyword);
		model.addAttribute("hiking_keyword", hiking_keyword);
		model.addAttribute("abc", abc);

		return "/Exercise/Exercise_Hiking";
	}

	/* 문화행사 게시판 */
	@RequestMapping("Freetime_Culture.do")
	public String Freetime_Culture(Model model) {

		return "/Freetime/Freetime_Culture";
	}

	/* 도서관 게시판 */
	@RequestMapping("Freetime_Library.do")
	public String Freetime_Library(Model model) {

		return "/Freetime/Freetime_Library";
	}

	/* 공원 게시판 */
	@RequestMapping("Freetime_Park.do")
	public String Freetime_Park(Model model) {

		return "/Freetime/Freetime_Park";
	}

	/* 경로당 게시판 */
	@RequestMapping("Freetime_Center.do")
	public String Freetime_Center(Model model) throws IOException {

		return "/Freetime/Freetime_Center";
	}

}