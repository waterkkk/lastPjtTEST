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
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
   type="text/css">
<link rel="stylesheet"
   href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"
   type="text/css">
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
#foot{
   width:100%;
   height:200px;
   position:absolute;
   margin-top:0px;
   background-color:#000000;
}
#space{
   height:100px;
   position:absolute;
   width:100%;
   top:50px;
}
#left{
   position:absolute;
   left:50px;
   display: inline-block;
}
#copy{
   display: inline-block;
   position:absolute;
   left:400px;
   top:70px;
}

</style>

</head>
<body>
<div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
</div>


   <form action="main.do" method="post">
   <div class="py-5 text-white opaque-overlay"
      style="background-image: url('resources/img/food.jpg'); background-size: 100% 100%">
      <div class="container">
         <br><br><br><br><br><br><br>
         <div class="row">
            <div class="col-md-7">
               <div align="center">
                  <h1 class="text-gray-dark"> 로그인 완료! </h1>
                  <p class="lead mb-4" align="center">
                회원님 환영합니다~! <br>제2의 인생과 함께 행복한 하루 보내세요
               </p>
               </div>

               <br>
               <div align="center">
                  <input type="submit" class="btn btn-primary" value="메인화면">
                  <input type="button" class="btn btn-primary" value="개인페이지" 
                      onclick="location.href='indi.do?id=${dto.member_id}'">
                      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                      </div>
               </div>


            </div>
         </div>
      </div>
   </div>

   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</form>
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


</body>
</html>