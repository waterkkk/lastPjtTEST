<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내정보</title>
<style type="text/css">
@import url("css/button.css");
@font-face{
	font-family:"Seoul";
	src:url("fonts/남산체.ttf");
}
*{
	font-family:"Seoul";
}

body,html {
    margin:0;
    padding:0;
    height:100%;
}
#header{position:relative; top:-5px;}
.wrap{min-height:100%; position:relative; width:100%;}
.content{padding-bottom:25px;}
#footer{
	margin-top:-25px;
	clear:both;
	position:relative;
	height:25px;
}


#updateForm {
	display: none;
}

#updateForm {
	margin-top: 7%;
	background: #E1E1E1;
	width: 40%;
	height: 70%;
	margin-left: 30%;
}

#myInfoForm {
	margin-top: 7%;
	background: #E1E1E1;
	width: 25%;
	height: 60%;
	margin-left: 40%;
}


</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/alertify.core.css" />
<link rel="stylesheet" href="css/alertify.default.css" id="toggleCSS" />
<script src="js/alertify.min.js"></script>
<script type="text/javascript">
	function infoFrom() {
		$("#myInfoForm").hide();
		$("#updateForm").show();
	}

	function infoupdateRes() {
		var pas1 = $("#pas1").val();
		var pas2 = $("#pas2").val();
		var myno = $("#myno").val();
		var pas2 = $("#pas2").val();
		var email = $("#email").val();
		var id = $("#id").val();
		if(pas1=="" && pas2 == ""){
			alertify.alert("수정할 비밀번호를 입력해 주세요.")
		}else if (pas1 == "" || pas2 == "") {
			alertify.alert("1차 비밀번호와 2차 비밀번호 모두 입력해주세요.");
		} else if (pas1!=pas2) {
			alertify.alert("1차 비밀번호와 2차 비밀번호가 다릅니다.\n1차와 2차를 똑같이 해주세요.");
		}

		if (pas1 == pas2 && pas1!="" && pas2!="") {
			location.href = "login.do?command=updateRes&myno=" + myno
					+ "&pas2=" + pas2 + "&email=" + email + "&id=" + id;
		}
	}
	function noUpdate() {
		$("#myInfoForm").show();
		$("#updateForm").hide();
	}
	function enabled() {
		var myno = $("#no").val();
		location.href = "login.do?command=enable&myno=" + myno;
	}
</script>
</head>
<body>

<div id="header">
<%@ include file="form/header.jsp"%>
</div>

<div class="wrap">

<div class="content">
	<div id="myInfoForm" align="center">
		<form action="">
			<input id="no" type="hidden" value="${login.myno }">
			<table style="width: 300px; height: 300px; word-wrap:break-word; word-break:break-all;">
				<tr>
					<th>아이디</th>
					<td>${login.id }</td>
				</tr>
				<tr>
					<th>비번</th>
					<td>${login.pw }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${login.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${login.email }</td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<input class="bttn-bordered bttn-xs bttn-danger" type="button"
						value="정보수정" onclick="infoFrom()">
						<input class="bttn-bordered bttn-xs bttn-danger" type="button"
						value="탈퇴하기" onclick="enabled()"></td>
				</tr>
			</table>
		</form>
	</div>

	<div id="updateForm" align="center">
		<form action="login.do">
			<input type="hidden" id="id" value="${login.id }">
			<input type="hidden" id="myno" value="${login.myno }">
			<table style="width: 250px; height: 350px;">
				<col width="200">
				<tr>
					<th>아이디</th>
					<td>${login.id }</td>
				</tr>
				<tr>
					<th>수정할 비밀번호</th>
					<td>
						<input type="password" required="required" id="pas1">
					</td>
				</tr>
				<tr>
					<th>수정할 비밀번호 확인</th>
					<td colspan="2">
						<input type="password" required="required" id="pas2">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${login.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="email" value="${login.email }"></td>
				</tr>
				<tr>
					<td align="right" colspan="2">
						<input class="bttn-bordered bttn-xs bttn-danger" type="button"
						value="수정완료" onclick="infoupdateRes()">
						<input class="bttn-bordered bttn-xs bttn-danger" type="button" value="취소"
						onclick="noUpdate()">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	</div>
	</div>
	
	<div id="footer">
	<%@ include file="form/footer.jsp"%>
	</div>
	
</body>
</html>