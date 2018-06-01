<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등산</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

* {
	font-family: 'Nanum Gothic Coding';
 	text-align: center; 
}

</style>
<script type="text/javascript">

	function test2() {
		$
				.ajax({
					url : "/json/hiking.json",
					type : "get",
					dataType : "json",
					success : function(data) {
						alert("성공");
						/* 	$("body").html(api); */
					},
					error : function() {
						alert("실패");
					}
				});
	}
</script>
</head>
<body>
<h3>등산 게시판</h3><br/><br/><br/>
<div>
<button class="btn btn-primary" onclick="location.href='index.jsp'">메인</button>
<button class="btn btn-primary" onclick="location.href='NoticeBoard_list.do'">공지사항 </button>
<br/><br/><br/>
</div>

	<div class="col-md-12">
		<img alt="등산" src="http://admin.brainworld.com/Library/FileDown.aspx?filename=sshutterstock_111970076.jpg&filepath=BrainHealth">
	<br/><br/></div>
	<div>
		<input class="form-control" id="searchAPI" placeholder="입력하세요." />
		<button onclick="test2();" class="btn btn-primary">검색</button>
	</div>
	<%@ include file="bootstrap.jsp" %>
</body>
</html>