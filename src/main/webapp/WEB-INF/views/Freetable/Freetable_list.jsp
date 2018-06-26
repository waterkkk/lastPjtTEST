<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ page import="com.bom.dto.FreetableDto"%>
<%@ page import="com.bom.dao.FreetableDao"%>
<%@ page import="com.bom.biz.FreetableBiz"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"
	type="text/css">

<style type="text/css">
@font-face {
	font-family: "Godo";
	src: url("resources/font/GodoB.ttf");
}

* {
	font-family: "Godo";
}

/** 이하는 공통 **/
.normal {
	font-style: normal;
}

.w250 {
	font-weight: 250;
}

.w300 {
	font-weight: 300;
}

.w350 {
	font-weight: 350;
}

.w400 {
	font-weight: 400;
}

.w500 {
	font-weight: 500;
}

.w700 {
	font-weight: 700;
}

.w800 {
	font-weight: 800;
}

.w900 {
	font-weight: 900;
}

li span {
	line-height: 1.8;
	font-size: 1.3em;
}

body, table, div, p {
	font-family: 'Godo';
}

table {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	font-size: 17px;
	width: 80%;
	border-top: 1px solid #E1E6F6;
	border-bottom: 1px solid #E1E6F6;
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-collapse: collapse;
}

.tableth {
	padding: 5px;
	text-align: center;
	height: 30px;
	background-color: #F5F5F5;
	padding: 5px;
}



td {
	padding: 5px;
	text-align: center;
	height: 30px;
	padding: 5px;
}


.keyword {
	height: 25px;
}

#searching {
	height: 24px;
}

#paging1 {
	border: none;
	padding-left: 25%;
}

#paging2 {
	padding-left: 21%;
}

#rightbtn {align ="center";
	font-size: 14px;
}
</style>



<title>자유게시판</title>
</head>

<body>

	<!-- 헤더 -->
	<div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
</div>


	<div class="py-5"
		style="background-image: url('resources/img/nori.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
	<div class="div">
         <div class="jumbodiv">
            <h1 class="text-left">자유게시판</h1>
         </div>
      </div>
					<br />
					<h4 align="left">
						<b>&nbsp;</b>
					</h4>
					<br /> <br /> <br /> <br />
				</div>
			</div>
		</div>
	</div>




	<br>
	<br>
	<div class="content">
		<!--로그인-->
		<c:if test="${empty dto.member_id }">
         <div id="loginAlert" align="center">
            로그인해주시면 게시판을 이용하실 수 있습니다.<br> <br>
         </div>
         <div align="center">
            <input type="button" style="height: 50px; font-size: 20px;" class="btn btn-dark" onclick="location.href='loginStart.do'"
               value="로그인"> <br> <br> <br>
         </div>
      </c:if>
      <c:if test="${dto.member_id != null}">
		
		
		
		<c:choose>
			<c:when test="${empty map.keyword }">
				<div>
					<table border="1">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="40%">
							<col width="15%">
							<col width="10%">
						</colgroup>

						<tr>
							<th class="tableth">No.</th>
							<th class="tableth">작성자</th>
							<th class="tableth">제 목</th>
							<th class="tableth">날 짜</th>
							<th class="tableth">조회수</th>
						</tr>

						<c:choose>
							<c:when test="${empty allList}">
								<tr>
									<td colspan="9">─────── 작성된 글이 존재하지 않습니다.───────</td>
								</tr>
							</c:when>

							<c:otherwise>
								<c:forEach items="${allList}" var="dto">
									<c:choose>
										<c:when test="${dto.freetable_delFlag eq 'Y'}">
											<tr>
												<td colspan="9">─────── 삭제된 글입니다.───────</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td>${dto.freetable_no }</td>
												<td>${dto.freetable_id }</td>
												<td align="left" style="padding-left: 20px">
													<!-- 타이틀탭 수에 따라 앞부분 공백주기 --> <c:forEach begin="1"
														end="${dto.freetable_titleTab }">&nbsp;&nbsp;</c:forEach>
													<a href="freedetail.do?freetable_no=${dto.freetable_no}">${dto.freetable_title}</a>
												</td>
												<td>${dto.freetable_regDate }</td>
												<td>${dto.freetable_readCount }</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
					<br>

					
					<div align="center">
					<table style="border:none">
						<tr>
							<td id="paging2" colspan="4" align="center"><c:choose>
									<c:when test="${nowPage eq 1 }">◀</c:when>
									<c:otherwise>
										<a href="board.do?nowPage=${nowPage-1 }">◀</a>
									</c:otherwise>
								</c:choose> <c:forEach begin="${startPage }" end="${endPage }" var="i">
									<a href="board.do?nowPage=${i }">${i}</a>&nbsp;
				        </c:forEach> <c:choose>
									<c:when test="${nowPage eq countPage }">▶</c:when>
									<c:otherwise>
										<a href="board.do?nowPage=${nowPage+1} ">▶</a>
									</c:otherwise>
								</c:choose></td>

							<td align="right"><input id="writebtn" type="button"
								value="글쓰기" onclick="location.href='writeForm.do'"></td>
						</tr>
					</table>
					</div>
				</div>
				<br>
			</c:when>


			
			<c:otherwise>
				<div>
					<table border="1">
						<colgroup>
							<col width="10%">
							<col width="15%">
							<col width="40%">
							<col width="15%">
							<col width="10%">
						</colgroup>
						<tr>
							<th>No.</th>
							<th>작성자</th>
							<th>제 목</th>
							<th>날 짜</th>
							<th>조회수</th>
						</tr>
						<c:choose>
							<c:when test="${empty allList}">
								<tr>
									<td colspan="7">─────── 글이 존재하지 않습니다.───────</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${map.allList}" var="row">
									<tr>
										<td>${row.freetable_no}</td>
										<td>${row.freetable_id}</td>
										<td><a href="freedetail.do?freetable_no=${row.freetable_no}">${row.freetable_title}</a>
										</td>
										<td>${row.freetable_regDate}</td>
										<td>${row.freetable_readCount}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
			
			</c:otherwise>
        </c:choose>
     
        
        
			
			<br>
			<div align="center">
				<form action="search.do" method="get">
					<select name="searching" id="searching" style="height: 30px">
						<option value="freetable_id">작성자</option>
						<option value="freetable_title">글 제목</option>
						<option value="freetable_content">글 내용</option>
						<option value="freetable_no">글 번호</option>
					</select> <input name="keyword" value="${map.keyword}"> <input
						type="submit" value="검색">
				</form>
			</div>
			<br>
			<br>

		

	</div>
	
 <!-- footer2 -->
<div id="footer">
  <div class="py-3 bg-dark text-white">
    <div class="container">
      <div class="row" >
        <div class="col-md-8">
          <div class="col-md-12 mt-3 text-left">
            <p>상호명 : 언제나 봄날 </p>
            <p>주소 : 서울시 영등포구 양평동 3가 15-1 월드메르디앙비즈센터 4층 </p>
            <p>전화번호 : 02-5340-2233</p>
          </div>
        </div>
        </div>
        </div>
      <div class="row">
        <div class="col-md-12 mt-3 text-center">
          <p>Copyright@2018 언제나 봄날 </p>
        </div>
      </div>
     </div>
</div>
	
	</c:if>
</body>

</html>