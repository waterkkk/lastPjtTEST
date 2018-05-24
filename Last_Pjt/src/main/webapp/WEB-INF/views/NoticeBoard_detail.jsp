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
<title>관리자-회원상세</title>
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

	<jsp:useBean id="NoticeBoard_dto" class="com.bom.dto.NoticeBoardDto" scope="request"></jsp:useBean>
	<div class="container">
	<form action="NoticeBoard_delete.do" method="post" id="del"> 
	<input type="hidden" name="noticeboard_no" value="${NoticeBoard_dto.noticeboard_no }">
		<h3>회원 정보</h3>
		<br/>
		<div class="form-group">
				<label>글번호</label>
				<p><jsp:getProperty property="noticeboard_no" name="NoticeBoard_dto" /></p>
			</div>
			<div class="form-group">
				<label>제목</label>
				<p><jsp:getProperty property="noticeboard_title" name="NoticeBoard_dto" /></p>
			</div>
			<div class="form-group">
				<label>작성자</label>
				<p><jsp:getProperty property="noticeboard_writer" name="NoticeBoard_dto" /></p>
			</div>
			<div class="form-group">
				<label>내용</label>
				<p><jsp:getProperty property="noticeboard_content" name="NoticeBoard_dto" /></p>
			</div>
			<div class="form-group">
				<label>날짜</label>
				<p><jsp:getProperty property="noticeboard_regdate" name="NoticeBoard_dto" /></p>
			</div>
			<br/>
				<button type="submit" class="btn btn-primary">삭제</button>
				<button type="button" class="btn btn-primary" onclick="update()">수정</button>
				<button type="button" class="btn btn-primary" onclick="location.href='NoticeBoard_list.do'">목록</button>
	</form>
	</div>

	<div class="container">
	<form action="NoticeBoard_update.do" method="post" id="up">
		<h3>회원 정보 수정</h3>
		 <input type="hidden" name="noticeboard_no" value="${NoticeBoard_dto.noticeboard_no }">
			<div class="form-group">
				<label>글번호</label>
				<p>${NoticeBoard_dto.noticeboard_no }</p>
			</div>
			<div class="form-group">
				<label>제목</label>
				<p><input type="text" name="noticeboard_title" class="form-control"></p>
			</div>
			<div class="form-group">
				<label>작성자</label>
				<p>${NoticeBoard_dto.noticeboard_writer }</p>
			</div>
			<div class="form-group">
				<label>내용</label>
				<p><textarea class="form-control" id="noticeboard_content" name="noticeboard_content" rows="3">${NoticeBoard_dto.noticeboard_content }</textarea></p>
			</div>
			<div class="form-group">
				<label>날짜</label>
				<p>${NoticeBoard_dto.noticeboard_regdate }</p>
			</div>
				<button type="submit" class="btn btn-primary">저장</button>
	</form>
	</div>
<%@ include file="bootstrap.jsp" %>
</body>
</html>