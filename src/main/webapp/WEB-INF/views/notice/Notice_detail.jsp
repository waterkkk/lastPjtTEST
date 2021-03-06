

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 게시판</title>
<link rel="stylesheet" href="resources/css/bootstrap3.css">
<link rel="stylesheet" href="resources/css/footer.css?ver=1">
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
      margin:0%;
      padding:0%;
      width:100%;
      height:100%;
      background-image: url("resources/img/indexBody.jpg");
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
   th{
      font-size:15pt;
   }
   td{
      height:5px;
      font-size:12pt;
   }
   .jumbodiv{
      position:absolute;
      background-image: url("resources/img/board.jpg");
      width:100%;
      top:50px;
      height:330px;
      background-size: 1230px 320px;
   }
   .back{
      background-image:url("resources/img/boardback.jpg");
      background-size:1400px 850px;
      position:absolute;
      top:380px;
      width:100%;
      height:710px;
      background-color:#EFEFEF;
      z-index:1;
   }
   .table-dark{
      position: absolute;
      width:80%;
      top:10%;
   }
   .post{
      position:absolute;
      display:inline-block;
      color:brown;
      font-size:40pt;
      top:25%;
      left:40%;
   }
   hr{
      color:brown;
      background-color:brown;
      opacity:0.5;
      height:1px;
      position:absolute;
      width:30%;
      left:32%;
      top:45%;
   }
   .exp{
      position:absolute;
      display:inline-block;
      color:brown;
      left:35%;
      top:55%;
      opacity: 0.5;
   }
   .navbar-default{
      margin-bottom:0%;
   }
   #ta{
      position:absolute;
      top:5%;
      left:10%;
      width:80%;
   }
   #content{
      height:200px;
   }
</style>
</head>
<script type="text/javascript">
   function update(){
      var no = ${list.noticeNo};
      location.href="upda.do?no="+no;
   }
   function back(){
      location.href="notice.do?currentPage=1";
   }
   
   function deletePost(no) {
      location.href="delete.do?no="+no;
   }
</script>
<body>
<div id="header"> 
   <%@ include file="../Form/Header3.jsp"%> 
</div>
<div class="div">
   <div class="jumbodiv">
      <h1 class="post">공지사항</h1>
      <span class="exp">여러 이벤트 정보 업데이트를 볼 수 있는 공간입니다.</span>
      <hr>
   </div>
</div>
<div class="back">
   <div id="ta">
   <table class="table table-dark">
      <col width="100">   
      <col width="500">
      <tr>
         <th class="warning" style="text-algin:center">번호</th>
         <td class="success">${list.noticeNo }</td>
      </tr>
      <tr>
         <th class="warning" style="text-algin:center">작성자</th>
         <td class="success">${list.noticeWriter}</td>
      </tr>
      <tr>
         <th class="warning" style="text-algin:center">작성일</th>
         <td class="success">${list.noticeRegDate }</td>
      </tr>
      <tr>
         <th class="warning" style="text-algin:center"> 제목</th>
         <td class="success">${list.noticeTitle }</td>
      </tr>
      <tr>
         <td colspan="2" class="success" id="content">${list.noticeContent }</td>
      </tr>
      <tr>
      <c:choose> 
         <c:when test="${dto.member_role eq 'USER' }">
            <td colspan="5" align="right">
               <input class="btn btn-primary btn-lg" type="button" value="목록" onclick="back();">
            </td>
         </c:when>
         <c:when test="${dto.member_role eq 'ADMIN' }">
            <td colspan="5" align="right">
               <input class="btn btn-primary btn-lg" type="button" value="수정" onclick="update();">
               <input class="btn btn-primary btn-lg" type="button" value="삭제" onclick="deletePost(${list.noticeNo});">
               <input class="btn btn-primary btn-lg" type="button" value="목록" onclick="back();">
            </td>
         </c:when>
      </c:choose>
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