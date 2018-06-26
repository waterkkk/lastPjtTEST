<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 -리스트</title>
 <style type="text/css">

@font-face {

font-family:"Godo";
src:url("resources/font/GodoB.ttf");
}

*{
   font-family:"Godo";
   font-size: 20px;
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

</style> 
<script type="text/javascript">

</script>
</head>
<body>
   <div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
   </div><br/><br/><br/>

   <div class="container">
   <h3>회원 리스트</h3>
   <br/><br/>
   <div style="float: right;">
   <button class="btn btn-dark" onclick="location.href='index.jsp'" style="height: 50px; font-size: 20px;">메인</button>&nbsp;&nbsp;
   <button class="btn btn-dark" onclick="location.href='notice.do?currentPage=1'" style="height: 50px; font-size: 20px;">공지사항 </button>
   </div>
   <form class="form-inline m-0" action="Admin_search.do" method="post">
      <input type="hidden" name="Admin_search.do" value="Admin_keyword">
      <select name="Admin_search" id="Admin_search" class="form-control" style="height: 50px; font-size: 20px;">
         <option value="member_id">ID</option>
         <option value="member_name">이름</option>
      </select>
      <input type="text" class="form-control" name="Admin_keyword" id="Admin_keyword" placeholder="ID/이름을 입력하세요" style="height: 50px; font-size: 20px;">&nbsp;&nbsp;
      <button type="submit" class="btn btn-dark" style="height: 50px; font-size: 20px;">검색</button>
        </form><br/><br/><br/><br/>
        
        </div>
      <div class="container">
         <table class="table table-hover">
               <tr>
                  <th width="40px;">ID</th>
                  <th width="40px;">이름</th>
                  <th width="50px;">이메일</th>
                  <th width="40px;">전화번호</th>
                  <th width="50px;">가입여부</th>
                  <th width="50px;">가입날짜</th>
                  <th width="40px;">등급</th>
                  <th width="100px;">등급조정</th>
               </tr>
      
   <c:choose>
      <c:when test="${empty admin_list }">
         <h3>******회원정보가 없습니다.*******</h3>
      </c:when>
            <c:otherwise>
               <c:forEach items="${requestScope.admin_list }" var="admin_dto">
                  <tr>
                     <td><a href="Admin_detail.do?member_id=${admin_dto.member_id }">${admin_dto.member_id }</a></td>
                     <td>${admin_dto.member_name }</td>
                     <td>${admin_dto.member_email }</td>
                     <td>${admin_dto.member_phone }</td>
                     <td>${admin_dto.member_enabled }</td>
                     <td>${admin_dto.member_date }</td>
                     <td>${admin_dto.member_role }</td>
                     <td width="160px;">
                            <form action="Admin_role.do" method="post" style="display: flex;">
                               <input type="hidden" name="member_id" value="${admin_dto.member_id}"/>
                              <select name="member_role" id="${admin_dto.member_role}" class="form-control" style="height: 50px; font-size: 20px;">
                           <option value="USER">회원</option>
                           <option value="ADMIN">관리자</option>
                        </select>&nbsp;
                                <button type="submit" class="btn btn-dark">저장</button>
                            </form>
                         </td>
                  </tr>
               </c:forEach>
            </c:otherwise>   
   </c:choose>         
   
         </table>
      </div>
<br/><br/><br/>

   <div class="container" style="text-align: center;" >
   <c:if test="${startPage>3 }">
     [<a href="Admin_list.do?page=${startPage - 1 }" id="paging">이전</a>]
    </c:if>

    <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
     <c:if test="${i==currentPage }">
     [<a href="Admin_list.do?page=${i }" id="cur_paging">${i }</a>]
     </c:if>
     <c:if test="${i!=currentPage }">
     [<a href="Admin_list.do?page=${i }" id="paging">${i }</a>]
     </c:if>
    </c:forEach>

    <c:if test="${endPage<totalP }">
     [<a href="Admin_list.do?page=${endPage + 1 }" id="paging">다음</a>]
    </c:if>
   
   </div>
<br/><br/><br/><br/>
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