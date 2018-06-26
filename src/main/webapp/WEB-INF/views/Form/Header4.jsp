<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   request.setCharacterEncoding("UTF-8");%>
<%   response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html >
<html>

<head>
<style type="text/css">

@font-face {
font-family:"Godo";
src:url("font/GodoB.ttf");
}

*{
   font-family:"Godo";
   font-size: 20px;
}

.btn-do{
color: white;
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
   color:white;
   border-color:black;
   border:none;
   border-radius:5px 5px 5px 5px;
}
.btn-modify:hover,
.btn-modify:focus,
.btn-modify:active{
   background-color:#F08080;
   bordor-color:black;
   color:white;
}

#nav{
margin: 0 auto;
padding: 0;
height:70px;

}
.ZoomIn{
   cursor:zoom-in;
}
.ZoomOut{
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
<link rel="stylesheet"   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"   type="text/css">
<link rel="stylesheet"   href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"   type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap4.css">
<link rel="stylesheet" href="./resources/css/codingBooster4.css?ver=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<!--내비게이션 바-->
   <nav class="navbar navbar-default navbar-expand-sm" id="nav" background-color: black;" >
      <div class="container-fluid" style="background-color: black;">
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <div class="navbar-header">
               <button type="button" class="btn-lg btn-modify" onclick="location.href='index.jsp'">제2의인생</button>
            </div>
            
            <div class="nav navbar-nav">
               <button type="button" class="btn-lg btn-modify" onclick="location.href='notice.do?currentPage=1'">공지사항</button>
            <div class="nav-item dropdown">
                  <button type="button" class="btn-lg btn-modify dropdown-toggle"
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">교육</button>
               <div class="dropdown-menu">
                  <a class="dropdown-item" href="edu.do?currentPage=1">온라인</a> 
                  <a class="dropdown-item" href="eduoffList.do">오프라인</a>
               </div>
            </div>

            <div class="nav-item dropdown">
               <button type="button" class="btn-lg btn-modify dropdown-toggle"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">운동</button>
               <div class="dropdown-menu">
                  <a class="dropdown-item" href="Exercise_Walk.do">걷기</a> 
                  <a class="dropdown-item" href="Exercise_Hiking.do">등산</a> 
               </div>
            </div>

            <div class="nav-item dropdown">
               <button type="button" class="btn-lg btn-modify dropdown-toggle"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">음식</button>
               <!--caret: 아랫쪽 화살표-->
               <div class="dropdown-menu">
                  <a class="dropdown-item" href="nutrition.do?currentPage=1">식품별</a> 
                  <a class="dropdown-item" href="food.do?currentPage=1">음식별</a> 
                  <a class="dropdown-item" href="deli.do">맛집</a>
               </div>
            </div>
            
            
            <div class="nav-item dropdown">
               <button type="button" class="btn-lg btn-modify dropdown-toggle"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">여가</button>
               <div class="dropdown-menu">
                  <a class="dropdown-item" href="Freetime_Culture.do">문화행사</a> 
                  <a class="dropdown-item" href="Freetime_Library.do">도서관</a> 
                  <a class="dropdown-item" href="Freetime_Park.do">공원</a> 
                  <a class="dropdown-item" href="Freetime_Center.do">노인교실/경로당</a>
               </div>
            </div>
            
            <div class="nav-item">
               <button type="button" class="btn-lg btn-modify" onclick="location.href='list.do'">자유게시판</button>
            </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
            <div class="nav-item" style="vertical-align: middle;">
               <div>
                  <img src="./resources/img/plus.png" onclick="ZoomIn()" class="ZoomIn">&nbsp; 
                  <img src="./resources/img/minus.png" onclick="ZoomOut()" class="ZoomOut">
               </div>
            </div>
            
            <div>
               <a class="btn btn-lg btn-do" style="color: white;">화면 크기 조절</a>
            </div>
            
         </div>


         <!--dropdown 오른쪽-->

         <div class="nav navbar-nav navbar-right">
            <div class="nav-item dropdown">
               <button type="button"
                  class="btn-lg btn-modify dropdown-toggle "
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <c:if test="${empty dto.member_role }">
                     접속하기
                  </c:if>
                  <c:if test="${dto.member_role eq 'ADMIN' }">
                     관리자
                  </c:if>
                  <c:if test="${dto.member_role eq 'USER' }">
                     ${dto.member_id }
                  </c:if>
                  </button>
               <div class="dropdown-menu">
                  <div class="col-md-12">
                  <c:choose>
                     <c:when test="${empty dto.member_id || dto.member_id==null }">
                        <a class="dropdown-item" href="loginStart.do">로그인</a>
                        <a class="dropdown-item" href="regiStart.do">회원가입</a>
                        </c:when>
                     <c:otherwise>
                     <c:if test="${dto.member_role eq 'ADMIN' }">
                     <a class="dropdown-item" href="Admin_list.do">관리자 페이지</a>
                     </c:if>                     
                        <a class="dropdown-item" href="indi.do?id=${dto.member_id}">개인 페이지</a>
                        <a class="dropdown-item" href="logout.do?member_id=${dto.member_id}">로그아웃</a>
                     </c:otherwise>
                   </c:choose>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</nav>






</body>
</html>