<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function searchLoc(){
	//검색어
	var location=$("#location").val();
	$("tbody").children().remove();//눌렀을때 계속생기는거 방지
	
	$.ajax({
		url:"http://openAPI.seoul.go.kr:8088/57676e5a6f616861313234686b6c7467/xml/OfflineCourse/1/5" + location,
		type: "GET",
		dataType: "xml",
		success: function(data){
			//data에서 각각의 row를 찾고
			$(data).find("row").each(function(){
			//각각의 row들에서 항목들을 찾아서 넣어준다. 
			var course_id=$(this).find("COURSE_ID").text();
			var course_nm=$(this).find("COURSE_NM").text();
			var course_request_str_dt=$(this).find("COURSE_REQUEST_STR_DT").text();
			var course_request_end_dt=$(this).find("COURSE_REQUEST_END_DT").text();
			var course_str_dt=$(this).find("COURSE_STR_DT").text();
			var course_end_dt=$(this).find("COURSE_END_DT").text();
			var capacity=$(this).find("CAPACITY").text();
			var course_apply_url=$(this).find("COURSE_APPLY_URL").text();
			
			$("tbody").append(
			"<tr><td>"+course_id+"</td>"+
			"<td>"+course_nm+"</td>"+
			"<td>"+course_request_str_dt+"</td>"+
			"<td>"+course_request_end_dt+"</td>"+
			"<td>"+course_str_dt+"</td>"+
			"<td>"+course_end_dt+"</td>"+
			"<td>"+capacity+"</td>"+
			"<td>"+course_apply_url+"</td></tr>")			
			})
		},
		error: function(){
			alert("정보를 불러오는 데 실패하였습니다. 다시 시도해 주세요.");
		}
	})	
}
</script>


<body>

<div class="content">
	<div align="center">
		<p>검색결과</p>
		<input id="location" placeholder="ex)중구">
		<button id="search" onclick="searchLoc();">검색</button>
	</div>

	<div align="center">
		<form>
			<table>
				<thead id="menubar"></thead>
				<tbody></tbody>
			</table>
		</form>
	</div>
</div>

	
</body>
</html>