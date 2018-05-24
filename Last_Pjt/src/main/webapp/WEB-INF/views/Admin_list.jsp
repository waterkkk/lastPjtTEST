<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 -리스트</title>
</head>
<body>
	<h3>회원 리스트</h3>
	<br/><br/>
	<div class="container">
	<form class="form-inline m-0" action="Admin_search.do" method="post">
      <input type="hidden" name="Admin_search.do" value="Admin_keyword">
		<select name="Admin_search" id="Admin_search" class="form-control">
			<option value="member_id">ID</option>
			<option value="member_name">이름</option>
		</select>
		<input type="text" class="form-control" name="Admin_keyword" id="Admin_keyword">
		<button type="submit" class="btn btn-primary">검색</button>
		<button class="btn btn-primary" onclick="location.href='Admin_list.do'">목록</button>
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
						<th>등급</th>
						<th>등급조정</th>
					</tr>
      
	<c:choose>
		<c:when test="${empty admin_list }">
			<h3>******회원정보가 없습니다.*******</h3>
		</c:when>
		      <c:otherwise>
					<c:forEach items="${admin_list }" var="admin_dto">
						<tr>
							<td><a href="Admin_detail.do?member_id=${admin_dto.member_id }">${admin_dto.member_id }</a></td>
							<td>${admin_dto.member_name }</td>
							<td>${admin_dto.member_email }</td>
							<td>${admin_dto.member_phone }</td>
							<td>${admin_dto.member_enabled }</td>
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
<%@ include file="bootstrap.jsp" %>
</body>
</html>