<%@page import="javax.naming.Context"%>
<%@page import="com.bom.dao.IndiDaoImpl"%>
<%@page import="com.bom.dao.IndiDao"%>
<%@page import="com.bom.dto.LoginDto"%>
<%@page import="com.bom.dto.IndiDto"%>
<%@page import="java.util.List"%>
<%@page import="com.bom.dao.Util"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>individual</title>
<link rel="stylesheet" href="resources/css/bootstrap3.css">
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
      background-image: url("resources/img/light.jpg");
      background-size:1380px 2000px;
   }
   .jumbodiv{
      position:absolute;
      text-shadow:0.2em 0.2em 0.2em;
      background-image: url("resources/img/security.jpg");
      font-weight:bold;
      width:100%;
      top:50px;
      height:300px;
      background-size:cover;
   }
   .col-md-4{
      text-align:center;
   }
   .text{
      position:absolute;
      top:15%;
      left:75%;
      font-size:40pt;
   }
   .exp{
      position:absolute;
      top:150px;
      left:76%;
      font-size:15pt;
   }
   #day{
      
      height:100px;
   }
   #da{
      font-size:10pt;
      width:30px;
      height:30px;
   }
   .info{
      position:absolute;
      top:400px;
      height:400px;
   }
   #cal{
      position:absolute;
      left:10%;
      top:400px;
   }
   #caladd{
      position:absolute;
      left:200px;
      top:400px;
   }
   .text{
      position:relative;
      left:70%;
   }
</style>
</head>
<%
   LoginDto login = (LoginDto)session.getAttribute("loginSuccess");
   List<IndiDto> clist = (List<IndiDto>)request.getAttribute("clist");
   Calendar cal = Calendar.getInstance();
   int year = cal.get(Calendar.YEAR);
   int month = cal.get(Calendar.MONTH) + 1;
   cal.set(year,month-1,1);
   int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
   int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
   int date = 0;
   int hour=cal.get(Calendar.HOUR_OF_DAY);
   int min=cal.get(Calendar.MINUTE);
%>
<body>

<div id="header"> 
   <%@ include file="../Form/Header3.jsp"%> 
</div>

<div class="div">
   <div class="jumbodiv">
      <h1 class="text" style="color:white;">개인 페이지</h1>
      <p class="exp" style="color:white;">개인 정보를 볼 수 있는 페이지</p>
   </div>   
</div>
<div class="info" style="background-color:#434B5E; width:80%; left:10%; bottom:38%;" id="info">
<h4 style="color:white;">개인정보</h4>
<hr style="font-weight:bold;">
<div class="row">
   <div class="col-md-5">
      <span style="color:white; font-weight:bold;">아이디 : </span> <input type="text" readonly="readonly" disabled="disabled" value="${loginSuccess.member_id }">
   </div>
   <div class="col-md-4">
      <span style="color:white; font-weight:bold;">이름 : </span><input type="text" readonly="readonly" disabled="disabled" value="${loginSuccess.member_name }">
   </div>
   <div class="col-md-3">
      <p class="btn btn-default btn-sm btn-circle" style="width: 49px;
        height: 49px;
        padding: 5px 0;
        font-size: 20px;
        line-height: 2.00;
        border-radius: 30px;" onclick="cal();"><span>달력</span></p>
   </div>
</div>
<div class="row">
   <div class="col-md-5">
      <span style="color:white; font-weight:bold;">이메일 : </span><input type="text" readonly="readonly" disabled="disabled" value="${loginSuccess.member_email }">
   </div>
   <div class="col-md-5">
      <span style="color:white; font-weight:bold;">전화번호 : </span><input type="text" readonly="readonly" disabled="disabled" value="${loginSuccess.member_phone }">
   </div>
</div>
<br>
<div class="row">
   <div class="col-md-4">
      <span style="color:white; font-weight:bold;">권한    : </span><input type="text" readonly="readonly" disabled="disabled" value="${loginSuccess.member_role }">
   </div>
</div>
<br>
<div class="row">
   <div class="col-md-6">
      <span style="color:white; font-weight:bold;">가입날짜 : </span><input type="text" readonly="readonly" disabled="disabled" value="${loginSuccess.member_date }">
   </div>
</div>
<hr>
</div>
<div id="cal">
   <h1 class="text" style="display:inline-block;"><%=month %>月</h1><a class="btn btn-primary btn-circle" style=" width: 49px;
        height: 49px;
        padding: 5px 0;
        font-size: 20px;
        line-height: 2.00;
        border-radius: 30px; display:inline-block; position:relative; left:100%;" onclick="closet();">close</a>
   <table border="1" style="position:relative; left:20%;">
      <col width="100">
      <col width="100">
      <col width="100">
      <col width="100">
      <col width="100">
      <col width="100">
      <col width="100">
      <tr style="font-weight:bold; background-color:gray; color:white">
         <th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
      </tr>
      <tr>
<%         
      for(int i = 0; i< dayOfWeek-1; i++){
         out.print("<td id='day' style='background-color:gray;'>&nbsp;</td>");
      }

      for(int i = 1; i <= lastDay; i++) {
         date = i;
%>
      <td id="day" style="background-color:white;">
         <a class="btn btn-default text-center" id="da" href="List.do?id=${dto.member_id }&year=<%=year %>&month=<%=month %>&date=<%=i %>"><%=i %></a>
         <div>
            <%=Util.getCalView(i, clist) %>
         </div>
      </td>
<%
         if(((dayOfWeek -1 + i) % 7) == 0) {
            out.print("</tr><tr>");
         }
      }
%>      
</tr>            
      <tr>
         <td colspan="7" align="right" style="background-color:white;">
         <a class="btn btn-default" onclick="add();"><span class="glyphicon glyphicon-pencil">일정추가</span></a>
         
         </td>
      </tr>
   </table>
</div>
            <div id="caladd">
               <h1 class="text-center" style="font-weight:bold;">일정 작성</h1>
               <button class="close" data-dismiss="modals">&times;</button>
               <form action="insert.do">
               <input type="hidden" value="${loginSuccess.member_id }" name="id">
                  <table>
                     <tr>
                        <td>
                           <select name="year">
                  <%
                     for(int i=year-5; i<year+5;i++){
                     %>
                     <option value="<%=i%>" <%=year==i?"selected":""%>><%=i%></option>
                     <%
                     }
                  %>
               </select>년
               <select name="month">
                  <%
                     for(int i=1;i<13;i++){
                        %>
                        <option value="<%=i%>" <%=month==i?"selected":""%>><%=i%></option>
                        <%
                     }
                  %>
               </select>월
               <select name="date">
                  <%
                     for(int i=1;i<=lastDay;i++){
                        %>
                        <option value="<%=i%>" <%=date==i?"selected":""%>><%=i%></option>
                        <%
                     }
                  %>
               </select>일
               <select name="hour">
                  <%
                     for(int i=0;i<24;i++){
                        %>
                        <option value="<%=i%>" <%=hour==i?"selected":""%>><%=i%></option>
                        <%
                     }
                  %>
               </select>시
               <select name="min">
                  <%
                     for(int i=0;i<60;i++){
                        %>
                        <option value="<%=i%>" <%=min==i?"selected":""%>><%=i%></option>
                        <%
                     }
                  %>
               </select>분
                        </td>
                     </tr>
                     <tr>
                        <td><input type="text" value="${loginSuccess.member_id }" disabled="disabled" readonly="readonly" name="id" /></td>
                     </tr>
                     <tr>
                        <td><input type="text" placeholder="일정 제목" name="title" style="width:100%; background-image: url('resources/img/postit.jpg');"/></td>
                     </tr>
                     <tr>
                        <td>
                           <textarea rows="20" cols="78" placeholder="일정 내용" name="content" style="background-image: url('resources/img/postit.jpg'); background-size:100% 100%;" ></textarea>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <button class="btn btn-success btn-circle" type="submit" style="width: 49px;
        height: 49px;
        padding: 5px 0;
        font-size: 20px;
        line-height: 2.00;
        border-radius: 30px;"><span>추가</span></button>
                           <button class="btn btn-success btn-circle" type="button" value="close" onclick="addClose();" style="width: 49px;
        height: 49px;
        padding: 5px 0;
        font-size: 20px;
        line-height: 2.00;
        border-radius: 30px;">close</button>
                        </td>         
                     </tr>
                  </table>
               </form>
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
<script type="text/javascript">
   $(function(){
      $("#cal").hide();
      $("#caladd").hide();
   });
   function cal(){
      $("#cal").slideDown();
      $("#info").slideUp();
   }
   function closet(){
      $("#cal").slideUp();
      $("#info").slideDown();
   }
   function add(){
      $("#cal").slideUp();
      $("#caladd").slideDown();
   }
   function addClose(){
      $("#caladd").slideUp();
      $("#cal").slideDown();
   }
</script>
</html>