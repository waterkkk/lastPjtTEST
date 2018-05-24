<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자-공지사항리스트</title>
</head>
<body>
	<h4>공지사항</h4>
	<br/><br/>
	<div class="container">
		<table class="table table-hover">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>글삭제</th>
		</tr>
		<c:choose>
			<c:when test="${empty NoticeBoard_list }">
				<h3>******회원정보가 없습니다.*******</h3>
			</c:when>
			<c:otherwise>
				<c:forEach items="${NoticeBoard_list }" var="NoticeBoard_dto">
					<tr>
						<td>${NoticeBoard_dto.noticeboard_no }</td>
						<td><a href="NoticeBoard_detail.do?noticeboard_no=${NoticeBoard_dto.noticeboard_no }">${NoticeBoard_dto.noticeboard_title }</a></td>
						<td>${NoticeBoard_dto.noticeboard_writer }</td>
						<td>${NoticeBoard_dto.noticeboard_content }</td>
						<td>${NoticeBoard_dto.noticeboard_regdate }</td>
						<td>${NoticeBoard_dto.noticeboard_count }</td>
						<td><a href="NoticeBoard_delete.do?noticeboard_no=${NoticeBoard_dto.noticeboard_no }">[삭제]</a></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<tr>
						<td colspan="3">
							<button class="btn btn-primary" onclick="location.href='index.jsp'">메인</button>
							<button class="btn btn-primary" onclick="location.href='NoticeBoard_write.do'">공지사항 작성</button>
						</td>			
					</tr>
			</table>
			</div>
<%@ include file="bootstrap.jsp" %>
</body>
</html>