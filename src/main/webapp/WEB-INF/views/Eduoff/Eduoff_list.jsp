<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"	type="text/css">
<link rel="stylesheet"	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"	type="text/css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
</head>

<style type="text/css">
@font-face {
  font-family: 'Godo';
  font-style: normal;
  font-weight: 300;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff') format('woff');
}

 @font-face { 
   font-family: 'Godo'; 
   font-style: normal; 
   font-weight: 600; 
   src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff') format('woff'); 
 } 

.godo * {
 font-family: 'Godo', sans-serif;
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

body, table, div, p, h1, h2, h5, h4 {
font-family:'Godo';
}


table {
	margin-left: auto;
	margin-right: auto;
	align:center;
	text-align: center;
	font-size: 17px;
	width: 80%;
	border-top: 1px solid #E1E6F6;
	border-bottom: 1px solid #E1E6F6;
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-collapse: collapse;	
}

#keytable{	
	margin-left: auto;
	margin-right: auto;
	width: 80%;
	table-layout:auto;
	align:center;
	text-align: center;
	font-size: 17px;
	border-top: 1px solid #E1E6F6;
	border-bottom: 1px solid #E1E6F6;
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-collapse: collapse;	

}

th {
	padding: 5px;
	text-align: center;
	height: 30px;
	background-color: #F5F5F5;
	padding: 5px;
}

td {
	padding: 5px;
}
#searching{
	margin-left: auto;
	margin-right: auto;
}
.url{
font-size:3px;
}

</style>

<body>

	<%-- 			<c:if test="${empty dto.member_id }"> --%>
	<!-- 			  <div id="loginAlert"> -->
	<!-- 			  	게시판을 보기 위해서는 <a id="doLogin" href="loginStart.do">로그인</a>이 필요합니다 -->
	<!-- 				<br><br><br><br> -->
	<!-- 			  </div> -->
	<%-- 			</c:if> --%>

	<%-- 		<c:if test="${dto.member_id != null}"> --%>
    
    <div class="py-5 text-white opaque-overlay"
		style="background-image: url('images/backtoschool.jpg'); background-size: 100% 100%">
    	<div class="container">
     	      	<div class="col-md-12">
         	  <h1 class="text-gray-dark" align="right" style="font-family:'Godo';"><b>오프라인 강의 찾아보기</b></h1><br/>
         	  <h4 align="right" style="font-family:'Godo';"><b>오프라인 교육을 찾아보세요! 강좌명, 수강일자를 확인하고</b>
         	  <br/><br>  링크를 통해 바로 수강신청하실 수 있습니다.</h4><br/>
        	    	 
   	    </div>
   	    	<div class="col-md-12" align="right" >
				<a class="btn btn-primary btn-lg">오프라인 강의 찾아보기</a>
				<a href="eduoffMap.do" class="btn btn-outline-primary btn-lg">지도에서	교육기관 찾아보기</a>
			</div>		
    	</div>
</div>

<!-- 검색 -->
	
		<br><br><div align="center">
			<form action="gangSelect.do" method="get">
				<select name="searching2" id="searching2" >
					<option value="course_nm">강의명</option>
					<option value="course_request_str_dt">신청시작일</option>
					<option value="course_str_dt">교육시작일</option>
				</select> 
				<input type="text" name="keyword2" id="keyword2" placeholder="ex)영어"	value="${map2.keyword2}"> 
				<input type="submit" id="result" value="검색">
			</form>
		</div>
	    <br><br>
	    
<!-- 테이블 -->
	  <c:if test="${empty map2.keyword2}">
		<div>

				<table>
					<colgroup>						
						<col style="width:40%">
						<col style="width:8%">
						<col style="width:8%">
						<col style="width:8%">
						<col style="width:8%">
						<col style="width:8%">
						<col style="width:20%">
					</colgroup>
					<tr>
						<th>강의명</th>
						<th>신청시작일</th>
						<th>신청종료일</th>
						<th>교육시작일</th>
						<th>교육종료일</th>
						<th>정원</th>
						<th id="url">수강신청 URL</th>
					</tr>
				<c:choose>
					<c:when test="${empty allList}">
						<tr>
							<td colspan="7" align="center">─────── 작성된 글이 존재하지 않습니다.	───────</td>
						</tr>
					</c:when>
					<c:otherwise>	 				
							<c:forEach items="${allList}" var="dto">								
								<tr>
									<td align="center">${dto.course_nm}</td>
									<td align="center">${dto.course_request_str_dt }</td>
									<td align="center">${dto.course_request_end_dt }</td>
									<td align="center">${dto.course_str_dt}</td>
									<td align="center">${dto.course_end_dt}</td>
									<td align="center">${dto.capacity}</td>
									<td align="center"  id="url">${dto.course_apply_url}</td>
								</tr>
							</c:forEach>
					</c:otherwise>
				</c:choose>
				</table>
			</div>
	
 </c:if>


<!-- 검색결과 -->
		<c:if test="${map2.keyword2 != null}">
		<div id="searchtbl" align="center">
				<table style="margin-left:auto; margin-right:auto; width:800px; border-top: 1px solid #E1E6F6;
				border-bottom: 1px solid #E1E6F6; border-left: 1px solid white; border-right: 1px solid white;" >
					<colgroup>						
						<col style="width:200">
						<col style="width:80">
						<col style="width:80">
						<col style="width:80">
						<col style="width:80">
						<col style="width:80">
						<col style="width:200">
					</colgroup>
					<tr>
						<th>강의명</th>
						<th>신청시작일</th>
						<th>신청종료일</th>
						<th>교육시작일</th>
						<th>교육종료일</th>
						<th>정원</th>
						<th>수강신청 URL</th>
					</tr>
					<c:forEach items="${map2.allList}" var="dto" >
						<tr>
							<td>${dto.course_nm}</td>
							<td>${dto.course_request_str_dt }</td>
							<td>${dto.course_request_end_dt }</td>
							<td>${dto.course_str_dt}</td>
							<td>${dto.course_end_dt}</td>
							<td>${dto.capacity}</td>
							<td>${dto.course_apply_url}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</c:if>


		<!-- 페이징 -->
		<div align="center">
			<table>
				<tr>
					<td colspan="4" align="center"><c:choose>
							<c:when test="${nowPage eq 1 }">◀</c:when>
							<c:otherwise>
								<a href="board2.do?nowPage=${nowPage-1 }">◀</a>
							</c:otherwise>
						</c:choose> <c:forEach begin="${startPage }" end="${endPage }" var="i">
							<a href="board2.do?nowPage=${i }">${i}</a>&nbsp;
				        </c:forEach> <c:choose>
							<c:when test="${nowPage eq countPage }">▶</c:when>
							<c:otherwise>
								<a href="board2.do?nowPage=${nowPage+1} ">▶</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</div>

		<%--  </c:if> --%>
</body>
</html>