<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function searchLoc() {
	
		
		//여러번 눌렀을때 계속생기는것 방지
		$("thead").empty();
		$("tbody").empty();
		$("caption").empty();
		
		//검색어
		var location = $("#location").val();
		

		$.ajax({
			url : "#" + location,
			type : "post",

			success : function(data) {
				var temp = $trim(data);
				var obj = JSON.parse(temp);
				$.each(obj,	function(key,val) {
					if(key=="count"){
						$("caption").append(
						"<span>총 "+val+" 곳이 있습니다."+"</span>"		
						)
						if(val==0){
							$("thead").append("<tr><th>"+"다시 검색해 주세요"+"</th></tr>")
						}else{
							$("thead").append(
									"<tr><th>"+"강의ID"+"</th>"+
									"<th>"+"강의명"+"</th>"+
									"<th>"+"신청시작일"+"</th>"+
									"<th>"+"신청종료일"+"</th>"+
									"<th>"+"교육시작일"+"</th>"+
									"<th>"+"교육종료일"+"</th>"+
									"<th>"+"정원"+"</th>"+
									"<th>"+"수강신청 URL"+"</th></tr>")
								}
							}
					
					if(key=="DATA"){
						var list= val;
						for(var i=0;i<list.length;i++){
							var str=list[i];
						
							$("tbody").append(
								    "<tr><td>" + course_id + "</td>" + 
										"<td>" + course_nm + "</td>" +
										"<td>" + course_request_str_dt + "</td>" + 
										"<td>" + course_request_end_dt+ "</td>" + 
										"<td>" + course_str_dt + "</td>" + 
										"<td>" + course_end_dt+ "</td>" +
										"<td>" + capacity + "</td>" + 
										"<td>" + course_apply_url + "</td></tr>")
								}
							}
						})
					},
					error : function() {
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
			<div>
				<table>
					<caption></caption>
					<thead></thead>
					<tbody></tbody>
				</table>
			</div>
		</div>
	</div>


</body>
</html>