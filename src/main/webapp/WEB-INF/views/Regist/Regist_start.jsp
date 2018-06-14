<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@page import="com.bom.dao.RegistDao" %>
<%@page import="com.bom.dto.RegistDto" %>
<%@page import="com.bom.biz.RegistBiz" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"	type="text/css">
<link rel="stylesheet"	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"	type="text/css">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/registAjax.js"></script>
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

</style>
</head>

<body>
	<div class="py-5 text-white opaque-overlay"	style="background-image: url('images/food.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-gray-dark">회원가입</h1>
					<p class="lead mb-4">
						제2의인생과 함께하세요! 회원가입을 하시면 <br> 게시판 글쓰기와&nbsp; 캘린더를 통한 일정관리가
						가능합니다.&nbsp;
					</p>

					

						<div class="form-group">
							<label>아이디</label>
							<div><input type="text" name="member_id" id="member_id" title="n" class="form-control" 
							placeholder="아이디를 입력해 주세요." required="required"><input type="button" value="중복확인" class="btn btn-primary"  
						      onclick="idChk();">  <div id="idChk"></div></div>						
						</div>
						
						<div class="form-group">
							
							<div>
							<label>비밀번호</label> 
							<input type="password"  id="member_pw" class="form-control" 
								placeholder="비밀번호를 입력해 주세요. (숫자,글자 포함 9자리수 이상)"  required="required">
							</div>
							
							<div>
							<label>비밀번호 재입력</label> 
							<input type="password"  id="member_pw2" class="form-control" 
								placeholder="비밀번호를 다시 입력해 주세요. (숫자, 글자 포함 9자리수 이상)"   required="required">
							</div>
							 <div id="pwChk"></div>
							<br>
							
							<div>
							<label>이름</label>
							<input type="text" class="form-control"   id="member_name"
								placeholder="이름을 입력해 주세요. 예)김인생"  required="required">
							</div>
							
							<br>
							<div>				
							<label>이메일</label>
							<input type="email" class="form-control" id="member_email"
								placeholder="메일주소를 입력해 주세요. 예)secondlife@naver.com" required="required" >
							</div>
							
							<div>
							<label>전화번호</label>
							<input type="text" class="form-control"   id="member_phone"   
								placeholder="전화번호를 입력해 주세요.(기호 없이 입력) 예)03100001234" required="required" >
							</div>
						</div>
						   			
							<div align="center"><br>
							<input type="button" onclick="insertUser();" id="regist" value="회원가입" class="btn btn-primary">
							</div>
							
				</div>
			</div>
		</div>
	</div>
	

	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>

</html>