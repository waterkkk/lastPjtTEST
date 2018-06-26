<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%   request.setCharacterEncoding("UTF-8");%>
<%   response.setContentType("text/html; charset=UTF-8");%>
<%@page import="com.bom.dao.RegistDao" %>
<%@page import="com.bom.dto.RegistDto" %>
<%@page import="com.bom.biz.RegistBiz" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"   type="text/css">
<link rel="stylesheet"   href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"   type="text/css">
<link rel="stylesheet" href="resources/css/footer.css?ver=2">
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/registAjax.js"></script>
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
.opaque-overlay{
   position:absolute;
   width:100%;
   height:1100px;
}
.container{
   position: absolute;
   top:10%;
   left:5%;
}
</style>
</head>

<body >
<div id="header">
   <%@ include file="../Form/Header4.jsp"%> 
</div>
<div id="body" style="overflow:scroll;">
   <div class="py-5 text-white opaque-overlay"   style="background-image: url('resources/img/food.jpg'); background-size: 100% 100%">
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
                     </div><br>
                     
            </div>
         </div>
      </div>
   </div>
</div>
   

   <script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<div id="foot">
   <div id="space">
      <div id="left">
         <p style="color:white; font-size:15pt;">상호명 : 언제나 봄날</p>
         <p style="color:white; font-size:15pt;">주소 : 서울시 영등포구 양평동 3가 15-1 월드메르디앙비즈센터 4층</p>
         <p style="color:white; font-size:15pt;">전화번호 : 02-5340-2233</p>
      </div>
      <div id="copy">
         <p style="color:white; font-size:15pt;">Copyright@2018 언제나 봄날</p>
      </div>
   </div>
</div>
</body>
</html>