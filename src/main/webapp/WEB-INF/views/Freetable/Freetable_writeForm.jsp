<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@ page import="com.bom.dto.FreetableDto"%>
<%@ page import="com.bom.dao.FreetableDao"%>
<%@ page import="com.bom.biz.FreetableBiz"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/editor/ckeditor.js"></script>
<link rel="stylesheet" href="resources/editor/samples/css/samples.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"
	type="text/css">
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<style type="text/css">


@font-face {

font-family:"Godo";
src:url("resources/font/GodoB.ttf");
}

*{
	font-family:"Godo";
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
	text-align: left;
	font-size: 17px;
	width: 80%;
	align: "center";
	border-top: 1px solid #E1E6F6;
	border-bottom: 1px solid #E1E6F6;
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-collapse: collapse;
}

textarea {
	width: 100%;
}

.tableth {
	padding: 5px;
	text-align: center;
	height: 30px;
	background-color: #F5F5F5;
	padding: 5px;
}

#oktable {
	border: none;
}
</style>


<title>FreetableWriteForm</title>
</head>
<body>

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
					<br />
					<br />
					<br />
					<br />
				</div>
			</div>
		</div>
	</div>
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


	<br><br>
	<div class="title" align="center">
	<h2><b>글쓰기</b></h2>
	</div>
	<br>
	
   <div class="content">
	<form action="write.do" method="post">
 
		<table id="table" border="1" >
			<col width="15%">
			<col width="65%">

			<tr>
				<th class="tableth">작성자</th>
				<td><input type="text" style='border:none' name="member_id" value="${dto.member_id}" readonly="readonly"></td>

			</tr>

			<tr>
				<th class="tableth">제목</th>
				<td><input type="text" name="freetable_title"></td>
			</tr>
			


			<tr>
				<th class="tableth">내용</th>
				<td><textarea rows="100%" cols="100%" id="freetable_content" name="freetable_content" class="ckeditor"></textarea>	
				<script>CKEDITOR.replace("freetable_content");</script></td>
		
			</tr>
			
		</table><br>
		<table id="oktable">
			<tr>
				<td colspan="2" align="right">
					<input type="submit"  value="작성완료">
					<input type="button" value="취소" onclick="location.href='board.do?nowPage=1'"></td>
			</tr>
		</table>
	</form>
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