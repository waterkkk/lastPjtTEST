<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 @font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}

a { text-decoration:none }

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insert.jsp</title>
</head>
<body>
  <div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
   </div><br/><br/><br/>
   

    <div class="container">
<h3>관리자-회원추가</h3>
   <form action="Admin_insert.do" method="post">
    <div class="form-group">
            <label>ID</label>
            <p><input type="text" name="member_id" class="form-control"></p>
         </div>
         <div class="form-group">
            <label>PASSWORD</label>
            <p><input type="text" name="member_pw" <%-- value="${admin_dto.member_pw }" --%> class="form-control"></p>
         </div>
         <div class="form-group">
            <label>이름</label>
            <p><input type="text" name="member_name" class="form-control"></p>
         </div>
         <div class="form-group">
            <label>email</label>
            <p><input type="text" name="member_email" class="form-control"></p>
         </div>
         <div class="form-group">
            <label>phone</label>
            <p><input type="text" name="member_phone" class="form-control"></p>
         </div>
         <div class="form-group">
            <label>가입여부</label>
            <p><input type="text" name="member_enabled" class="form-control"></p>
         </div>
         <div class="form-group">
            <label>등급</label>
            <p><input type="text" name="member_role" class="form-control"></p>
         </div>
         <button type="submit" class="btn btn-primary">작성</button>
      </form>
   </div>

</body>
</html>