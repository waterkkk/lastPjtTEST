

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
      height:33%;
      background-size: 1230px 300px;
   }
   .back{
      background-image:url("resources/img/boardback.jpg");
      background-size:1280px 700px;
      position:absolute;
      top:38%;
      width:100%;
      height:700px;
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
   .exp{
      position:absolute;
      display:inline-block;
      color:brown;
      left:35%;
      top:150px;
      opacity: 0.5;
   }
   .container{
      position: absolute;
      top:400px; 
   }
   #ta{
      position:absolute;
      width:80%;
      top:10%;
      left:10%;
      
   }
   
   #text,
   #text:hover,
   #text:focus{
      color:black;
   }
      .con{
         position: absolute;
         top:400px;
         left:400px;
   }
   .btn-dark{
         background-color:black;
         color:white;
   }
   .btn-dark:hover,
   .btn-dar:focus{
         color:#151515;
   }
</style>
</head>
<script type="text/javascript">
   function insert(){
      location.href="insertForm.do";
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
      </div>
   </div>
  <c:if test="${empty dto.member_id }">
         <div class="con">
            <div id="loginAlert" align="center">
               로그인해주시면 게시판을 이용하실 수 있습니다.<br> <br>
            </div>
            <div align="center">
               <input type="button" style="height: 50px; font-size: 20px;" class="btn btn-dark" onclick="location.href='loginStart.do'"
                  value="로그인"> <br> <br> <br>
            </div>         
         </div>
      </c:if>
   <c:if test="${dto.member_role eq 'ADMIN' }">
      <div class="back">
      <div id="ta">
      <table class="table table-dark">
         <col width="50">
         <col width="80">
         <col width="200">
         <col width="80">
         <col width="50">
         
         <tr>
            <th class="warning" style="text-algin:center">번호</th>
            <th class="warning" style="text-algin:center">작성자</th>
            <th class="warning" style="text-algin:center"> 제목</th>
            <th class="warning" style="text-algin:center">작성일</th>
            <th class="warning" style="text-algin:center">조회수</th>
         </tr>
         <c:choose>
            <c:when test="${empty list }">
               <tr><td class="success" colspan="5" style="text-align:center;">공지가 없습니다.</td></tr>
               
            </c:when>
            <c:otherwise>
               <c:forEach items="${list }" var="dto">
                  <tr>
                     <td class="success">${dto.noticeNo }</td>
                     <td class="success">${dto.noticeWriter }</td>
                     <td class="success"><a href="noticeOne.do?no=${dto.noticeNo }" style="text-decoration:none;">
                     <c:set var="regDate" value="${dto.noticeRegDate }"></c:set>
                     <%
                        java.util.Date date = (java.util.Date)(pageContext.getAttribute("regDate"));
                        long now = System.currentTimeMillis();
                        long inputDate = date.getTime();
                        if((now - inputDate) <= (1000 * 60 * 60 * 24 * 1)) { %>
                           <img alt="new" src="resources/gif/neww.gif">
                        <%}else { 
                           }%> 
                     ${dto.noticeTitle }</a></td>
                     <td class="success">${dto.noticeRegDate }</td>
                     <td class="success">${dto.noticeCount }</td>
                  </tr>
               </c:forEach>
            </c:otherwise>
         </c:choose>
         <tr class="success">
            <td colspan="5" align="center">
               <c:choose>
                  <c:when test="${before < current }">
                     <a href="notice.do?currentPage=${current - 1}">◀&nbsp;</a>
                  </c:when>
                  <c:otherwise>
                  </c:otherwise>
               </c:choose>
                     <c:forEach begin="${startPage }" end="${endPage }" var="i">
                        <c:choose>
                           <c:when test="${i eq current }">
                              <strong>${i }&nbsp;</strong>
                           </c:when>
                           <c:otherwise>
                              <a href="notice.do?currentPage=${i }">${i }&nbsp;</a>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
               <c:choose>
                  <c:when test="${lastPage eq current }">
                     
                  </c:when>
                  <c:otherwise>
                     <a href="notice.do?currentPage=${current+1 }">&nbsp;▶</a>
                  </c:otherwise>
               </c:choose>
            </td>
         </tr>
         <tr>
            <td colspan="5" align="right">
               <button class="btn btn-primary" value="공지작성" onclick="location.href='insertForm.do'">공지작성</button>
            </td>
         </tr>
      </table>
      </div>
      </div>
   </c:if>
   <c:if test="${dto.member_role eq 'USER' }">
      <div class="back">
      <div id="ta">
      <table class="table table-dark">
         <col width="50">
         <col width="80">
         <col width="200">
         <col width="80">
         <col width="50">
         
         <tr>
            <th class="warning" style="text-algin:center">번호</th>
            <th class="warning" style="text-algin:center">작성자</th>
            <th class="warning" style="text-algin:center"> 제목</th>
            <th class="warning" style="text-algin:center">작성일</th>
            <th class="warning" style="text-algin:center">조회수</th>
         </tr>
         <c:choose>
            <c:when test="${empty list }">
               <tr><td class="success" colspan="5" style="text-align:center;">공지가 없습니다.</td></tr>
               
            </c:when>
            <c:otherwise>
               <c:forEach items="${list }" var="dto">
                  <tr>
                     <td class="success">${dto.noticeNo }</td>
                     <td class="success">${dto.noticeWriter }</td>
                     <td class="success"><a href="noticeOne.do?no=${dto.noticeNo }" style="text-decoration:none;">
                     <c:set var="regDate" value="${dto.noticeRegDate }"></c:set>
                     <%
                        java.util.Date date = (java.util.Date)(pageContext.getAttribute("regDate"));
                        long now = System.currentTimeMillis();
                        long inputDate = date.getTime();
                        if((now - inputDate) <= (1000 * 60 * 60 * 24 * 1)) { %>
                           <img alt="new" src="resources/gif/neww.gif">
                        <%}else { 
                           }%> 
                     ${dto.noticeTitle }</a></td>
                     <td class="success">${dto.noticeRegDate }</td>
                     <td class="success">${dto.noticeCount }</td>
                  </tr>
               </c:forEach>
            </c:otherwise>
         </c:choose>
         <tr class="success">
            <td colspan="5" align="center">
               <c:choose>
                  <c:when test="${before < current }">
                     <a href="notice.do?currentPage=${current - 1}">◀&nbsp;</a>
                  </c:when>
                  <c:otherwise>
                  </c:otherwise>
               </c:choose>
                     <c:forEach begin="${startPage }" end="${endPage }" var="i">
                        <c:choose>
                           <c:when test="${i eq current }">
                              <strong>${i }&nbsp;</strong>
                           </c:when>
                           <c:otherwise>
                              <a href="notice.do?currentPage=${i }">${i }&nbsp;</a>
                           </c:otherwise>
                        </c:choose>
                     </c:forEach>
               <c:choose>
                  <c:when test="${lastPage eq current }">
                     
                  </c:when>
                  <c:otherwise>
                     <a href="notice.do?currentPage=${current+1 }">&nbsp;▶</a>
                  </c:otherwise>
               </c:choose>
            </td>
         </tr>
      </table>
      </div>
      </div>
   </c:if>
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
<script type="text/javascript">
   $(function() {
       $(".admin").hide();
       $(".user").hide();
       
       var grade = $(loginSuccess.role).trim();
      if(grade == "ADMIN"){
        $(".admin").show();
        $(".none").hide();   
   }else if(grade == "USER"){
        $(".user").show();
       $(".none").hide();   
   }
   });
</script>
</html>