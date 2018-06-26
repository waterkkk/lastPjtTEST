

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 리스트</title>
<link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="webjars/bootstrap/3.3.7/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/footerOther.css?ver=1">
<style type="text/css">

@font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}

* {
   font-family: "Godo";
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

      body{
      background-image: url("resources/img/light.jpg");
   }
   .btn-circle {
        width: 49px;
        height: 49px;
        text-align: center;
        padding: 5px 0;
        font-size: 20px;
        line-height: 2.00;
        border-radius: 30px;
   }
   .text{
      position:absolute;
      font-size:40pt;
      top:30%;
      left:45%;
      color:white;
   }
   .wrap{
      width:70%;
      position: absolute;
      left:400px;
      top:400px;
   }
   .jumbodiv{
      position:absolute;
      top:50px;
      width:100%;
      text-shadow:0.2em 0.2em 0.2em;
      background-image: url("resources/img/planet.jpg");
      color:black;
      font-weight:bold;
      height:300px;
      background-size:cover;
   }
   .navbar-default{
      margin-bottom:0%;
   }
</style>
</head>
<body>
         <div id="header"> 
         <%@ include file="../Form/Header3.jsp"%> 
      </div>

<div class="div">
   <div class="jumbodiv">
      <h1 class="text">일정</h1>
   </div> 
</div>
<div class="wrap">
   <div class="col-md-8">
      <table class="table table-dark">
         <col width="50">
         <col width="50">
         <col width="200">
         <col width="100">
         <col width="100">
         
         <tr class="info">
            <th>번 호</th>
            <th>I D</th>
            <th>일정 제목</th>
            <th>일정 일</th>
            <th>작성 일</th>
         </tr>
         <c:forEach items="${list }" var="list">
            <c:choose>
               <c:when test="${empty list }">
                  <tr class="warning">
                     <td colspan="5" align="center">--------------------- 일정이 없습니다 ---------------------</td>
                  </tr>
               </c:when>
               <c:otherwise>
                  <tr class="warning">
                     <td>${list.inNo }</td>
                     <td>${list.inId }</td>
                     <td><a href="detail.do?No=${list.inNo }">${list.inTitle }</a></td>
                     <td>
                        ${list.inMdate }
                     </td>
                     <td>${list.inRegDate }</td>
                  </tr>                  
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <tr>
            <td colspan="5" align="right">
               <input class="btn btn-primary" type="button" value="돌아가기" onclick="location.href='indi.do?id=${loginSuccess.member_id}'">
            </td>
         </tr>
      </table>
   </div>
</div>
<div id="foot">
   <div id="space">
      <div id="left">
         <p style="color:white; font-size:15pt;">상호명 : 언제나 봄날</p>
         <p style="color:white; font-size:15pt;">주소 : 서울시 영등포구 양평동 3가 15-1 월드메르디앙비즈센터 4층</p>
         <p style="color:white; font-size:15pt;">전화번호 : 02-5340-2233</p>
      </div>
      <div id="copy">
         <p style="color:white; font-size:15pt;">Copyright@2018 언제나 봄날</p>
      </div>
   </div>
</div>
</body>
</html>