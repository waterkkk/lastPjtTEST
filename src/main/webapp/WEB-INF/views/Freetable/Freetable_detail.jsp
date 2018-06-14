<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@ page import="com.bom.dto.FreetableDto"%>
<%@ page import="com.bom.dao.FreetableDao"%>
<%@ page import="com.bom.biz.FreetableBiz"%>
<%@ page import="com.bom.dto.FreecommDto"%>
<%@ page import="com.bom.dao.FreecommDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="editor/samples/css/samples.css">
	<script src="editor/ckeditor.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"
	type="text/css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	
	
	<script type="text/javascript">
	
	

		function FreetableDetail() {
			$("#UpdateForm").hide();
			$("#ReplyForm").hide();
			$("#DetailForm").show();
		}
	
		function FreetableUpdate() {
			$("#DetailForm").hide();
			$("#UpdateForm").show();
		}
	
		function FreetableReply() {
			$("#DetailForm").hide();
			$("#ReplyForm").show();
	
		}
	</script>

<style>
@font-face {
  font-family: 'Godo';
  font-style: normal;
  font-weight: 300;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff') format('woff');
}

 @font-face { 
   font-family: 'Godo'; 
   font-style: normal; 
   font-weight: 600; 
   src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff') format('woff'); 
 } 

.godo * {
 font-family: 'Godo', sans-serif;
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

li span {
 line-height: 1.8;
 font-size: 1.3em;
}

body, table, div, p, h1, h2, h5, h4 {
font-family:'Godo';
}


#UpdateForm {
	display: none;
}

#ReplyForm {
	display: none;
}

table {
	margin-left: auto;
	margin-right: auto;
	text-align: left;
	font-size: 17px;
	width: 80%;
	align: "center";
	border-top: 1px solid #E1E6F6;
	border-bottom: 1px solid #E1E6F6;
	border-left: 1px solid white;
	border-right: 1px solid white;
	border-collapse: collapse;
}

textarea {
	width: 100%;
}

th {
	padding: 5px;
	text-align: center;
	height: 30px;
	background-color: #F5F5F5;
	padding: 5px;
}

#tablebtn {
	border: none;
}

#oktable {
	border: none;
}
</style>



<title>FreetableDetail</title>
</head>

<body>
	<!-- <div id="header"> -->
	<%-- 	<%@ include file="Form/Header.jsp"%> --%>	
	<!-- </div> -->
	
	<!-- 점보트론 -->
	<div class="py-5"
		style="background-image: url('images/nori.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-gray-dark" align="left">
						<b>자유게시판</b></h1>
					<br />
					<h4 align="left">
						<b>&nbsp;</b>
					</h4>
					<br />
					<br />
					<br />
					<br />
				</div>
			</div>
		</div>
	</div>
	
	<br />
	<div class="content">
		<div id="DetailForm">
			<br>
			<div class="title" align="center">
			<h2><b>상세글 보기</b></h2>
			</div>
			<br>		
			<form action="delete.do" method="get">
			<input type="hidden" name="freetable_no" value="${detail.freetable_no }">
				<table border="1" id="table1" width="80%";>
					<colgroup>
						<col width="20%">
						<col width="60%">
					</colgroup>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="freetable_id" style='border: none' 
						readonly="readonly" value="${detail.freetable_id }"/></td>
					</tr>
										
					<tr>
						<th id="titleth">제목</th>
						<td><input type="text" name="freetable_title" style='border: none' 
						readonly="readonly" value="${detail.freetable_title}"/></td>
					</tr>
					
					
					<tr>
						<th id="titleth">내용</th>
						<td><textarea  name="freetable_content" id="freetable_content" 
						rows="10" style='border: none'  readonly="readonly">${detail.freetable_content }</textarea>
						<script>CKEDITOR.instances.freetable_content.getDATA(freetable_content);</script></td>
					</tr>
					</table>
					<br>
					<table id="tablebtn">
					<tr>
						<td colspan="2" align="right">
						<input type="button" value="답글"	onclick="FreetableReply();"> 
						<input type="button"value="목록" onclick="location.href='board.do?nowPage=1'"> 
						
						<c:if test="${dto.member_id ==detail.freetable_id }">
							<input	type="button" value="수정" onclick="FreetableUpdate();"> 
							<input	type="submit" value="삭제"></td>
						</c:if>
						
<%-- 					 <c:if test="${dto.member_role eq'ADMIN' }"> --%>
<!-- 						 <input type="submit" value="삭제">  -->
<%--                	 </c:if> --%>	
				
					</tr>
				</table>
			</form><br><br><br>
			
<!-- 댓글입력  -->			
			<form action="commInsert.do" method="get">
			<input type="hidden" name="freetable_no" value="${detail.freetable_no }">
			<input type="hidden" name="member_id" value="${dto.member_id }">
			
				<table id="tablebtn">
				<colgroup>
					<col width="10%">
					<col width="65%">
					<col width="5%">
				</colgroup>				
					<tr>
						<th align="center">댓글</th>
						<td colspan="3"><textarea rows="2"   name="freecomm_content"></textarea></td>
						<td align="center"><input type="submit" value="등록"></td>
					</tr>
				</table>
			</form><br>		
			

<!--댓글결과 -->			
			<table>
				<colgroup>
					<col width="20%">
					<col width="50%">
					<col width="15%">
					<col width="10%">
				</colgroup>
					<tr >
						<th>작성자</th>
						<th>내용</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4" align="center">-----댓글이 없습니다----</td>
						</tr>
					</c:when>
					<c:otherwise>			
						<c:forEach items="${list}" var="list">
							<tr>
								<td align="center">${list.freecomm_id }</td>
								<td align="left" style="padding-left:10%">
							<c:forEach begin="1" end="${list.freecomm_titleTab }">
								 &nbsp;RE:
					        </c:forEach> 
						    	    <a href="commReForm.do?freetable_no=${list.freetable_no}
										&freecomm_id=${list.freecomm_id}&freecomm_no=${list.freecomm_no}
										&freecomm_groupNo=${list.freecomm_groupNo}
										&freecomm_step=${list.freecomm_step}"> ${list.freecomm_content}</a></td>
								<td align="center">${list.freecomm_regDate }</td>			
							<c:if test="${dto.member_id ==detail.freetable_id }">
								<td align="center">
								<input type="button" value="삭제"  style="font-size:13px"
									onclick="location.href='delReply.do?freecomm_no=${list.freecomm_no}&freetable_no=${list.freetable_no}'"></td>
							</c:if>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>


	



		<div id="UpdateForm">
			<br>
			<div class="title" align="center">
			<h2><b>글 수정</b></h2>
			</div>
			<br>
			<form action="update.do" method="post">
				<input type="hidden" name="freetable_no" value="${detail.freetable_no }">
				<table>
					<col width="100">
					<col width="670">
					<tr>
						<th>작성자</th>
						<td><input type="text" name="freetable_id" style='border: none' 
						readonly="readonly" value="${detail.freetable_id }"/></td>
					</tr>

					<tr>
						<th>제목</th>
						<td>
						<input type="text"	name="freetable_title"  value="${detail.freetable_title }">
						</td>
					</tr>

					<tr>
						<th>내용</th>
						<td><textarea name="freetable_content" style="border-color: gray"  rows="10" cols="100" >${detail.freetable_content }</textarea></td>
					</tr>
			</table><br>
			<table id="oktable">
					<tr >
						<td colspan="2" align="right">
						<input type="submit"  value="수정완료"> 
						<input type="button"  value="취소"
							onclick="FreetableDetail();" /></td>
					</tr>
				</table>
			</form>
		</div>





		<div id="ReplyForm">
		    <br>
			<div class="title" align="center">
			<h2><b>답글 달기</b></h2>
			</div>
			<br>
			<form action="insertReply.do" method="get">
				<input type="hidden" name="freetable_no" value="${detail.freetable_no }">
				<table align="center">
					<col width="100">
					<col width="670">

					<tr>
						<th id="titleth">작성자</th>
						<td style="border: 1px gray solid;">
						<input type="text"	style='border: none' readonly="readonly" name="freetable_id"
							value="${dto.member_id }"></td>
					</tr>

					<tr>
						<th id="titleth">제목</th>
						<td style="border: 1px gray solid;"><input type="text"
							name="freetable_title" value="RE:${detail.freetable_title}"></td>
					</tr>

					<tr>
						<th id="titleth">내용</th>
						<td><textarea rows="10" cols="100" name="freetable_content"> ${detail.freetable_content }</textarea></td>
					</tr>

					<tr>
						<td colspan="2" align="right"><input type="submit" value="완료">
							<input type="button" value="취소" onclick="FreetableDetail()" /></td>
					</tr>
				</table>
			</form>
		</div>
	 </div>

<!-- 	<div id="footer"> -->
<%-- 	<%@ include file="Form/Footer.jsp"%> --%>
<!--    </div> -->
</body>
</html>