<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
.wrap{min-height:100%; position:relative; width:100%;}

.content{padding-bottom:25px;}

#footer{
	margin-top:-25px;
	clear:both;
	position:relative;
	height:25px;
}
</style>
</head>
<body>

<div class="wrap">
<%@ include file="form/header.jsp" %>
<div class="content">
	유저 로그인 성공
	
</div>
</div>

<div id="footer">
<%@ include file="form/footer.jsp"%>
</div>

</body>
</html>