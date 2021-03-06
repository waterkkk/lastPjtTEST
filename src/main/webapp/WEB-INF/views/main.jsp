

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

@font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}

* {
   font-family: "Godo";
   font-size: 20px;
}

.dropdown-menu{
font-size: 20px;
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
.dropdown-item:hover,
.dropdown-item:focus,
.dropdown-item:active{
   background-color:#F08080;
   color:white;
}

#nav{
height:70px;
min-height: 70px;
margin: 0 auto;
padding: 0;
}
.bg-white{
   margin-bottom:200px;
}
</style>
</head>
<title>메인</title>
</head>

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
<link rel="stylesheet" href="./resources/css/codingBooster4.css">
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
            </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
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
        
    <div class="py-5 " style="background-image: url(&quot;resources/img/main.jpg&quot;); background-size: cover;" >
    <div class="container">
      <div class="row">
        <div class="col-md-12" align="right"><br/><br/>
          <h1 class="text-gray-dark">제2의 인생</h1><br/>
          <h3>&nbsp;&nbsp;평균수명 100세 시대, 절반의 행복을 이 사이트 하나로!</h3><br/><br/>
        </div>
      </div>
    </div>
  </div><br>
  <div class="py-5 bg-white" >
    <div class="container">
      <div class="row">
          <div class="py-5 col-md-3" >
          <div class="row">
            <div class="col-8 col-md-12">
              <h4 class="mb-3 text-primary"><b>배우는 기쁨</b></h4>
              <p class="my-1">&nbsp;평생학습, 배우는 즐거움.<br/> 나를 찾는 기쁨을 한껏 누려보세요.<br/> 검색하기 번거로우신가요? <br/>제 2의 인생이 도와드립니다. </p>
            </div>
          </div><br/>
           <div class="btn-group">
            <a href="eduoffList.do" class="btn btn-lg mx-1 btn-dark">교육게시판</a>
          </div>
        </div>
        <div class="py-5 col-md-3">
          <div class="row">
            <div class="col-8 col-md-12">
              <h4 class="mb-3 text-primary">
                <b>움직이는 희열</b>
              </h4>
              <p class="my-1">&nbsp;걷기 좋은 길,등산로 등 지도를 이용해 즐겁게 운동하며 건강까지 지킬 수 있는 방법이 많이 있습니다.<br/> 제 2의 인생에서 간편하게 찾아보세요. </p>
            </div>
            </div><br/>
           <div class="btn-group">
            <a href="Exercise_Walk.do" class="btn btn-lg mx-1 btn-dark">운동게시판</a>
          </div>
        </div>
        <div class="py-5 col-md-3">
          <div class="row">
            <div class="col-8 col-md-12">
              <h4 class="mb-3 text-primary">
                <b>맛있는 즐거움</b>
              </h4>
              <p class="my-1">&nbsp;운동 후 맛집에서 먹는 치킨과 시원한 맥주 한 잔! <br/> 평소에 건강하게 드시면 가끔 그 정도는 괜찮아요.<br/> 제 2의 인생에서 건강 정보도 함께하실 수 있습니다. </p>
            </div>
            </div><br/>
           <div class="btn-group">
            <a href="deli.do" class="btn btn-lg mx-1 btn-dark">음식게시판</a>
          </div>
        </div>
        <div class="py-5 col-md-3">
          <div class="row">
            <div class="col-8 col-md-12">
              <h4 class="mb-3 text-primary">
                <b>즐기는 기쁨</b>
              </h4>
              <p class="my-1">&nbsp;주변의 문화행사(뮤지컬 / 미술 / 전시회 / 영화 / 연극 / 무용 등), 도서관, 공원, 경로당을 찾아보세요. <br/>세상에는 재미있는 것이 참 많아요.
                <br> </p>
            </div>
            </div><br/>
           <div class="btn-group">
            <a href="Freetime_Culture.do" class="btn btn-lg mx-1 btn-dark">여가게시판</a>
          </div>
        </div>
    </div>
    </div>
  </div>  
<div class="py-5 text-black bg-white"  style="position: absolute; top:900px; left:50px;">
    <div class="container">
      <div class="row">
        <div class="col-md-6" >
   <h5 class="mb-3 text-primary">공지사항</h5>
          <div class="list-group" style="opacity: 1.0;">
            <a href="notice.do?currentPage=1" class="list-group-item list-group-item-action flex-column align-items-start">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1"><b>공지사항</b></h5>
                <small>2018.6.22</small>
              </div><br/>
              <p class="mb-1">우측 상단의 +를 누르면 화면이 커집니다.</p>
              <small class="text-muted">버튼을 눌러 사용해보세요.</small><br/>
            </a>
            <a href="notice.do?currentPage=1" class="list-group-item list-group-item-action flex-column align-items-start">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1"><b>공지사항</b></h5>
                <small class="text-muted">2018.6.26</small>
              </div><br/>
              <p class="mb-1">자유게시판의 글이 새롭게 등록되었습니다.</p>
              <small class="text-muted">새로운 글을 확인해보세요.<br/></small>
            </a>
            <a href="notice.do?currentPage=1" class="list-group-item list-group-item-action flex-column align-items-start">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1"><b>공지사항</b></h5>
                <small class="text-muted">2018.6.26</small>
              </div><br/>
              <p class="mb-1">서버 점검 안내</p>
              <small class="text-muted">점검시간 : 2018년 6월 29일 오전 7시~ 30일 오전 7시<br/></small>
            </a>
          </div>
        </div>
        <div class="col-md-6" style="float: right;">
        <h5 class="mb-3 text-primary">재미있는 영상</h5>
          <div class="embed-responsive embed-responsive-4by3 rounded">
            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/i__1Z5a9Sak?autoplay=0" allowfullscreen=""> </iframe>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div><br/><br/><br/><br/><br/>
  </div><br/><br/><br/><br/><br/>
  <br/><br/><br/><br/><br/>
  <br/><br/><br/><br/><br/>
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
  
</body>
</html>