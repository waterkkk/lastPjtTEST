<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%   request.setCharacterEncoding("UTF-8");%>
<%   response.setContentType("text/html; charset=UTF-8");
%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>


<head>
<style type="text/css">

@font-face {
font-family:"Godo";
src:url("resources/font/GodoB.ttf");
}

*{
   font-family:"Godo";
   font-size: 20px;
}

#nav{
margin: 0 auto;
padding: 0;
height:90px;
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

   .btn-modify{
      background-color:black;
      boder-rdadius : 5px 5px 5px 5px;
      border-color:black;
      color:white;
   }
   .btn-modify:hover,
   .btn-modify:focus{
      background-color:#F08080;
      border-radius:5px 5px 5px 5px;
      color:#ffffff;
   }
   .btn-do{
       display: inline-block;
  padding: 6px 12px;
  margin-bottom: 0;
  font-size: 14px;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
      touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
  background-image: none;
  border: 1px solid transparent;
  border-radius: 4px;
  color:white;
   }
   .btn-do:hover,
   .btn-do:focus{
      color:white;
      text-decoration:none;
      cursor:default;
   }
   .ZoomIn,
   .ZoomIn:hover,
   .ZoomIn:focus{
      cursor:zoom-in;
   }
   .ZoomOut,
   .ZoomOut:hover,
   .ZoomOut:focus{
      cursor:zoom-out;
   }
</style>
<script type="text/javascript">
var nowZoom = 100;
function ZoomIn(){
  nowZoom = nowZoom + 20;
  if(nowZoom >= 200) nowZoom = 200;
  zooms();
}
function ZoomOut(){
  nowZoom = nowZoom -10;
  if(nowZoom <=70) nowZoom = 70;
  zooms();
}
function zooms(){
  document.body.style.zoom = nowZoom + "%";
  if(nowZoom == 70) {
    alert("더 이상 축소할 수 없습니다.");
  }if(nowZoom == 200) {
    alert("더 이상 확대할 수 없습니다.");
  }
}

</script>
<!--jquery와 bootstrap.js파일 같이 연결해줘야 dropdown창이 실행됨-->
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap3.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap3.css">
<link rel="stylesheet" href="resources/css/codingBooster3.css?ver=1">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>




<!--header : 내비게이션 바--> 
<nav class="navbar navbar-default"  id="nav">
   <div class="container-fluid">

<!--내비게이션 헤더-->
      <div class="navbar-header">
         <button type="button" id="btn" class="navbar-toggle collapsed" data-toggle="collapse"
            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
         </button>
         <button type="button" id="home" class="btn-modify btn-lg"  onclick="location.href='main.do'" >제2의인생</button><!--내비게이션 제목-->     
      </div>
      
   
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </li>
             <li><button type="button" class="btn-modify btn-lg" onclick="location.href='notice.do?currentPage=1'" >공지사항</button></li><!--내비게이션 제목-->
            <li>&nbsp;</li>
            <!--dropdown 왼쪽--> 
            <li class="dropdown">
               <button type="button" class="btn-modify btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false" >교육<span class="caret"></span></button> 
               <ul class="dropdown-menu">
                  <li> <a class="dropdown-item" href="edu.do?currentPage=1">온라인</a></li>
                  <li><a class="dropdown-item" href="eduoffList.do">오프라인</a></li>
               </ul>
            </li>
            <li>&nbsp;</li>
            <li class="dropdown">
               <button type="button" class="btn-modify btn-lg dropdown-toggle"data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false" >운동<span class="caret"></span></button> 
               <ul class="dropdown-menu">
                  <li><a class="dropdown-item" href="Exercise_Walk.do">걷기</a></li>
                  <li><a class="dropdown-item" href="Exercise_Hiking.do">등산</a></li>
               </ul>
            </li>
            <li>&nbsp;</li>
            <li class="dropdown">
                <button type="button" class="btn-modify btn-lg dropdown-toggle"data-toggle="dropdown" aria-haspopup="true"
                  aria-expanded="false" >음식<span class="caret"></span></button>
               <ul class="dropdown-menu">
                  <li> <a class="dropdown-item" href="nutrition.do?currentPage=1">식품별</a></li>
                  <li> <a class="dropdown-item" href="food.do?currentPage=1">음식별</a></li>
                  <li> <a class="dropdown-item" href="deli.do">맛집</a></li>
               </ul>
            </li>
            <li>&nbsp;</li>
            <li class="dropdown">
                <button type="button" class="btn-modify btn-lg dropdown-toggle"data-toggle="dropdown" aria-haspopup="true"
                  aria-expanded="false" >여가<span class="caret"></span></button>
               <ul class="dropdown-menu">
                  <li> <a class="dropdown-item" href="Freetime_Culture.do">문화행사</a></li>
                  <li><a class="dropdown-item" href="Freetime_Library.do">도서관</a></li>
                  <li><a class="dropdown-item" href="Freetime_Park.do">공원</a></li>
                  <li><a class="dropdown-item" href="Freetime_Center.do">노인교실/경로당</a></li>
               </ul>
            </li>
            <li>&nbsp;</li>
            <li><button type="button" class="btn-modify btn-lg"  onclick="location.href='list.do'" >자유게시판</button></li>
            <li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <li><div class="nav-item" >        
                   <a class="btn-lg btn-do">화면 크기 조절</a>         
                 <img src="resources/img/plus.png" onclick="ZoomIn()" class="ZoomIn">
                    <img src="resources/img/minus.png" onclick="ZoomOut()" class="ZoomOut">             
              </div>      
         </li>
      </ul>



   <!--dropdown 오른쪽--> 
      <ul class="nav navbar-nav navbar-right">
         <li class="dropdown">
            <button type="button" class="btn-modify btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
               aria-expanded="false" >
               <c:if test="${empty dto.member_role }">
                  접속하기
               </c:if>
               <c:if test="${dto.member_role eq 'ADMIN'}">
                  관리자
               </c:if>
               <c:if test="${dto.member_role eq 'USER'}">
                  ${dto.member_id }
               </c:if>
               <span class="caret"></span></button>
            <ul class="dropdown-menu">
            <c:choose>
            <c:when test="${empty dto.member_id}"> 
               <li><a class="dropdown-item" href="loginStart.do">로그인</a></li>
               <li><a class="dropdown-item" href="regiStart.do">회원가입</a></li>
            </c:when>
            <c:when test="${dto.member_role eq 'USER' }">
                <li><a class="dropdown-item" href="indi.do?id=${dto.member_id }">개인 페이지</a>
                   <li><a class="dropdown-item" href="logout.do?member_id=${dto.member_id}">로그아웃</a></li>
            </c:when>
            <c:when test="${dto.member_role eq 'ADMIN' }">
                <li><a class="dropdown-item" href="Admin_list.do">관리자 페이지</a></li>
                <li><a class="dropdown-item" href="indi.do?id=${dto.member_id }">개인 페이지</a>
                   <li><a class="dropdown-item" href="logout.do?member_id=${dto.member_id}">로그아웃</a></li>
            </c:when>
              </c:choose>
            </ul>
         </li>
      </ul>
         </div>
      </div>
   </nav>
   
   

</body>
</html>