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
<script type="text/javascript">
	$(function() {
		$("#commLogin").hide();
	});

	function login() {
		$("#commLogin").show();

		var idVal = $("#member_id").val();
		var pwVal = $("#member_pw").val();

		if (idVal == null || idVal == "") {
			document.getElementById("commLogin").innerHTML = "아이디를 입력해 주세요.";
		
		}else if(idVal.length<6||idVal.length>12){
			document.getElementById("commLogin").innerHTML = "아이디를 6~12자까지 입력해 주세요.";
			 	document.getElementbyId("member_id").focus();
			 	document.getElementbyId("member_id").select();	
			 	
		} else if (pwVal == null || pwVal == "") {
			alert("비밀번호를 입력해 주세요.");
			
		}else if(pwVal.length<9){
			document.getElementById("commLogin").innerHTML = "비밀번호를 9자 이상 입력해 주세요.";
			 	document.getElementbyId("member_pw").focus();
			 	document.getElementbyId("member_pw").select();		 	
			
		} else {
			$.ajax({
						method: "post",
						url : "loginAjax.do",
						data : "member_id=" + idVal + "&member_pw=" + pwVal,
						success : function(msg) {							
							if (msg.lc) {
								location.href = "loginRes.do?member_id="
										+ idVal + "&member_pw=" + pwVal;
							} else {
								document.getElementById("commLogin").innerHTML = "비밀번호가 맞지 않습니다. 다시 입력해 주세요";
							}
						},
						error : function(statusCode) {
							alert("error:" + statusCode.status);
				}
			});
		}
	}
	

</script>
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



</style>


</head>
<body>

<div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
</div>
	<div class="py-5 text-white opaque-overlay"
		style="background-image: url('resources/img/food.jpg'); background-size: 100% 100%">
		<div class="container" >
			<div class="row">
				<div class="col-md-7">
					<div align="center">
					<br><br><br>
						<h1 class="text-gray-dark">로그인</h1>
						<p class="lead mb-4">로그인하시면 더 많은 정보를 이용하실 수 있습니다.</p>
					</div>


					<input type="hidden" name="member_enabled"	value="${dto.member_enabled }">
<br>		
					<div class="form-group">
						<label>아이디</label> <input type="text" id="member_id" class="form-control" 
						placeholder="아이디를 입력해 주세요." name="member_id">
					</div>
<br>
					<div class="form-group">
						<label>비밀번호</label> 
						<input type="password" id="member_pw" name="member_pw" class="form-control"
							placeholder="비밀번호를 다시 입력해 주세요. (숫자, 글자 포함 9자리수 이상)"> <br>
					</div>

					<div align="center">
						<table>
							<tr>
								<td><input type="button" class="btn btn-primary"
									value="로그인" onclick="login();"></td>
							</tr>		
						</table>
					</div>

					<div align="center">
						<br> <label>아이디나 비밀번호가 생각나지 않으시나요?</label> <br> 
						<a href="searchId.do" style="color:white">아이디 찾기</a>
						<a href="searchPw.do" style="color:white">비밀번호 찾기</a>
					</div>
					<br><br>
					<div align="center" id="commLogin"></div>
<br><br><br><br><br><br><br><br>

				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

 <!-- footer2 -->
<div id="footer">
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
</div>

</body>
</html>