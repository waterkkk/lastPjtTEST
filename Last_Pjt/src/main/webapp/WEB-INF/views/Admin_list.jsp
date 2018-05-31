<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 -리스트</title>
 <style type="text/css">

/*      @import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

* {
	font-family: 'Nanum Gothic Coding';
	text-align: center;
} */

#table1 {
	display: none;
}

</style> 
<script type="text/javascript">


function test1(){

	$.ajax({        
        url: "http://openapi.seoul.go.kr:8088/427958685873776539364e63494a53/xml/SeoulGilWalkCourse/2/999",
        type: "get",
        dataType:"text",
        success:function(api){
        		document.write(api);
        		alert("성공"); 
		},				
		error:function(){								
			alert("실패"); 
		}
	});
        }
</script>
</head>
<body>
	<div class="container">
	<h3>회원 리스트</h3>
	<br/><br/>
	<form class="form-inline m-0" action="Admin_search.do" method="post">
      <input type="hidden" name="Admin_search.do" value="Admin_keyword">
		<select name="Admin_search" id="Admin_search" class="form-control">
			<option value="member_id">ID</option>
			<option value="member_name">이름</option>
		</select>
		<input type="text" class="form-control" name="Admin_keyword" id="Admin_keyword" placeholder="ID/이름을 입력하세요">
		<button type="submit" class="btn btn-primary" >검색</button>
		<button class="btn btn-primary" onclick="location.href='Admin_list.do'" name="<%= page%>" >목록</button>
        </form>
        </div>
      <div class="container">
			<table class="table table-hover">
					<tr>
						<th>ID</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>가입여부</th>
						<th>가입날짜</th>
						<th>등급</th>
						<th>등급조정</th>
					</tr>
      
	<c:choose>
		<c:when test="${empty admin_list }">
			<h3>******회원정보가 없습니다.*******</h3>
		</c:when>
		      <c:otherwise>
					<c:forEach items="${requestScope.admin_list }" var="admin_dto">
						<tr>
							<td><a href="Admin_detail.do?member_id=${admin_dto.member_id }">${admin_dto.member_id }</a></td>
							<td>${admin_dto.member_name }</td>
							<td>${admin_dto.member_email }</td>
							<td>${admin_dto.member_phone }</td>
							<td>${admin_dto.member_enabled }</td>
							<td>${admin_dto.member_date }</td>
							<td>${admin_dto.member_role }</td>
							<td>
                  			 <form action="Admin_role.do" method="post">
                      			<input type="hidden" name="member_id" value="${admin_dto.member_id}"/>
                        		<select name="member_role" id="${admin_dto.member_role}" class="form-control">
									<option value="회원">회원</option>
									<option value="관리자">관리자</option>
								</select>
                       			<button type="submit" class="btn btn-primary">저장</button>
                    		  </form>
                			</td>
						</tr>
					</c:forEach>
				</c:otherwise>	
	</c:choose>			
					<tr>
						<td colspan="3">
							<button class="btn btn-primary" onclick="location.href='Admin_write.do'">회원 추가</button>
							<button class="btn btn-primary" onclick="location.href='index.jsp'">메인</button>
							<button class="btn btn-primary" onclick="location.href='NoticeBoard_list.do'">공지사항 </button>
						</td>			
					</tr>
			</table>
		</div>
<br/><br/><br/>
		<div class="container">
		<h3>코스 검색</h3>
				<form class="form-inline m-0" action="Admin_searchload.do" method="post">
				 <input type="hidden" name="Admin_searchload.do" value="Admin_keywordload">
						<label for="course_name" class="hiddem">상세 검색</label>
						<div class="form-group">
						<input type="text" name="Admin_keywordload" class="form-control" id="Admin_keywordload" placeholder="직접 입력할 수 있습니다."/>
						</div>
						<label for="se01" class="label01 end" class="form-control">유 형 별</label>
						<select name="Admin_searchload" id="Admin_searchload" class="form-control">
							<option value="">전체</option>
							<option value="1000">생태문화길</option>
							<option value="2000">서울둘레길</option>
							<option value="3000">근교산자락길</option>
							<option value="4000">한양도성길</option>
							<option value="5000">한강/지천길</option>
						</select>
						<label for="se02" class="label01" class="form-control">지 역 별</label>
						<select id="se02" name="south_north_div" title="지역 검색" onchange="changeArea(this.value); return false;" class="form-control">
							<option value="1">전체</option>
						</select>
						<label for="se03" class="blind">지역별</label>
						<select id="se03" name="AREA_GU" title="구 검색" class="form-control">
							<option value="">전체</option>
						</select>
						<button type="submit" class="btn btn-primary" ><img src="http://gil.seoul.go.kr/walk/images/main/s_btn.gif" alt="검색" /></button>
						<button type="submit" class="btn btn-primary" >검색</button>
						</form>
	</div>
	<br/><br/><br/>
	
	<input type="button" value="api테스트" onclick="test1();" />
	<div class="container">
	<table class="table1">
<%-- 	<c:choose>
	<c:when test="${empty api }">
			<h3>******회원정보가 없습니다.*******</h3>
		</c:when>
		      <c:otherwise>
		<c:forEach items="${requestScope.api }" var="api">
			
		<tr>
			<th class="tr1th">유형</th>
			<th class="tr2th">코스</th>
			<th class="tr1th">지역</th>
			<th class="tr2th">거리</th>
			<th class="tr1th">소요시간</th>
			<th class="tr2th">교통편</th>
			<th class="tr2th">난이도</th>
			<th class="tr1th" width="50">설명</th>
		</tr>
		  <tr>
			<td class="tr1td" id="td1" width="10">${api.COURSE_CATEGORY_NM }</td>
			<td class="tr2td" id="td2" width="10">${api.COURSE_NAME }</td>
			<td class="tr1td" id="td3" width="10">${api.AREA_GU }</td>
			<td class="tr2td" id="td4" width="10">${api.DISTANCE }</td>
			<td class="tr1td" id="td5" width="10">${api.LEAD_TIME }</td>
			<td class="tr2td" id="td6" width="30">${api.TRAFFIC_INFO }</td>
			<td class="tr1td" id="td7" width="30">${api.COURSE_LEVEL }</td>
			<td class="tr1td" id="td7" width="30">${api.CONTENT }</td>
		</tr>  
		</c:forEach>
		</c:otherwise>
		</c:choose> --%>
	</table> 
	</div>
	
	<br/><br/><br/>
	
<%
/* String name = request.getParameter("COURSE_CATEGORY_NM");
System.out.println("COURSE_CATEGORY_NM : " + name);
out.println("COURSE_CATEGORY_NM : " + name);

String abc[] = request.getParameterValues("nodelist");
for(int i = 0; i < abc.length; i++){
	out.println("nodelist[+i+]" + abc[i] + "<br/>");
}
System.out.println("COURSE_CATEGORY_NM : " + name); */
%>

	<div class="container" style="margin: auto;" >
	<c:if test="${startPage>3 }">
     [<a href="Admin_list.do?page=${startPage - 1 }" id="paging">이전</a>]
    </c:if>

    <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
     <c:if test="${i==currentPage }">
     [<a href="Admin_list.do?page=${i }" id="cur_paging">${i }</a>]
     </c:if>
     <c:if test="${i!=currentPage }">
     [<a href="Admin_list.do?page=${i }" id="paging">${i }</a>]
     </c:if>
    </c:forEach>

    <c:if test="${endPage<totalP }">
     [<a href="Admin_list.do?page=${endPage + 1 }" id="paging">다음</a>]
    </c:if>
	
	</div>
<%@ include file="bootstrap.jsp" %>
<br/><br/><br/><br/>


</body>
</html>