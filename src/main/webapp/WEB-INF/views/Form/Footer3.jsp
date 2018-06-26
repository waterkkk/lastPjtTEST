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
<link rel="stylesheet" href="resources/css/codingBooster3.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>


<!-- footer2 -->
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



<!-- 	<!--footer4--> -->
<!-- 	<footer style="background-color: #000000; color: #ffffff"> -->
<!-- 		<div class="container"> -->
<!-- 			<br> -->
<!-- 			<div class="row"> -->

<!-- 				<div class="col-sm-6"> -->
<!-- 				<br><br><br> -->
<!-- 				<p>상호명 : 언제나 봄날 </p> -->
<!--            		<p>주소 : 서울시 영등포구 양평동 3가 15-1 월드메르디앙비즈센터 4층 </p> -->
<!--             	<p>전화번호 : 02-5340-2233</p> -->
<!--             	<p>언제나 봄날 Copyright &copy; 2018</p> -->
            			
<!-- 				</div> -->
				

<!-- 				내비게이션 -->
				
<!-- 				<div class="col-sm-2" align="center"> -->
<!-- 					<h4 style="text-align: center;">내비게이션</h4> -->
<!-- 					<div class="list-group"> -->
<!-- 						<a href="#" class="list-group-item">교육</a>  -->
<!-- 						<a href="#"class="list-group-item">운동</a>  -->
<!-- 						<a href="#"	class="list-group-item">음식</a>  -->
<!-- 						<a href="#"	class="list-group-item">여가</a>  -->
<!-- 						<a href="#" class="list-group-item">자유게시판</a> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</footer> -->

</body>
</html>