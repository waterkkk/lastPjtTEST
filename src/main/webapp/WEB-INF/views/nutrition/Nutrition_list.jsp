<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식품게시판</title>
<link rel="stylesheet" href="resources/css/bootstrap3.css">
<link rel="stylesheet" href="resources/css/filter.css?ver=1">
<style type="text/css">

@font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}

* {
   font-family: "Godo";
   font-size:10pt;
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
      background-image: url("resources/img/backgo.jpg");
      background-size: 1380px 2000px;
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
   .div{
      width:100%;
   }
   .jumbodiv{
      position:absolute;
      width:100%;
      top:50px;
      height:300px;
      background-image: url("resources/img/nutr.jpg");
      background-size:1380px 300px;   
   }
   .banner{
      position:absolute;
      width:30%;
      height:60%;
      top:400px;
   }
   .none{
      display:block;
      font-weight:bold;
      font-size:25pt;
      opacity:0.5;
   }
   .act{
      display:block;
      font-weight:bold;
      font-size:30pt;
      color:white;
   }
   #ta{
      position:absolute;
      top:400px;
      width:70%;
      left:10%;
      height:60%;
   }
   .table-dark{
      position:absolute;
      left:27%;
      width:70%;
   }
   th{
      text-align:center;
   }
   td{
      text-align:center;
   }
   .form-control{
      display: inline-block;
   }
   btn-primary{
      display:inline-block;
   }
   .text{
      position: absolute;
      top:30%;
      font-size:40pt;
      left:40%;
      color:white;
   }
   .container{
      position: absolute;
      top:400px;
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
            <h1 class="text">식품 게시판</h1>
         </div>
      </div>
<c:if test="${empty search }">
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
      <div class="banner">
         <h1 class="act">&nbsp;식품</h1>
         <h1 class="none">&nbsp;음식</h1>
         <h1 class="none">&nbsp;맛집 조회</h1>
      </div>
      <div id="ta">
         <table class="table table-dark" style="width:100%;"> 
            <col width="160">
            <col width="230">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <col width="50">
            <tr>
               <th class="info">식품 분류</th>
               <th class="info">식품 이름</th>
               <th class="info">1회 제공량</th>
               <th class="info">칼로리</th>
               <th class="info">탄수화물</th>
               <th class="info">단백질</th>
               <th class="info">지방</th>
               <th class="info">당류</th>
               <th class="info">나트륨</th>
               <th class="info">콜레스테롤</th>
               <th class="info">포화지방산</th>
               <th class="info">트랜스지방산</th>
            </tr>
            <c:forEach begin="${start}" end="${end }" var="i">
               <tr>
                  <td class="danger">${list.get(i).foodKind }</td>
                  <td class="danger">${list.get(i).foodName }</td>
                  <td class="danger">${list.get(i).foodOne }</td>
                  <td class="danger">${list.get(i).foodKcal }</td>
                  <td class="danger">${list.get(i).foodCarbo }</td>
                  <td class="danger">${list.get(i).foodProtein }</td>
                  <td class="danger">${list.get(i).foodFat }</td>
                  <td class="danger">${list.get(i).foodGlucos }</td>
                  <td class="danger">${list.get(i).foodNat }</td>
                  <td class="danger">${list.get(i).foodChole }</td>
                  <td class="danger">${list.get(i).foodsfa }</td>
                  <td class="danger">${list.get(i).foodtfa }</td>
               </tr>
            </c:forEach>
            <tr>
               <td class="warning" align="center" colspan="13">
               <c:choose>
                  <c:when test="${before < current }">
                     <a href="nutrition.do?currentPage=${current-1 }">◀</a>
                  </c:when>
                  <c:otherwise>
                  
                  </c:otherwise>
               </c:choose>
                  <c:forEach begin="${startPage }" end="${endPage }" var="i">
                     <c:choose>
                        <c:when test="${i eq current }">
                           <strong>${i }</strong>
                        </c:when>
                        <c:otherwise>
                           <a href="nutrition.do?currentPage=${i }">${i }&nbsp;</a>                  
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>
                  <c:choose>
                     <c:when test="${lastPage eq current }">
                     
                     </c:when>
                     <c:otherwise>
                        <a href="nutrition.do?currentPage=${current + 1 }">▶</a>
                     </c:otherwise>
                  </c:choose>
               </td>
            </tr>
            <tr class="warning">
               <td colspan="13" align="center">
                  <form action="nutritionSearch.do">
                     <select name="kind">
                        <option value="kind">식품 분류</option>
                        <option value='name'>식품 이름</option>
                     </select>
                     <input type="hidden" name="currentPage" value="1">
                     <input type="text" placeholder="검색어를 입력하세요" name="search">
                     <input class="btn btn-primary" type="submit" value="검색">   
                  </form>
               </td>
            </tr>
         </table>
      </div>
   </c:if>
</c:if>
<c:if test="${search != null }">
   <div class="banner">
      <h1 class="act">&nbsp;식품</h1>
      <h1 class="none">&nbsp;음식</h1>
      <h1 class="none">&nbsp;맛집 조회</h1>
   </div>
   <div id="ta">
      <table class="table table-dark"> 
         <col width="160">
         <col width="230">
         <col width="50">
         <col width="50">
         <col width="50">
         <col width="50">
         <col width="50">
         <col width="50">
         <col width="50">
         <col width="50">
         <col width="50">
         <col width="50">
         <tr>
            <th class="info">식품 분류</th>
            <th class="info">식품 이름</th>
            <th class="info">1회 제공량</th>
            <th class="info">칼로리</th>
            <th class="info">탄수화물</th>
            <th class="info">단백질</th>
            <th class="info">지방</th>
            <th class="info">당류</th>
            <th class="info">나트륨</th>
            <th class="info">콜레스테롤</th>
            <th class="info">포화지방산</th>
            <th class="info">트랜스지방산</th>
         </tr>
         <c:choose>
            <c:when test="${empty slist }">
               <tr>
                  <td colspan="13" align="center" class="danger">-------------------- 데이터가 없습니다 --------------------</td>
               </tr>
            </c:when>
            <c:otherwise>
               <c:forEach begin="${start}" end="${end }" var="i">
                  <tr>
                     <td class="danger">${slist.get(i).foodKind }</td>
                     <td class="danger">${slist.get(i).foodName }</td>
                     <td class="danger">${slist.get(i).foodOne }</td>
                     <td class="danger">${slist.get(i).foodKcal }</td>
                     <td class="danger">${slist.get(i).foodCarbo }</td>
                     <td class="danger">${slist.get(i).foodProtein }</td>
                     <td class="danger">${slist.get(i).foodFat }</td>
                     <td class="danger">${slist.get(i).foodGlucos }</td>
                     <td class="danger">${slist.get(i).foodNat }</td>
                     <td class="danger">${slist.get(i).foodChole }</td>
                     <td class="danger">${slist.get(i).foodsfa }</td>
                     <td class="danger">${slist.get(i).foodtfa }</td>
                  </tr>
               </c:forEach>
            </c:otherwise>
         </c:choose>
         <tr>
            <td class="warning" align="center" colspan="13">
            <c:choose>
               <c:when test="${before < current }">
                  <a href="nutritionSearch.do?currentPage=${current-1 }&kind=${kind }&search=${search }">◀</a>
               </c:when>
               <c:otherwise>
               
               </c:otherwise>
            </c:choose>
               <c:forEach begin="${startPage }" end="${endPage }" var="i">
                  <c:choose>
                     <c:when test="${i eq current }">
                        <strong>${i }</strong>
                     </c:when>
                     <c:otherwise>
                        <a href="nutritionSearch.do?currentPage=${i }&kind=${kind }&search=${search }">${i }&nbsp;</a>                  
                     </c:otherwise>
                  </c:choose>
               </c:forEach>
               <c:choose>
                  <c:when test="${lastPage eq current }">
                  
                  </c:when>
                  <c:otherwise>
                     <a href="nutritionSearch.do?currentPage=${current + 1 }&kind=${kind}&search=${search} ">▶</a>
                  </c:otherwise>
               </c:choose>
            </td>
         </tr>
         <tr class="warning">
            <td colspan="13" align="center">
               <form action="nutritionSearch.do">
                  <select name="kind">
                     <option value="kind">식품 분류</option>
                     <option value='name'>식품 이름</option>
                  </select>
                  <input type="hidden" value="${current }" name="currentPage">
                  <input type="text" placeholder="검색어를 입력하세요" name="search">
                  <input class="btn btn-primary" type="submit" value="검색">   
               </form>
            </td>
         </tr>
      </table>
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