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
  @font-face {
	font-family: "Godo";
	src: url("resources/font/GodoB.ttf");
}

 /*     @import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

* {
	font-family: 'Nanum Gothic Coding';
 	text-align: center; 
} */

</style> 
<script type="text/javascript">

</script>
</head>
<body>
   <div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
	</div><br/><br/><br/>

	<div class="container">
	<h3>회원 리스트</h3>
	<br/><br/>
	<div style="float: right;">
	<button class="btn btn-dark" onclick="location.href='index.jsp'">메인</button>&nbsp;&nbsp;
	<button class="btn btn-dark" onclick="location.href='NoticeBoard_list.do'">공지사항 </button>
	</div>
	<form class="form-inline m-0" action="Admin_search.do" method="post">
      <input type="hidden" name="Admin_search.do" value="Admin_keyword">
		<select name="Admin_search" id="Admin_search" class="form-control">
			<option value="member_id">ID</option>
			<option value="member_name">이름</option>
		</select>
		<input type="text" class="form-control" name="Admin_keyword" id="Admin_keyword" placeholder="ID/이름을 입력하세요">&nbsp;&nbsp;
		<button type="submit" class="btn btn-dark" >검색</button>
        </form><br/><br/><br/><br/>
        
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
                       			<button type="submit" class="btn btn-dark">저장</button>
                    		  </form>
                			</td>
						</tr>
					</c:forEach>
				</c:otherwise>	
	</c:choose>			
	
					<tr>
						<td colspan="1"><br/><br/>
							<button class="btn btn-dark" onclick="location.href='Admin_write.do'">회원 추가</button>
						</td>			
					</tr>
			</table>
		</div>
<br/><br/><br/>

	<div class="container" style="text-align: center;" >
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
<br/><br/><br/><br/>

</body>
</html>