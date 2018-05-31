package com.bom.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.bom.biz.AdminBiz;
import com.bom.biz.NoticeBoardBiz;
import com.bom.dto.APItest;
import com.bom.dto.AdminDto;
import com.bom.dto.NoticeBoardDto;

@Controller
public class AdminController {

	@Autowired
	AdminBiz biz;

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	/* Admin */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "Admin_home";
	}

	/* 목록 */
	@RequestMapping(value = "Admin_list.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(Model model, @RequestParam(required = false) String page) {

		// List<AdminDto> list = biz.selectAll();
		// model.addAttribute("admin_list", list);
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
		
		List<APItest> listapi = new ArrayList<APItest>();
		APItest api = new APItest();
		
		String urlString = "http://openapi.seoul.go.kr:8088/427958685873776539364e63494a53/xml/SeoulGilWalkCourse/1/5";
		  
		  try {
		   URL url  = new URL(urlString);   
		   URLConnection URLconnection = url.openConnection();
		   HttpURLConnection httpConnection = (HttpURLConnection)URLconnection;
		   int responseCode = httpConnection.getResponseCode();
		   if (responseCode== HttpURLConnection.HTTP_OK)
		   {
		    InputStream in = httpConnection.getInputStream();
		    
		    DocumentBuilderFactory fac = DocumentBuilderFactory.newInstance();
		    DocumentBuilder db = fac.newDocumentBuilder();
		    Document doc = db.parse(in);
		
		    // 자바스크립트로 처리할 때와 메소드명은 비슷하지만, 자바스크립트는 변수에 명시적인 타입을 주지 않기 때문에
		    // NodeList와 Node 인 경우로 나누어서 처리해야 한다.
		    // 또한 <TAG_NAME>TEXT</TAG_NAME> 식으로 구성된 TEXT를 얻어오려면 getTextContent()를 사용한다.
		    Element el = doc.getDocumentElement();
		    NodeList row_List = el.getElementsByTagName("row"); // CD Element를 찾는다.
		    
		    for (int row_idx=0; row_idx<row_List.getLength(); row_idx++)
		    {
		     Node row_Node = row_List.item(row_idx);
		     NodeList rowList = row_Node.getChildNodes();
		     
		     String COURSE_CATEGORY_NM = "";
		     String COURSE_NAME = "";
		     String AREA_GU = "";
		     String DISTANCE = "";
		     String LEAD_TIME = "";
		     String TRAFFIC_INFO = "";
		     String CONTENT = "";
		     String COURSE_LEVEL = "";
		     String DETAIL_COURSE = "";
		     String CPI_IDX = "";
		     
		     for (int cd_idx=0; cd_idx<rowList.getLength(); cd_idx++)
		     {
		      Node childNode = rowList.item(cd_idx);
		      if (childNode.getNodeName().equals("COURSE_CATEGORY_NM"))
		    	  COURSE_CATEGORY_NM = childNode.getTextContent();
		      api.setCOURSE_CATEGORY_NM(COURSE_CATEGORY_NM);
		      if (childNode.getNodeName().equals("COURSE_NAME"))
		    	  COURSE_NAME = childNode.getTextContent();
		      api.setCOURSE_NAME(COURSE_NAME);
		      if (childNode.getNodeName().equals("AREA_GU"))
		    	  AREA_GU = childNode.getTextContent();
		      api.setAREA_GU(AREA_GU);
		      if (childNode.getNodeName().equals("DISTANCE"))
		    	  DISTANCE = childNode.getTextContent();
		      api.setDISTANCE(DISTANCE);
		      if (childNode.getNodeName().equals("LEAD_TIME"))
		    	  LEAD_TIME = childNode.getTextContent();
		      api.setLEAD_TIME(LEAD_TIME);
		      if (childNode.getNodeName().equals("TRAFFIC_INFO"))
		    	  TRAFFIC_INFO = childNode.getTextContent();
		      api.setTRAFFIC_INFO(TRAFFIC_INFO);
		      if (childNode.getNodeName().equals("CONTENT"))
		    	  CONTENT = childNode.getTextContent();
		      api.setCONTENT(CONTENT);
		      if (childNode.getNodeName().equals("COURSE_LEVEL"))
		    	  COURSE_LEVEL = childNode.getTextContent();
		      api.setCOURSE_LEVEL(COURSE_LEVEL);
		      if (childNode.getNodeName().equals("DETAIL_COURSE"))
		    	  DETAIL_COURSE = childNode.getTextContent();
		      api.setDETAIL_COURSE(DETAIL_COURSE);
		      if (childNode.getNodeName().equals("CPI_IDX"))
		    	  CPI_IDX = childNode.getTextContent();
		      api.setCPI_IDX(CPI_IDX);
		     }
		     listapi.add(api);
		     
		     System.out.println("COURSE_CATEGORY_NM - " + COURSE_CATEGORY_NM);
		     System.out.println("COURSE_NAME - " + COURSE_NAME);
		     System.out.println("AREA_GU - " + AREA_GU);
		     System.out.println("DISTANCE - " + DISTANCE);
		     System.out.println("LEAD_TIME - " + LEAD_TIME);
		     System.out.println("TRAFFIC_INFO - " + TRAFFIC_INFO);
		     System.out.println("CONTENT - " + CONTENT);
		     System.out.println("COURSE_LEVEL - " + COURSE_LEVEL);
		     System.out.println("DETAIL_COURSE - " + DETAIL_COURSE);
		     System.out.println("CPI_IDX - " + CPI_IDX);
		     System.out.println("--------------------");
		    }
		   }
		   else
		   {
		    System.out.println("HTTP connection response !=HTTP_OK");
		   }
		  } catch (Exception e)
		  {
		   e.printStackTrace();
		  }
		model.addAttribute("api", listapi);  
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalP", totalP);// 페이징 처리를 위해 가져감
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("admin_list", list);
		
		return "Admin_list";
	}

	/* 상세 */
	@RequestMapping(value = "Admin_detail.do")
	public String detail(Model model, @RequestParam("member_id") String member_id) {
		// @RequestParam("seq") jsp파일에서 넘어오는 seq를 int seq에 넣어주겠다

		AdminDto dto = biz.selectOne(member_id);
		model.addAttribute("admin_dto", dto);
		return "Admin_detail";
	}

	/* 입력페이지로 이동 */
	@RequestMapping("Admin_write.do")
	public String writeForm(Model model) {
		return "Admin_insert";
	}

	/* 입력후 저장 */
	@RequestMapping(value = "Admin_insert.do", method = RequestMethod.POST)
	public String insetRes(Model model, @ModelAttribute AdminDto dto) {

		int res = biz.insert(dto);
		model.addAttribute("admin_list", res);
		if (res > 0) {
			// return "/WEB-INF/view/boardList.jsp";
			// 위처럼 하면 새로고침할때 마다 글이 추가되기 때문에
			return "redirect:/Admin_list.do";
		} else {
			return "redirect:/Admin_list.do";
		}
	}

	/* 수정 */
	@RequestMapping("Admin_update.do")
	public String updateRes(Model model, @ModelAttribute AdminDto dto, @RequestParam(required = false) String page) {
		// @ModelAttribute는 form 태그에서 sumit으로 jsp에서 컨트롤로
		// 보내준것을 알아서 dto에 담겨서 가지고 온다
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
		// jsp에서 submit으로 보냈지만 id만 필요해서 id만 받기위해
		// @RequestParam("id") 사용
		int res = biz.delete(member_id);
		if (res > 0) {
			model.addAttribute("admin_list", res);
		} else {
			return "redirect:/Admin_list.do";
		}
		return "redirect:/Admin_list.do";
	}

	/* 검색 */
	@RequestMapping(value = "Admin_search.do")
	public String AdminSearchRes(Model model, @RequestParam("Admin_search") String Admin_search,
			@RequestParam("Admin_keyword") String Admin_keyword) {
		List<APItest> listapi = new ArrayList<APItest>();
		APItest api = new APItest();
		
		String urlString = "http://openapi.seoul.go.kr:8088/427958685873776539364e63494a53/xml/SeoulGilWalkCourse/1/5";
		  
		  try {
		   URL url  = new URL(urlString);   
		   URLConnection URLconnection = url.openConnection();
		   HttpURLConnection httpConnection = (HttpURLConnection)URLconnection;
		   int responseCode = httpConnection.getResponseCode();
		   if (responseCode== HttpURLConnection.HTTP_OK)
		   {
		    InputStream in = httpConnection.getInputStream();
		    
		    DocumentBuilderFactory fac = DocumentBuilderFactory.newInstance();
		    DocumentBuilder db = fac.newDocumentBuilder();
		    Document doc = db.parse(in);
		
		    // 자바스크립트로 처리할 때와 메소드명은 비슷하지만, 자바스크립트는 변수에 명시적인 타입을 주지 않기 때문에
		    // NodeList와 Node 인 경우로 나누어서 처리해야 한다.
		    // 또한 <TAG_NAME>TEXT</TAG_NAME> 식으로 구성된 TEXT를 얻어오려면 getTextContent()를 사용한다.
		    Element el = doc.getDocumentElement();
		    NodeList row_List = el.getElementsByTagName("row"); // CD Element를 찾는다.
		    
		    for (int row_idx=0; row_idx<row_List.getLength(); row_idx++)
		    {
		     Node row_Node = row_List.item(row_idx);
		     NodeList rowList = row_Node.getChildNodes();
		     
		     String COURSE_CATEGORY_NM = "";
		     String COURSE_NAME = "";
		     String AREA_GU = "";
		     String DISTANCE = "";
		     String LEAD_TIME = "";
		     String TRAFFIC_INFO = "";
		     String CONTENT = "";
		     String COURSE_LEVEL = "";
		     
		     for (int cd_idx=0; cd_idx<rowList.getLength(); cd_idx++){
		      Node childNode = rowList.item(cd_idx);
		      if (childNode.getNodeName().equals("COURSE_CATEGORY_NM"))
		    	  COURSE_CATEGORY_NM = childNode.getTextContent();
		      api.setCOURSE_CATEGORY_NM(COURSE_CATEGORY_NM);
		      if (childNode.getNodeName().equals("COURSE_NAME"))
		    	  COURSE_NAME = childNode.getTextContent();
		      api.setCOURSE_NAME(COURSE_NAME);
		      if (childNode.getNodeName().equals("AREA_GU"))
		    	  AREA_GU = childNode.getTextContent();
		      api.setAREA_GU(AREA_GU);
		      if (childNode.getNodeName().equals("DISTANCE"))
		    	  DISTANCE = childNode.getTextContent();
		      api.setDISTANCE(DISTANCE);
		      if (childNode.getNodeName().equals("LEAD_TIME"))
		    	  LEAD_TIME = childNode.getTextContent();
		      api.setLEAD_TIME(LEAD_TIME);
		      if (childNode.getNodeName().equals("TRAFFIC_INFO"))
		    	  TRAFFIC_INFO = childNode.getTextContent();
		      api.setTRAFFIC_INFO(TRAFFIC_INFO);
		      if (childNode.getNodeName().equals("CONTENT"))
		    	  CONTENT = childNode.getTextContent();
		      api.setCONTENT(CONTENT);
		      if (childNode.getNodeName().equals("COURSE_LEVEL"))
		    	  COURSE_LEVEL = childNode.getTextContent();
		      api.setCOURSE_LEVEL(COURSE_LEVEL);
		     }
		     listapi.add(api);
		     
		     System.out.println("COURSE_CATEGORY_NM - " + COURSE_CATEGORY_NM);
		     System.out.println("SOUTH_NORTH_DIV_NM - " + COURSE_NAME);
		     System.out.println("AREA_GU - " + AREA_GU);
		     System.out.println("DISTANCE - " + DISTANCE);
		     System.out.println("LEAD_TIME - " + LEAD_TIME);
		     System.out.println("TRAFFIC_INFO - " + TRAFFIC_INFO);
		     System.out.println("CONTENT - " + CONTENT);
		     System.out.println("COURSE_LEVEL - " + COURSE_LEVEL);
		     System.out.println("--------------------");
		    }
		   }
		   else
		   {
		    System.out.println("HTTP connection response !=HTTP_OK");
		   }
		  } catch (Exception e)
		  {
		   e.printStackTrace();
		  }
		model.addAttribute("api", listapi);  
		
		
		List<AdminDto> res = biz.searchList(Admin_search, Admin_keyword);
		model.addAttribute("admin_list", res);
		System.out.println("입력 : " + Admin_search);
		System.out.println("검색 : " + Admin_keyword);
		return "Admin_list";
	}

	/* 등급조정 */
	@RequestMapping(value = "Admin_role.do", method = RequestMethod.POST)
	public String Adminrole(Model model, @RequestParam("member_id") String member_id,
			@RequestParam("member_role") String member_role, @RequestParam(required = false) String page) {
		System.out.println(member_id + "/" + member_role);

		int res = biz.roleUP(member_id, member_role);
		if (res > 0) {
			model.addAttribute("admin_list", res);
			model.addAttribute("page", page);
		}
		return "forward:Admin_list.do";
	}
	
	@RequestMapping(value = "Admin_searchload.do")
	public String Api(Model model, @RequestParam("COURSE_CATEGORY_NM") String COURSE_CATEGORY_NM, @RequestParam("Admin_keywordload") String Admin_keywordload) {
		System.out.println(COURSE_CATEGORY_NM);
		System.out.println(Admin_keywordload);
		List<APItest> res = biz.searchLoadList(COURSE_CATEGORY_NM, Admin_keywordload);
		model.addAttribute("admin_list", res);
		System.out.println("코스 입력 : " + COURSE_CATEGORY_NM);
		System.out.println("코스 검색 : " + Admin_keywordload);

		  return "Admin_list";
	}

	////////////////////////////////////////////////////////////////////////////////////////////////////
	/* NoticeBoard */

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
	public String NoticeBoarddetail(Model model, @RequestParam("noticeboard_no") int noticeboard_no) {
		// @RequestParam("seq") jsp파일에서 넘어오는 seq를 int seq에 넣어주겠다
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

	@RequestMapping(value = "NoticeBoard_insert.do", method = RequestMethod.POST)
	public String NoticeBoardinsetRes(Model model, @ModelAttribute NoticeBoardDto dto) {

		int res = NoticeBoardbiz.insert(dto);
		model.addAttribute("NoticeBoard_list", NoticeBoardbiz.selectAll());
		if (res > 0) {
			// return "/WEB-INF/view/boardList.jsp";
			// 위처럼 하면 새로고침할때 마다 글이 추가되기 때문에
			return "redirect:/NoticeBoard_list.do";
		} else {
			return "NoticeBoard_list";
		}
	}

	@RequestMapping("NoticeBoard_update.do")
	public String NoticeBoardupdateRes(Model model, @ModelAttribute NoticeBoardDto dto) {
		// @ModelAttribute는 form 태그에서 sumit으로 jsp에서 컨트롤로
		// 보내준것을 알아서 dto에 담겨서 가지고 온다
		int res = NoticeBoardbiz.update(dto);
		if (res > 0) {
			model.addAttribute("NoticeBoard_dto", NoticeBoardbiz.selectOne(dto.getNoticeboard_no()));
			return "forward:NoticeBoard_list.do";
		} else {
			model.addAttribute("NoticeBoard_dto", NoticeBoardbiz.selectOne(dto.getNoticeboard_no()));
		}
		return "forward:NoticeBoard_list.do";
	}

	@RequestMapping(value = "NoticeBoard_delete.do")
	public String deleteRes(Model model, @RequestParam("noticeboard_no") int noticeboard_no) {
		// jsp에서 submit으로 보냈지만 id만 필요해서 id만 받기위해
		// @RequestParam("id") 사용
		int res = NoticeBoardbiz.delete(noticeboard_no);
		if (res > 0) {
			model.addAttribute("NoticeBoard_list", NoticeBoardbiz.selectAll());
		}
		return "NoticeBoard_list";
	}

}