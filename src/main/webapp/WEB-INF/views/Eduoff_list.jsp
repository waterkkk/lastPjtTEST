<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/eduoff_list.js"></script>
<script type="text/javascript" src="js/eduoff_search.js"></script>

<body>
	<div class="content">

		<div align="center">
			<form action="search.do" method="get">
				<h2>강의목록</h2>
				<select name="선택" id="searching">
					<option value="course_id">선택</option>
					<option value="course_nm">강의명</option>
					<option value="course_request_str_dt">신청시작일</option>
					<option value="course_str_dt">강의시작일</option>
				</select> 
				<input id="keyword" placeholder="ex)영어"> <!-- value 입력할것 -->
				<button id="search" onclick="searchLoc();">검색</button>
				<br>
				<br>
			</form>
		</div>

		<div align="center">
			<form>
				<table>
					<thead></thead>
					<tbody></tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>