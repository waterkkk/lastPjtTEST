



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("UTF-8"); %>
    <%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자세히</title>
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
   .table-dark{
      position: absolute;
      left:300px;
      top:100px;
   }
   .jumbodiv{
      position:absolute;
      background-image:url("resources/img/planet.jpg");
      width:100%;
      height:300px;
      top:50px;
   }
   .navbar-default{
      margin-bottom:0%;
   }
   .wrap{
      position:absolute;
      top:40%;
      width:80%;
      left:10%;
   }
   .text{
      position:absolute;
      left:40%;
      top:30%;
      color:white;
      font-size:40pt;
   }
</style>
</head>
<body>
      <div id="header"> 
         <%@ include file="../Form/Header3.jsp"%> 
      </div>

<div class="div">
   <div class="jumbodiv">
      <h1 class="text">일정 내용</h1>
   </div>
</div>
<div class="wrap">
   <div class="col-md-8">
      <table class="table table-dark">
      <col width="50">
      <col width="300">
         <tr>
            <th class="info">번호</th>
            <td class="warning">${list.inNo }</td>
         </tr>
         <tr>
            <th class="info">ID</th>
            <td class="warning">${list.inId }</td>
         </tr>
         <tr>
            <th class="info">일정 일</th>
            <td class="warning">${list.inMdate }</td>
         </tr>
         <tr>
            <th class="info">작성 일</th>
            <td class="warning">${list.inRegDate }</td>
         </tr>
         <tr>
            <th class='info'>제목</th>
            <td class="warning"><input class="form-control" value="${list.inTitle }" readonly="readonly">
         </tr>
         <tr>
            <th class="info">내용</th>
            <td class="warning"><textarea rows="10" cols="80" class="form-control" readonly="readonly">${list.inContent }</textarea></td>
         </tr>
         <tr>
            <td colspan="2" align="right">
               <input class="btn btn-primary" value="수정" data-target="#update" data-toggle="modal">
               <input class="btn btn-primary" value="삭제" onclick="location.href='del.do?No=${list.inNo}&id=${loginSuccess.member_id }'">
               <input class="btn btn-primary" value="뒤로가기" onclick="location.href='indi.do?id=${loginSuccess.member_id}'">
            </td>
         </tr>
      </table>
   </div>
</div>
<div class="row">
   <div class="modal" id="update" tabindex="-1">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h1 class="text-center">일정 수정</h1>
               <button class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
               <form action="updat.do">
                  <input type="hidden" value="${list.inNo }" name="no">
                  <table class="table talbe-dark">
                     <tr>
                        <th class="info">제목</th>
                        <td class="warning"><input class="form-control" value="${list.inTitle }" name="title"></td>
                     </tr>
                     <tr>
                        <th class="info">내용</th>
                        <td>
                           <textarea rows="10" cols="80" class="form-control" name="content">${list.inContent }</textarea>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2" align="right">
                           <input type="submit" class="Btn btn-primary" value="수정완료">
                        </td>
                     </tr>
                  </table>               
               </form>
            </div>
         </div>
      </div>
   </div>
</div><br/><br/><br/>
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