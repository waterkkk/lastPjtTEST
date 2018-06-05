<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@page import="com.bom.dao.RegistDao" %>
<%@page import="com.bom.dto.RegistDto" %>
<%@page import="com.bom.biz.RegistBiz" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"	type="text/css">
<link rel="stylesheet"	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"	type="text/css">
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function idChkconfirm() {
		var chk = document.getElementByName("member_id")[0].title;
		if (chk == 'n') {
			alert("아이디 중복체크를 해주세요")
			document.getElementsByName("member_id")[0].focus();
		}
	}

	function idChk() {
		var idInsert = document.getElementsByName("member_id")[0].value;
		if (idInsert == null || idInsert == "") {
			alert("중복체크할 아이디를 입력해 주세요.")
			document.getElementsByName("member_id")[0].focus();
		} else if (idInsert != null) {
			var doc = document.getElementsByName("member_id")[0];
			open("idChk.do?member_id=" + doc.value);
		}
	}

</script>
<body>
	<div class="py-5 text-white opaque-overlay"	style="background-image: url('images/good.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-gray-dark">회원가입</h1>
					<p class="lead mb-4">
						제2의인생과 함께하세요! 회원가입을 하시면 게시판 글쓰기와&nbsp; <br>캘린더를 통한 일정관리가
						가능합니다.&nbsp;
					</p>
					<form  action="insertUser.do" method="post">
						<div class="form-group">
						<label>아이디</label>
						<input type="text" name="member_id" title="n" class="form-control" placeholder="아이디를 입력해 주세요." required="required">
<!-- 						<table> -->
<!-- 							<label>아이디</label> -->
<!-- 							<tr> -->
<!-- 							<td><input type="text" name="member_id" title="n" class="form-control" placeholder="아이디를 입력해 주세요." required="required"></td> -->
<!-- 							<td><input type="button"  value="아이디 중복체크" onclick="idChk();"></td> -->
<!-- 							</tr> -->
<!-- 						</table> -->
						</div>
						<div class="form-group">
							<label>비밀번호</label> 
							<input type="password" name="member_pw" class="form-control" 
								placeholder="비밀번호를 입력해 주세요. (숫자,글자 포함 9자리수 이상)"  required="required">
							<label>비밀번호 재입력</label> 
							<input type="password" name="member_pw2" class="form-control" 
								placeholder="비밀번호를 다시 입력해 주세요. (숫자, 글자 포함 9자리수 이상)"   required="required">
							<label>이름</label>
							<input type="text" class="form-control" name="member_name" 
								placeholder="이름을 입력해 주세요. 예)김인생"  required="required">					
							<label>이메일</label>
							<input type="email" class="form-control" name="member_email" 
								placeholder="메일주소를 입력해 주세요. 예)secondlife@naver.com" required="required" >
							<label>전화번호</label>
							<input type="text" class="form-control" name="member_phone"   
								placeholder="전화번호를 입력해 주세요.(기호 없이 입력) 예)03100001234" required="required" >

						</div>
						<input type="submit" value="회원가입" class="btn btn-primary">
					</form>
				</div>
			</div>
		</div>
	</div>
	
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script> -->
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>

</html>