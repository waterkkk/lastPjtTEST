<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

a { text-decoration:none }

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail</title>
<style type="text/css">
#up {
	display: none;
}
</style>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function update() {
		$("#del").hide();
		$("#up").show();
	}
</script>
</head>
<body>

	<jsp:useBean id="admin_dto" class="com.bom.dto.AdminDto" scope="request"></jsp:useBean>
	<div class="container">
	<form action="Admin_delete.do?page" method="post" id="del" > 
	<input type="hidden" name="member_id" value="${admin_dto.member_id }">
		<h3>회원 정보</h3>
		<br/>
			<div class="form-group">
				<label>ID</label>
				<p><jsp:getProperty property="member_id" name="admin_dto" /></p>
			</div>
			<div class="form-group">
				<label>PASSWORD</label>
				<p><jsp:getProperty property="member_pw" name="admin_dto" /></p>
			</div>
			<div class="form-group">
				<label>이름</label>
				<p><jsp:getProperty property="member_name" name="admin_dto" /></p>
			</div>
			<div class="form-group">
				<label>email</label>
				<p><jsp:getProperty property="member_email" name="admin_dto" /></p>
			</div>
			<div class="form-group">
				<label>phone</label>
				<p><jsp:getProperty property="member_phone" name="admin_dto" /></p>
			</div>
			<div class="form-group">
				<label>가입여부</label>
				<p><jsp:getProperty property="member_enabled" name="admin_dto" /></p>
			</div>
			<div class="form-group">
				<label>가입날짜</label>
				<p><jsp:getProperty property="member_date" name="admin_dto" /></p>
			</div>
			<div class="form-group">
				<label>등급</label>
				<p><jsp:getProperty property="member_role" name="admin_dto" /></p>
			</div>
			<br/>
				<button type="submit" class="btn btn-primary">삭제</button>
				<button type="button" class="btn btn-primary" onclick="update()">수정</button>
				<button type="button" class="btn btn-primary" onclick="location.href='Admin_list.do'">목록</button>
	</form>
	</div>

	<div class="container">
	<form action="Admin_update.do" method="post" id="up">
		<h3>회원 정보 수정</h3>
		 <input type="hidden" name="member_id" value="${admin_dto.member_id }">
			<div class="form-group">
				<label>ID</label>
				<p>${admin_dto.member_id }</p>
			</div>
			<div class="form-group">
				<label>PASSWORD</label>
				<p><input type="text" name="member_pw" value="${admin_dto.member_pw }"></p>
			</div>
			<div class="form-group">
				<label>이름</label>
				<p><input type="text" name="member_name"></p>
			</div>
			<div class="form-group">
				<label>email</label>
				<p><input type="text" name="member_email"></p>
			</div>
			<div class="form-group">
				<label>phone</label>
				<p><input type="text" name="member_phone"></p>
			</div>
			<div class="form-group">
				<label>가입여부</label>
				<p><input type="text" name="member_enabled"></p>
			</div>
			<div class="form-group">
				<label>가입날짜</label>
				<p>${admin_dto.member_date }</p>
			</div>
			<div class="form-group">
				<label>등급</label>
				<p><input type="text" name="member_role"></p>
			</div>
				<button type="submit" class="btn btn-primary">저장</button>
	</form>
	</div>
<%@ include file="../bootstrap.jsp" %>
</body>
</html>