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
 @font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}

input{
text-align: center; 
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
  
     <div class="py-5 text-dark opaque-overlay" style="background-image: url(&quot;https://www.splitshire.com/wp-content/uploads/2016/03/SplitShire-3080060.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-gray-dark">등산로</h1>
          <h4></h4><br/><br/><br/><br/><br/>
        </div>
      </div>
    </div>
  </div><br/><br/><br/>
  
   <c:if test="${empty dto.member_id }">
         <div id="loginAlert" align="center">
            로그인해주시면 게시판을 이용하실 수 있습니다.<br> <br>
         </div>
         <div align="center">
            <input type="button" style="height: 50px; font-size: 20px;" class="btn btn-dark" onclick="location.href='loginStart.do'"
               value="로그인"> <br> <br> <br>
         </div>
      </c:if>
      <c:if test="${dto.member_id != null}">
     
 

<div class="container" style="float: center;">
<div class="container">
<h4 style="color: black; height: 50px; font-size: 20px;">찾을 지역을 입력하세요 </h4>
<form class="form-inline m-0" action="Exercise_Hiking_Page.do" method="post">
<input type="text" class="form-control" name="hiking_keyword" id="hiking_keyword" placeholder="ex) 제주, 서울" style="height: 50px; font-size: 20px; width: 200px;"/>&nbsp;
<input type="submit" class="btn btn-dark" value="검&nbsp;&nbsp;색" style="width:100px; height: 50px; font-size: 20px;"/>&nbsp;
<a class="btn btn-dark" href="Exercise_Search.do" style="width:100px; height: 50px; font-size: 20px;">길찾기</a>
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
   
   </c:if>
   
   <br/><br/><br/><br/><br/><br/><br/><br/>
<footer id="footer">
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
</footer> 
   
</body>
</html>