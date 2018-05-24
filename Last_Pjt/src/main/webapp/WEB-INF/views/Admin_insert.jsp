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
<title>insert.jsp</title>
</head>
<body>
<h3>관리자-회원추가(테스트)</h3>

	<div class="container">
   <form action="insert.do" method="post">
    	<div class="form-group">
		<label for="noticeboard_title">제목</label>
        <input type="text" class="form-control" id="noticeboard_title" name="noticeboard_title" placeholder="제목을 입력하세요.">
      </div>
      <div class="form-group">
        <label for="noticeboard_writer">작성자</label>
        <%-- <input type="hidden" name="member_name" value="${admin_dto.member_name }"> --%>
        <input type="text" class="form-control" id="noticeboard_writer" name="noticeboard_writer" placeholder="이름을 입력하세요.">
      </div>
      <div class="form-group">
        <label for="noticeboard_content">내용</label>
        <textarea class="form-control" id="noticeboard_content" name="noticeboard_content" rows="3" placeholder="내용을 입력하세요."></textarea>
      </div>
      <button type="submit" class="btn btn-primary">작성</button>
    </form>
    
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
				<label>등급</label>
				<p><jsp:getProperty property="member_role" name="admin_dto" /></p>
			</div>
</div>

<%@ include file="bootstrap.jsp" %>
</body>
</html>