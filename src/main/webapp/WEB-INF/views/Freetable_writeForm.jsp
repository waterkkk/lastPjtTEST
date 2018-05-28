<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@ page import="com.bom.dto.FreetableDto"%>
<%@ page import="com.bom.dao.FreetableDao"%>
<%@ page import="com.bom.biz.FreetableBiz"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FreetableWriteForm</title>

</head>
<body>

	<h1>글쓰기</h1>
   <div class="content">
	<form action="write.do" method="post">

		<table id="table" border="1" >
			<col width="100">
			<col width="670">

			<tr>
				<th>작성자</th>
<%-- 				<td><input type="text" style='border:none' name="id" value="${dto.freetable_id }" readonly="readonly"></td> --%>
					<td><input type="text" name="freetable_id" /></td>
			</tr>
			<tr>
						

			<tr>
				<th>제목</th>
				<td><input type="text" name="freetable_title"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="100" name="freetable_content"></textarea></td>
			</tr>

			<tr>
				<td colspan="2" align="right">
					<input type="submit"  value="작성완료">
					<input type="button" value="취소" onclick="location.href='board.do'"></td>
			</tr>
		</table>
	</form>
	</div>
	
	

</body>
</html>