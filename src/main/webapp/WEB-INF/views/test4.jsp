<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");
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

	blockquote{
		background:#f9f9f9;
		border-left: 10px solid #cccccc;
		margin: 1.5em 10px;
		padding:0.5em 10px;
		quotes: "\201C""\201D""\2018""\2019";
	}

	blockquote:before{
		color: #cccccc;
		content:open-quote;
		font-size: 3em;
		line-height: 0.1em;
		margin-left: 0.25em;
		vertical-align: -0.4em;
	}

	blockquote:after{
		color: #cccccc;
		content: close-quote;
		font-size: 3em;
		line-height: 0.1em;
		margin-left: 0.25em;
		vertical-align: -0.4em;
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
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"	type="text/css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<link rel="stylesheet"	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"	type="text/css">
<link rel="stylesheet" href="css/bootstrap4.css">
<link rel="stylesheet" href="css/codingBooster4.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>


<!--내비게이션 바-->
	<nav class="navbar navbar-default navbar-expand-sm ">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<div class="navbar-header">
					<button type="button" class="btn-lg btn-modify"
						onclick="location.href='#'">제2의인생</button>
				</div>
				
				
				<div class="nav navbar-nav">
					<button type="button" class="btn-lg btn-modify"
							onclick="location.href='#'">공지사항</button>
				<div class="nav-item dropdown">
						<button type="button"
							class="btn-lg btn-modify dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">교육</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">온라인</a> <a class="dropdown-item"
								href="eduoffList.do">오프라인</a>
						</div>
					</div>

				<div class="nav-item dropdown">
					<button type="button"
						class="btn-lg btn-modify dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						운동</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">걷기</a> <a class="dropdown-item"
							href="#">등산</a> <a class="dropdown-item" href="#">문화센터</a>
					</div>
				</div>

				<div class="nav-item dropdown">
					<button type="button"
						class="btn-lg btn-modify dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">음식</button>
					<!--caret: 아랫쪽 화살표-->
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">건강식단</a> <a
							class="dropdown-item" href="#">맛집</a>
					</div>
				</div>
				
				
				<div class="nav-item dropdown">
					<button type="button"
						class="btn-lg btn-modify dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">여가</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">문화행사</a> <a
							class="dropdown-item" href="#">도서관</a> <a class="dropdown-item"
							href="#">공원</a> <a class="dropdown-item" href="#">노인교실/경로당</a>
					</div>
				</div>
				
				
				
				<div class="nav-item">
					<button type="button" class="btn-lg btn-modify "
						onclick="location.href='list.do'">자유게시판</button>
				</div>
				
				
				
				<div>
					<a class="btn btn-lg btn-do">화면 크기 조절</a>
				</div>
				
				<div class="nav-item">
					<div>
						<img src="images/plus.png" onclick="ZoomIn()"> <img
							src="images/minus.png" onclick="ZoomOut()">
					</div>
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
							<c:if test="${empty dto.member_id }">
								<a class="dropdown-item" href="loginStart.do">로그인</a>
								<a class="dropdown-item" href="regiStart.do">회원가입</a>
							</c:if>
							<c:if test="${dto.member_id != null}">
								<a class="dropdown-item"
									href="indi.do?id=${dto.member_id}">개인 페이지</a>
								<a class="dropdown-item"
									href="logout.do?member_id=${dto.member_id}">로그아웃</a>
							</c:if>
							<a class="dropdown-item" href="regiStart.do">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</nav>




<!-- <!--내비게이션 바--> -->
<!-- <nav class="navbar navbar-default"> -->
<!-- 	<div class="container-fluid"> -->

<!-- 		<!--내비게이션 헤더--> -->
<!-- 		<div class="navbar-header"> -->
<!-- 			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" -->
<!-- 				data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> -->
<!-- 				<span class="sr-only"></span> -->
<!-- 				<span class="icon-bar"></span> -->
<!-- 				<span class="icon-bar"></span> -->
<!-- 				<span class="icon-bar"></span> -->
<!-- 		   </button> -->
<!-- 		   <a class="navbar-brand" href="index.html">제2의인생</a> 내비게이션 제목 -->
<!-- 		</div> -->

<!-- 	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> -->
<!-- 		<div class="nav navbar-nav"> -->

<!-- 			<div><a href="#">공지사항</a></div> -->

<!-- 			<!--dropdown 왼쪽--> -->
<!-- 			<div class="dropdown"> -->
<!-- 				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" -->
<!-- 				aria-expanded="false">교육<span class="caret"></span></a> caret: 아랫쪽 화살표 -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<div><a href="lecture.html?lectureName=c">온라인</a></div> -->
<!-- 					<div><a href="lecture.html?lectureName=java">오프라인</a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="dropdown"> -->
<!-- 				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" -->
<!-- 				aria-expanded="false">운동<span class="caret"></span></a> caret: 아랫쪽 화살표 -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<div><a href="#">걷기</a></div> -->
<!-- 					<div><a href="#">등산</a></div> -->
<!-- 					<div><a href="#">문화센터</a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="dropdown"> -->
<!-- 				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" -->
<!-- 				aria-expanded="false">음식<span class="caret"></span></a> caret: 아랫쪽 화살표 -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<div><a href="#">건강식단</a></div> -->
<!-- 					<div><a href="#">맛집</a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="dropdown"> -->
<!-- 				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" -->
<!-- 				aria-expanded="false">여가<span class="caret"></span></a> caret: 아랫쪽 화살표 -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<div><a href="#">문화행사</a></div> -->
<!-- 					<div><a href="#">도서관</a></div> -->
<!-- 					<div><a href="#">공원</a></div> -->
<!-- 					<div><a href="#">노인교실/경로당</a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div><a href="#">자유게시판</a></div> -->

<!--       <div><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;화면 크기 조절</a></div> -->
<!--           <div><button class="btn btn-success btn-circle" onclick="ZoomIn()"> -->
<!--             <span class="glyphicon glyphicon-plus"></span></button></div> -->
<!--           <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
<!--           <div><button class="btn btn-success btn-circle" onclick="ZoomOut()"> -->
<!--               <span class="glyphicon glyphicon-minus"></span></button> -->
<!--          </div> -->

<!-- 		</div> -->



<!-- 		<!--dropdown 오른쪽--> -->
<!-- 		<div class="nav navbar-nav navbar-right"> -->
<!-- 			<div class="dropdown"> -->
<!-- 				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" -->
<!-- 				aria-expanded="false">접속하기<span class="caret"></span></a>  caret: 아래 화살표 -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<div><a href="loginForm.html">로그인</a></div> -->
<!-- 					<div><a href="registerForm.html">회원가입</a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</nav> -->





<!-- 	<br> -->
	
	<!-- footer4 수정  -->
	
		<!--footer4-->
	<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">

				<div class="col-sm-6">
				<br><br><br>
				<p>상호명 : 언제나 봄날 </p>
           		<p>주소 : 서울시 영등포구 양평동 3가 15-1 월드메르디앙비즈센터 4층 </p>
            	<p>전화번호 : 02-5340-2233</p>
            	<p>언제나 봄날 Copyright &copy; 2018</p>
            			
				</div>
				

				<!--내비게이션-->
				
				<div class="col-sm-2" align="center">
					<h4 style="text-align: center;">내비게이션</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">교육</a> 
						<a href="#"class="list-group-item">운동</a> 
						<a href="#"	class="list-group-item">음식</a> 
						<a href="#"	class="list-group-item">여가</a> 
						<a href="#" class="list-group-item">자유게시판</a>
					</div>
				</div>
			</div>
		</div>
	</footer>



<!--내비게이션 바-->
	<nav class="navbar navbar-default navbar-expand-sm ">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<div class="navbar-header">
					<button type="button" class="nav-link btn-lg btn-primary btn-dark"
						onclick="location.href='#'">제2의인생</button>
				</div>
				
				
				<div class="nav navbar-nav">
					<button type="button" class="nav-link btn-lg btn-primary btn-dark "
							onclick="location.href='#'">공지사항</button>
				
					<button type="button"
						class="btn btn-primary btn-lg btn-dark dropdown-toggle"
						data-toggle="dropdown" >교육</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">온라인</a> <a class="dropdown-item"
							href="eduoffList.do">오프라인</a>
					</div>

				<div class="nav-item dropdown">
					<button type="button"
						class="btn btn-primary btn-lg btn-dark dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						운동</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">걷기</a> <a class="dropdown-item"
							href="#">등산</a> <a class="dropdown-item" href="#">문화센터</a>
					</div>
				</div>

				<div class="nav-item dropdown">
					<button type="button"
						class="btn btn-primary btn-lg btn-dark dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">음식</button>
					<!--caret: 아랫쪽 화살표-->
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">건강식단</a> <a
							class="dropdown-item" href="#">맛집</a>
					</div>
				</div>
				
				
				<div class="nav-item dropdown">
					<button type="button"
						class="btn btn-primary btn-lg btn-dark dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">여가</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">문화행사</a> <a
							class="dropdown-item" href="#">도서관</a> <a class="dropdown-item"
							href="#">공원</a> <a class="dropdown-item" href="#">노인교실/경로당</a>
					</div>
				</div>
				
				
				
				<div class="nav-item">
					<button type="button" class="nav-link btn-lg btn-primary btn-dark "
						onclick="location.href='list.do'">자유게시판</button>
				</div>
				
				
				
				<div>
					<a class="btn btn-lg mx-1 btn-dark">화면 크기 조절</a>
				</div>
				
				<div class="nav-item">
					<div>
						<img src="images/plus.png" onclick="ZoomIn()"> <img
							src="images/minus.png" onclick="ZoomOut()">
					</div>
				</div>
				
			</div>


			<!--dropdown 오른쪽-->


			<div class="nav navbar-nav navbar-right">
				<div class="nav-item dropdown">
					<button type="button"
						class="btn btn-lg btn-primary dropdown-toggle btn-dark"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">접속하기</button>
					<div class="dropdown-menu">
						<div class="col-md-12">
							<c:if test="${empty dto.member_id }">
								<a class="dropdown-item" href="loginStart.do">로그인</a>
							</c:if>
							<c:if test="${dto.member_id != null}">
								<a class="dropdown-item"
									href="logout.do?member_id=${dto.member_id}">로그아웃</a>
							</c:if>
							<a class="dropdown-item" href="regiStart.do">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>




<!-- <!--내비게이션 바--> -->
<!-- <nav class="navbar navbar-default"> -->
<!-- 	<div class="container-fluid"> -->

<!-- 		<!--내비게이션 헤더--> -->
<!-- 		<div class="navbar-header"> -->
<!-- 			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" -->
<!-- 				data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> -->
<!-- 				<span class="sr-only"></span> -->
<!-- 				<span class="icon-bar"></span> -->
<!-- 				<span class="icon-bar"></span> -->
<!-- 				<span class="icon-bar"></span> -->
<!-- 		   </button> -->
<!-- 		   <a class="navbar-brand" href="index.html">제2의인생</a> 내비게이션 제목 -->
<!-- 		</div> -->

<!-- 	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"> -->
<!-- 		<div class="nav navbar-nav"> -->

<!-- 			<div><a href="#">공지사항</a></div> -->

<!-- 			<!--dropdown 왼쪽--> -->
<!-- 			<div class="dropdown"> -->
<!-- 				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" -->
<!-- 				aria-expanded="false">교육<span class="caret"></span></a> caret: 아랫쪽 화살표 -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<div><a href="lecture.html?lectureName=c">온라인</a></div> -->
<!-- 					<div><a href="lecture.html?lectureName=java">오프라인</a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="dropdown"> -->
<!-- 				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" -->
<!-- 				aria-expanded="false">운동<span class="caret"></span></a> caret: 아랫쪽 화살표 -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<div><a href="#">걷기</a></div> -->
<!-- 					<div><a href="#">등산</a></div> -->
<!-- 					<div><a href="#">문화센터</a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="dropdown"> -->
<!-- 				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" -->
<!-- 				aria-expanded="false">음식<span class="caret"></span></a> caret: 아랫쪽 화살표 -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<div><a href="#">건강식단</a></div> -->
<!-- 					<div><a href="#">맛집</a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div class="dropdown"> -->
<!-- 				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" -->
<!-- 				aria-expanded="false">여가<span class="caret"></span></a> caret: 아랫쪽 화살표 -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<div><a href="#">문화행사</a></div> -->
<!-- 					<div><a href="#">도서관</a></div> -->
<!-- 					<div><a href="#">공원</a></div> -->
<!-- 					<div><a href="#">노인교실/경로당</a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 			<div><a href="#">자유게시판</a></div> -->

<!--       <div><a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;화면 크기 조절</a></div> -->
<!--           <div><button class="btn btn-success btn-circle" onclick="ZoomIn()"> -->
<!--             <span class="glyphicon glyphicon-plus"></span></button></div> -->
<!--           <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div> -->
<!--           <div><button class="btn btn-success btn-circle" onclick="ZoomOut()"> -->
<!--               <span class="glyphicon glyphicon-minus"></span></button> -->
<!--          </div> -->

<!-- 		</div> -->



<!-- 		<!--dropdown 오른쪽--> -->
<!-- 		<div class="nav navbar-nav navbar-right"> -->
<!-- 			<div class="dropdown"> -->
<!-- 				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" -->
<!-- 				aria-expanded="false">접속하기<span class="caret"></span></a>  caret: 아래 화살표 -->
<!-- 				<div class="dropdown-menu"> -->
<!-- 					<div><a href="loginForm.html">로그인</a></div> -->
<!-- 					<div><a href="registerForm.html">회원가입</a></div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</nav> -->





<!-- 	<br> -->
	
	<!-- footer4 수정  -->
	
		<!--footer4-->
	<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">

				<div class="col-sm-6">
				<br><br><br>
				<p>상호명 : 언제나 봄날 </p>
           		<p>주소 : 서울시 영등포구 양평동 3가 15-1 월드메르디앙비즈센터 4층 </p>
            	<p>전화번호 : 02-5340-2233</p>
            	<p>언제나 봄날 Copyright &copy; 2018</p>
            			
				</div>
				

				<!--내비게이션-->
				
				<div class="col-sm-2" align="center">
					<h4 style="text-align: center;">내비게이션</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">교육</a> 
						<a href="#"class="list-group-item">운동</a> 
						<a href="#"	class="list-group-item">음식</a> 
						<a href="#"	class="list-group-item">여가</a> 
						<a href="#" class="list-group-item">자유게시판</a>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>