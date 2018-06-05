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
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>

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

	<div class="py-5 text-white opaque-overlay"
		style="background-image: url('images/good.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div align="center">
						<h1 class="text-gray-dark"> 로그인 완료! </h1>
						<p class="lead mb-4" align="center">
					 회원님 환영합니다~! <br>제2의 인생과 함께 행복한 하루 보내세요
					</p>
					</div>


					<div align="center">
						<input type="button" class="btn btn-primary" value="메인화면" 
						 	onclick="location.href='index.jsp'">
						<input type="button" class="btn btn-primary" value="관리자페이지" 
						 	onclick="location.href='Admin_list.do'">
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

</body>
</html>


</body>
</html>