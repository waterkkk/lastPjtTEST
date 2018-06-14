<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ page import="com.bom.dto.FreetableDto"%>
<%@ page import="com.bom.dao.FreetableDao"%>
<%@ page import="com.bom.biz.FreetableBiz"%>
<%@ page import="com.bom.dto.FreecommDto"%>
<%@ page import="com.bom.dao.FreecommDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"
	type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
	text-align: left;
	font-size: 17px;
	width: 80%;
	align: "center";
	border-top: 1px solid #E1E6F6;
	border-bottom: 1px solid #E1E6F6;
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-collapse: collapse;
	padding: 5px;
}

textarea {
	width: 100%;
}

th {
	padding: 5px;
	text-align: center;
	height: 30px;
	background-color: #F5F5F5;
	padding: 5px;
	border-top: 1px solid #E1E6F6;
	border-bottom: 1px solid #E1E6F6;
	border-left: 1px solid white;
	border-right: 1px solid white;
}
#oktable {
	border: none;
}
</style>
<title>댓글에 답글달기</title>
</head>

<body>

<div class="py-5"
		style="background-image: url('images/nori.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-gray-dark" align="left">
						<b>자유게시판</b></h1>
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

	<br><br>
	<div class="title" align="center">
	<h2><b>댓글에 답글달기</b></h2>
	</div>
	<br>
	
	<form action="commReInsert.do">
		<input type="hidden" name="freetable_no" value="${commRe.freetable_no}">
		<input type="hidden" name="freecomm_no" value="${commRe.freecomm_no }">
		<input type="hidden" name="freecomm_id" value="${commRe.freecomm_id }">
		<input type="hidden" name="freecomm_groupNo" value="${commRe.freecomm_groupNo}">
		<input type="hidden" name="freecomm_step" value="${commRe.freecomm_step}">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" style='border:none'  value="${commRe.freecomm_id}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td ><textarea rows="10" cols="60" name="freecomm_content"></textarea></td>
				</tr>
		</table><br>
		<table id="oktable">
				<tr>
					<td colspan="2" align="right">
					<input type="submit"  value="답글달기"> 
					<input	type="button" value="취소" 
					onclick="location.href='detail.do?freetable_no=${commRe.freetable_no}'"></td>
				</tr>
		</table>
	</form>

<!-- 	<div id="footer"> -->
<%-- 	<%@ include file="Form/Footer.jsp"%> --%>
<!-- 	</div> -->

</body>
</html>