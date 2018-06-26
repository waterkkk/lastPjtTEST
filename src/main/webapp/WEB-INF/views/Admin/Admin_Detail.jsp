<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 @font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}

a { text-decoration:none }

*{
   font-family:"Godo";
   font-size: 20px;
}


.container{
text-align: center;
}


</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>detail</title>
<style type="text/css">
#up {
   display: none;
}
</style>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
   function update() {
      $("#del").hide();
      $("#up").show();
   }
</script>
</head>
<body>
  <div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
   </div><br/><br/>

   <jsp:useBean id="admin_dto" class="com.bom.dto.AdminDto" scope="request"></jsp:useBean>
   <div class="container">
   <div class="in">
   <form action="Admin_delete.do?page" method="post" id="del" > 
   <input type="hidden" name="member_id" value="${admin_dto.member_id }">
      <h3>회원 정보 조회</h3><br/>
      <br/>
         <div class="form-group">
            <label>ID</label>
            <p><jsp:getProperty property="member_id" name="admin_dto" /></p>
         </div><br/>
         <div class="form-group">
            <label>PASSWORD</label>
            <p><jsp:getProperty property="member_pw" name="admin_dto" /></p>
         </div><br/>
         <div class="form-group">
            <label>이름</label>
            <p><jsp:getProperty property="member_name" name="admin_dto" /></p>
         </div><br/>
         <div class="form-group">
            <label>email</label>
            <p><jsp:getProperty property="member_email" name="admin_dto" /></p>
         </div><br/>
         <div class="form-group">
            <label>phone</label>
            <p><jsp:getProperty property="member_phone" name="admin_dto" /></p>
         </div><br/>
         <div class="form-group">
            <label>가입여부</label>
            <p><jsp:getProperty property="member_enabled" name="admin_dto" /></p>
         </div><br/>
         <div class="form-group">
            <label>가입날짜</label>
            <p><jsp:getProperty property="member_date" name="admin_dto" /></p>
         </div><br/>
         <div class="form-group">
            <label>등급</label>
            <p><jsp:getProperty property="member_role" name="admin_dto" /></p>
         </div><br/>
         <br/>
            <button type="submit" class="btn btn-primary">삭제</button>
            <button type="button" class="btn btn-primary" onclick="update()">수정</button>
            <button type="button" class="btn btn-primary" onclick="location.href='Admin_list.do'">목록</button>
   </form>
   </div>
   </div>

   <div class="container">
   <div class="in">
   <form action="Admin_update.do" method="post" id="up">
      <h3>회원 정보 수정</h3><br/><br/>
       <input type="hidden" class="form-control" name="member_id" value="${admin_dto.member_id }">
         <div class="form-group">
            <label>ID</label>
            <p>${admin_dto.member_id }</p>
         </div><br/>
         <div class="form-group">
            <label>PASSWORD</label>
            <p align="center"><input type="text" style="width: 200px; text-align: center;" class="form-control" name="member_pw" value="${admin_dto.member_pw }"></p>
         </div><br/>
         <div class="form-group">
            <label>이름</label>
            <p align="center"><input type="text" style="width: 200px; text-align: center;" class="form-control" name="member_name"></p>
         </div><br/>
         <div class="form-group">
            <label>email</label>
            <p align="center"><input type="text" style="width: 200px; text-align: center;" class="form-control" name="member_email"></p>
         </div><br/>
         <div class="form-group">
            <label>phone</label>
            <p align="center"><input type="text" style="width: 200px; text-align: center;" class="form-control" name="member_phone"></p>
         </div><br/>
         <div class="form-group">
            <label>가입여부</label>
            <p><input type="hidden" name="member_enabled" value="${admin_dto.member_enabled }">${admin_dto.member_enabled }</p>
         </div><br/>
         <div class="form-group">
            <label>가입날짜</label>
            <p>${admin_dto.member_date }</p>
         </div><br/>
         <div class="form-group">
            <label>등급</label>
            <p><input type="hidden" name="member_role" value="${admin_dto.member_role }">${admin_dto.member_role }</p>
         </div><br/>
            <button type="submit" class="btn btn-primary">저장</button>
   </form>
   </div>
   </div>
   
   <br/><br/><br/><br/>
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