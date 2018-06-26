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

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"
	type="text/css">
</head>

<body>

<div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
</div>


	<div class="py-5 text-white opaque-overlay"
		style="background-image: url('resources/img/food.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div align="center">
						<h1 class="text-gray-dark"> 환영합니다! </h1>
						<p class="lead mb-4">
						 "제2의 인생"의 가족이 되셨습니다.
					</p>
					</div>


					
					<div align="center">
						<br> <label>로그인하시면 더 많은 정보를 이용하실 수 있습니다.</label> <br> <label
							onclick="location.href='index.jsp'">메인화면</label> <label
							onclick="location.href='userMain.do'">로그인</label>	<br><br>
					</div>


				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

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


</body>
</html>