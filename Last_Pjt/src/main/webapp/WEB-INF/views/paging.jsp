<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


</script>
</head>
<body>

<div class="paginate">
    <a href="Admin_list.do?firtPageNo=${param.firstPageNo}" class="first">처음 페이지</a>
    <a href="Admin_list.do?prevPageNo=${param.prevPageNo}" class="prev">이전 페이지</a>
    <span>
        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq param.pageNo}"><a href="Admin_list.do?i=${i}" class="choice">${i}</a></c:when>
                <c:otherwise><a href="Admin_list.do?i=${i}">${i}</a></c:otherwise>
            </c:choose>
        </c:forEach>
    </span>
    <a href="Admin_list.do?nextPageNo=${param.nextPageNo}"  class="next">다음 페이지</a>
    <a href="Admin_list.do?finalPageNo=${param.finalPageNo}" class="last">마지막 페이지</a>
</div>



</body>
</html>