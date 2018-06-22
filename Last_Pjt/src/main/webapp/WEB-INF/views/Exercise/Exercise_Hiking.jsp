<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등산로</title>
<style type="text/css">
* {
	font-family: 'Nanum Gothic Coding';
}

input{
text-align: center; 
}

p{
 text-align: center;"
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="https://v40.pingendo.com/assets/4.0.0/default/theme.css" type="text/css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
function testtest(){
	
$.ajax({
	url : abc,
	success: function (abc) {
         alert(abc);
    },
    error: function (request,status,error) {
         alert("다시 시도"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
});
}

</script>
</head>
<body>
  <div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
	</div>
  
     <div class="py-5 text-white opaque-overlay" style="background-image: url(&quot;https://www.splitshire.com/wp-content/uploads/2016/03/SplitShire-3080060.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="text-gray-dark">등산로</h3>
          <h4></h4><br/><br/><br/><br/><br/>
        </div>
      </div>
    </div>
  </div><br/><br/><br/>
 

<div class="container" style="float: center;">
<h4 style="color: black;">찾을 지역을 입력하세요 </h4><br/>
<div class="container">
<form class="form-inline m-0" action="Exercise_Hiking_Page.do" method="post">
<input type="text" class="form-control" name="hiking_keyword" id="hiking_keyword" placeholder="ex) 제주, 서울"/>&nbsp;
<input type="submit" class="btn btn-dark" value="검색" />&nbsp;
<a class="btn btn-dark" href="Exercise_Search.do">길찾기/지도</a>
</form>
</div>
</div>


<div class="container">
	<table>
		<c:choose>
			<c:when test="${empty abc }">
			</c:when>
			<c:otherwise>
				<c:forEach items="${requestScope.abc }" var="abc">
				<c:out value="${abc }" escapeXml="false"/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		</div><br/><br/><br/>
		
  <div id="footer"> 
	<%@ include file="../Form/Footer4.jsp"%> 
</div> 
</body>
</html>