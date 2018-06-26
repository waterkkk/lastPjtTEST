


<%@page import="com.bom.dao.EducationDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Education</title>
<!--jquery와 bootstrap.js파일 같이 연결해줘야 dropdown창이 실행됨-->
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap3.css">
<link rel="stylesheet" href="resources/css/codingBooster3.css">
<link rel="stylesheet" href="resources/css/filter.css?ver=1">
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
      background-image: url("resources/img/235.jpg");
      background-size: 100% 1100px;
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
   .jumbodiv{
      position:absolute;
      width:100%;
      height:300px;
      top:50px;
      background-image: url("resources/img/edupencil.jpg");
      background-size:1380px 380px;
      
   }
   .banner{
      height:400px;
      background-color:gray;
      border-radius:15px 50px;
      border-color:gray;
   }
   #center{
      align:center;
      position:absolute;
      top:45%;
   }
   .navbar-default{
      margin-bottom:0%;
   }
   .table-dark{
      position:absolute;
      top:50%;
   }
   .container{
      position:absolute;
      top:400px;
      left:3%;
   }
   .text-right{
      position:absolute;
      left:70%;
      top:30%;
      font-size:40pt;
      font-weight:bold;
      color:#000000;
   }
   #text,
   #text:hover
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
<body>
      <div id="header"> 
         <%@ include file="../Form/Header3.jsp"%> 
      </div>
      <div class="div">
         <div class="jumbodiv">
            <h1 class="text-right">교육 게시판</h1>
         </div>
      </div>
<c:if test="${search == null }">
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
   <c:if test="${dto.member_id != null}">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <table border="1" class="table table-dark" id="center">
                  <col width="50">
                  <col width="220">
                  <col width="50">
                  <col width="50">
                  <col width="50">
                  <col width="100">
                  <col width="50">
                  <col width="100">
                  <col width="100">
                  <col width="100">
                  <tr>
                     <th class="danger" style="text-align:center;">강사명</th>
                     <th class="danger" style="text-align:center;">강좌명</th>
                     <th class="danger" style="text-align:center;">대상</th>
                     <th class="danger" style="text-align:center;">방법</th>
                     <th class="danger" style="text-align:center;">요일</th>
                     <th class="danger" style="text-align:center;">교육장소</th>
                     <th class="danger" style="text-align:center;">수강료</th>
                     <th class="danger" style="text-align:center;">교육시작일</th>
                     <th class="danger" style="text-align:center;">교육종료일</th>
                     <th class="danger" style="text-align:center;">자세한 내용은 URL</th>
                  </tr>
                  <c:choose>
                     <c:when test="${empty list }">
                        <tr class="info"><td colspan="10" align="center">------------------데이터가 없습니다.------------------</td></tr>
                     </c:when>
                     <c:otherwise>   
                        <c:forEach begin="${start }" end="${end }" var="i">
                           <tr>
                              <td class="info" align="center">${list.get(i).teacher}</td>
                              <td class="info" align="center">${list.get(i).name }</td>
                              <td class="info" align="center">${list.get(i).object }</td>
                              <td class="info" align="center">${list.get(i).way }</td>
                              <td class="info" align="center">${list.get(i).opWeek }</td>
                              <td class="info" align="center">${list.get(i).place }</td>
                              <td class="info" align="center">${list.get(i).price }</td>
                              <td class="info" align="center">${list.get(i).start }</td>
                              <td class="info" align="center">${list.get(i).end }</td>
                              <td class="info" align="center"><a href="${list.get(i).URL }">${list.get(i).URL }</a></td>
                           </tr>
                        </c:forEach>
                     </c:otherwise>
                  </c:choose>
               <tr>
                  <td  class="warning" align="center" colspan="10">
                     <c:choose>
                        <c:when test="${before < current }">
                           <a href="eduUser.do?currentPage=${current-1 }">◀</a>
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
                              <a href="eduUser.do?currentPage=${i }">${i }&nbsp;</a>                  
                           </c:otherwise>      
                        </c:choose>
                     </c:forEach>
                     <c:choose>
                        <c:when test="${lastPage eq current }">
                        </c:when>
                        <c:otherwise>
                           <a href="eduUser.do?currentPage=${current+1 }">▶</a>
                        </c:otherwise>               
                     </c:choose>
                  </td>
               </tr>
               <tr style="border-color=white;">
                  <td align="center" colspan="10">
                     <form action="Search.do">
                        <select name="kind">
                           <option value="teacher">강사명</option>
                           <option value="name">강좌명</option>
                        </select>
                        <input type="hidden" name="currentPage" value="1">
                        <input type="text" placeholder="검색어를 입력하세요" name="search">
                        <input type="submit" class="btn btn-primary bt-sm" value="검색">
                     </form>
                     <a class="first" style="text-decoration:none; color:black; font-weight:bold;" href="eduUser.do?currentPage=1">처음 페이지</a>
                  </td>
               </tr>
               </table>
            </div>
         </div>
      </div>
   </c:if>
 </c:if>
<c:if test="${search != null}">
   <div class="container">
   <div class="row">
      <div class="col-md-12">
         <table border="1" class="table table-dark" id="center">
            <col width="50">
            <col width="220">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="100">
            <col width="50">
            <col width="100">
            <col width="100">
            <col width="100">
            <tr>
               <th class="danger" style="text-align:center;">강사명</th>
               <th class="danger" style="text-align:center;">강좌명</th>
               <th class="danger" style="text-align:center;">대상</th>
               <th class="danger" style="text-align:center;">방법</th>
               <th class="danger" style="text-align:center;">요일</th>
               <th class="danger" style="text-align:center;">교육장소</th>
               <th class="danger" style="text-align:center;">수강료</th>
               <th class="danger" style="text-align:center;">교육시작일</th>
               <th class="danger" style="text-align:center;">교육종료일</th>
               <th class="danger" style="text-align:center;">자세한 내용은 URL</th>
            </tr>
            <c:choose>
               <c:when test="${empty slist }">
                  <tr class="info"><td colspan="10" align="center">------------------데이터가 없습니다.------------------</td></tr>
               </c:when>
               <c:otherwise>   
                  <c:forEach begin="${start }" end="${end }" var="i">
                     <tr>
                        <td class="info" align="center">${slist.get(i).teacher}</td>
                        <td class="info" align="center">${slist.get(i).name }</td>
                        <td class="info" align="center">${slist.get(i).object }</td>
                        <td class="info" align="center">${slist.get(i).way }</td>
                        <td class="info" align="center">${slist.get(i).opWeek }</td>
                        <td class="info" align="center">${slist.get(i).place }</td>
                        <td class="info" align="center">${slist.get(i).price }</td>
                        <td class="info" align="center">${slist.get(i).start }</td>
                        <td class="info" align="center">${slist.get(i).end }</td>
                        <td class="info" align="center"><a href="${slist.get(i).URL }">${slist.get(i).URL }</a></td>
                     </tr>
                  </c:forEach>
               </c:otherwise>
            </c:choose>
         <tr>
            <td  class="warning" align="center" colspan="10">
               <c:choose>
                  <c:when test="${before < current }">
                     <a href="Search.do?currentPage=${current-1 }&kind=${kind }">◀</a>
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
                        <a href="Search.do?currentPage=${i }&kind=${kind }">${i }&nbsp;</a>                  
                     </c:otherwise>      
                  </c:choose>
               </c:forEach>
               <c:choose>
                  <c:when test="${lastPage eq current }">
                  </c:when>
                  <c:otherwise>
                     <a href="Search.do?currentPage=${current+1 }&kind=${kind }">▶</a>
                  </c:otherwise>               
               </c:choose>
            </td>
         </tr>
         <tr style="border-color=white;">
            <td align="center" colspan="10">
               <form action="Search.do">
                  <select name="kind">
                     <option value="teacher">강사명</option>
                     <option value="name">강좌명</option>
                  </select>
                  <input type="hidden" name="currentPage" value="1">
                  <input type="text" placeholder="검색어를 입력하세요" name="search">
                  <input type="submit" class="btn btn-primary bt-sm" value="검색">
               </form>
               <a class="first" style="text-decoration:none; color:black; font-weight:bold;" href="edu.do?currentPage=1">처음 페이지</a>
            </td>
         </tr>
         </table>
      </div>
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
   var nowZoom = 100;
   function ZoomIn(){
      nowZoom = nowZoom + 20;
      if(nowZoom >= 200) nowZoom = 200;
      zooms();
   }
   function ZoomOut(){
      nowZoom = nowZoom -10;
      if(nowZoom <=70) nowZoom = 70;
      zooms();
   }
   function zooms(){
      document.body.style.zoom = nowZoom + "%";
      if(nowZoom == 70) {
         alert("더 이상 축소할 수 없습니다.");
      }if(nowZoom == 200) {
         alert("더 이상 확대할 수 없습니다.");
      }
   }
</script>
</html>