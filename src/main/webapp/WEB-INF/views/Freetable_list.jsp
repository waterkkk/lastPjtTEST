<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.bom.dto.FreetableDto"%>
<%@ page import="com.bom.dao.FreetableDao"%>
<%@ page import="com.bom.biz.FreetableBiz"%>

<!DOCTYPE html>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Freetable_list</title>


</head>

<body>



	<div class="content" id="ListForm">
		<h1 style="margin-left: 3%;">자유게시판</h1>

		<%-- 	<c:if test="${empty login.member_id }"> --%>
		<!-- 	  <div id="loginAlert"> -->
		<!-- 	  	게시판을 보기 위해서는 <a id="doLogin" href="loginPage.jsp">로그인</a>이 필요합니다 -->
		<!-- 		<br><br><br><br> -->
		<!-- 	  </div> -->
		<%-- 	</c:if> --%>

		<%-- 	<c:if test="${login.member_id != null}"> --%>

		<div align="center" id="selectAllLista">
			<table border="1">
				<col width="50">
				<col width="100">
				<col width="350">
				<col width="100">
				<col width="70">


				<tr id="titleth">
					<th align="center">No.</th>
					<th>작성자</th>
					<th>제 목</th>
					<th>날 짜</th>
					<th>조회수</th>
				</tr>

				<c:choose>
					<c:when test="${empty allList}">
						<tr>
							<td colspan="9" align="center">─────── 작성된 글이 존재하지 않습니다.
								───────</td>
						</tr>
					</c:when>

					<c:otherwise>
						<c:forEach items="${allList}" var="dto">
							<c:choose>
								<c:when test="${dto.freetable_delFlag eq 'Y'}">
									<tr>
										<td colspan="9" align="center">─────── 삭제된 글입니다. ───────</td>
									</tr>
								</c:when>


								<c:otherwise>
									<tr>
										<td align="center">${dto.freetable_no }</td>
										<td align="center">${dto.freetable_id }</td>
										<td>
											<!-- 타이틀탭 수에 따라 앞부분 공백주기 --> <c:forEach begin="1"
												end="${dto.freetable_titleTab }">
								&nbsp;&nbsp;
								</c:forEach> <a href="detail.do?freetable_no=${dto.freetable_no}">${dto.freetable_title}</a>
										</td>
										<td align="center">${dto.freetable_regDate }</td>
										<td align="center">${dto.freetable_readCount }</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<tr></tr>
				<tr></tr>
				<tr>
					<td colspan="4" align="center"><c:choose>
							<c:when test="${nowPage eq 1 }">◀</c:when>
							<c:otherwise>
								<a href="board.do?nowPage=${nowPage-1 }">◀</a>
							</c:otherwise>
						</c:choose> <c:forEach begin="${startPage }" end="${endPage }" var="i">
							<a href="board.do?nowPage=${i }">${i}</a>&nbsp;
				</c:forEach> <c:choose>
							<c:when test="${nowPage eq countPage }">▶</c:when>
							<c:otherwise>
								<a href="board.do?nowPage=${nowPage+1} ">▶</a>
							</c:otherwise>
						</c:choose></td>
					<td colspan="1" align="center"><input type="button"
						value="글쓰기" onclick="location.href='writeForm.do'"></td>
				</tr>
			</table>
		</div>

		<div align="center" id="ResultForm">
			<form action="search.do" method="get">
				<select name="searching" id="searching">
					<!-- 검색조건을 검색처리후 결과화면에 보여주기위해  c:out 출력태그 사용, 삼항연산자 -->
					<option value="freetable_id">작성자</option>
					<option value="freetable_title">글 제목</option>
					<option value="freetable_content">글 내용</option>
					<option value="freetable_no">글 번호</option>
				</select> <input name="keyword" value="${map.keyword}"> <input
					type="submit" value="검색" onclick="ResultUpdate();">
			</form>
		</div>
		<br> <br>



		<div align="center">
			<table border="1" width="600px">
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제 목</th>
					<th>날 짜</th>
					<th>조회수</th>
				</tr>
				<c:forEach var="row" items="${map.allList}">
					<tr align="center">
						<td>${row.freetable_no}</td>
						<td>${row.freetable_id}</td>
						<td><a
							href="${path}/commRe.do?freetable_no=${row.freetable_no}">${row.freetable_title}</a></td>
						<td>${row.freetable_regDate}</td>
						<td>${row.freetable_readCount}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<%-- 	</c:if> --%>

	</div>
	</div>





</body>

</html>