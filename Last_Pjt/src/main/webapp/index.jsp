<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

a { text-decoration:none }
     @import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

* {
	font-family: 'Nanum Gothic Coding';
/* 	text-align: center; */
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
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"	type="text/css">
<link rel="stylesheet"	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"	type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet" href="./resources/css/bootstrap4.css">
<link rel="stylesheet" href="./resources/css/codingBooster4.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
<a href= "Admin_list.do">abc</a>

<!--내비게이션 바-->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top" id="nav" style="background-color: black;" >
		<div class="container-fluid">
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
				</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<div style="float: right;">
					<a class="btn btn-lg btn-do">화면 크기 조절</a>
				</div>
				
				<div class="nav-item" style="vertical-align: middle;">
					<div>
						<img src="./resources/img/plus.png" onclick="ZoomIn()">&nbsp; 
						<img src="./resources/img/minus.png" onclick="ZoomOut()">
					</div>
				</div>&nbsp;&nbsp;&nbsp;&nbsp;
				
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
							<c:if test="${empty dto.member_id }">
								<a class="dropdown-item" href="loginStart.do">로그인</a>
								<a class="dropdown-item" href="regiStart.do">회원가입</a>
							</c:if>
							<c:if test="${dto.member_id != null}">
								<a class="dropdown-item"
									href="indi.do?id=${dto.member_id}">개인 페이지</a>
								<a class="dropdown-item" href="logout.do?member_id=${dto.member_id}">로그아웃</a>
							</c:if>
							<a class="dropdown-item" href="logout.do">로그아웃</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>
        
    <div class="py-5 text-white opaque-overlay" style="background-image: url(&quot;https://pingendo.github.io/templates/sections/assets/cover_restaurant.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-gray-dark">제 2의 인생</h1><br/>
          <h3>평균수명 100세 시대, 절반의 행복을 이 사이트 하나로 만날 수 있습니다.</h3>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5 bg-white" >
    <div class="container">
      <div class="row">
          <div class="py-5 col-md-3" >
          <div class="row">
            <div class="col-8 col-md-12">
              <h3 class="mb-3 text-primary">배우는 기쁨</h3>
              <p class="my-1" style="color: black;">&nbsp;평생학습, 배우는 즐거움.<br/> 나를 찾는 기쁨을 한껏 누려보세요.<br/> 검색하기 번거로우신가요? <br/>제 2의 인생이 도와드립니다. </p>
            </div>
          </div><br/>
           <div class="btn-group">
            <a href="edu.do?currentPage=1" class="btn btn-lg mx-1 btn-dark">교육게시판</a>
          </div>
        </div>
        <div class="py-5 col-md-3">
          <div class="row">
            <div class="col-8 col-md-12">
              <h3 class="mb-3 text-primary" >움직이는 희열</h3>
              <p class="my-1" style="color: black;">&nbsp;걷기 좋은 길,등산로 등 지도를 이용해 즐겁게 운동하며 건강까지 지킬 수 있는 방법이 많이 있습니다.<br/> 제 2의 인생에서 간편하게 찾아보세요. </p>
            </div>
            </div><br/>
           <div class="btn-group">
            <a href="Exercise_Walk.do" class="btn btn-lg mx-1 btn-dark">운동게시판</a>
          </div>
        </div>
        <div class="py-5 col-md-3">
          <div class="row">
            <div class="col-8 col-md-12">
              <h3 class="mb-3 text-primary">맛있는 즐거움</h3>
              <p class="my-1" style="color: black;">&nbsp;운동 후 맛집에서 먹는 치킨과 시원한 맥주 한 잔! <br/> 평소에 건강하게 드시면 가끔 그 정도는 괜찮아요.<br/> 제 2의 인생에서 건강 정보도 함께하실 수 있습니다. </p>
            </div>
            </div><br/>
           <div class="btn-group">
            <a href="deli.do" class="btn btn-lg mx-1 btn-dark">음식게시판</a>
          </div>
        </div>
        <div class="py-5 col-md-3">
          <div class="row">
            <div class="col-8 col-md-12">
              <h3 class="mb-3 text-primary">즐기는 기쁨</h3>
              <p class="my-1" style="color: black;">&nbsp;주변의 문화행사(뮤지컬 / 미술 / 전시회 / 영화 / 연극 / 무용 등), 도서관, 공원, 경로당을 찾아보세요. <br/>세상에는 재미있는 것이 참 많아요.
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
<div class="py-5 text-black bg-white" >
    <div class="container">
      <div class="row">
        <div class="col-md-6" style="float: left;">
   <h3 class="mb-3 text-primary">공지사항</h3>
          <div class="list-group" style="opacity: 1.0;" >
            <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
              <div class="d-flex w-100 justify-content-between" >
                <h3 class="mb-1"><b style="color: black;">맨 위의 +를 누르면 화면이 커집니다.</b></h3>
              </div><br/>
              <p class="mb-1" style="color: black;">우측 상단의 +를 누르면 화면이 커집니다.</p>
              <br/>
            </a>
            <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
              <div class="d-flex w-100 justify-content-between">
                <h3 class="mb-1"><b style="color: black;">자유게시판에 새 글이 등록되었습니다.</b></h3>
              </div><br/>
              <p class="mb-1" style="color: black;">새로운 글을 확인해보세요.</p>
            </a>
            <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
              <div class="d-flex w-100 justify-content-between">
                <h3 class="mb-1"><b style="color: black;">서버 점검 안내</b></h3>
              </div><br/>
              <p class="mb-1" style="color: black;">점검시간 : 2018년 6월 9일 오전 7시~ 10일 오전 7시</p>
            </a>
          </div>
        </div>
        
        <div class="col-md-6" style="float: right;">
        <h3 class="mb-3 text-primary">재미있는 영상</h3>
          <div class="embed-responsive embed-responsive-4by3 rounded">
            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/i__1Z5a9Sak?autoplay=0" allowfullscreen=""> </iframe>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div><br/><br/><br/><br/><br/>
  </div><br/><br/><br/><br/><br/>
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
