


function searchLoc(){
	
	function searchAddr() {
//		//여러번 눌렀을때 계속해서 생기는것을 방지
//		$("thead").empty();
//		$("tbody").empty();
//		$("caption").empty();
//		var location = $("#location").val();
//		$.ajax({
//			url : "json/eduoff.json",
//			method : "post",
//			/* dataType : "text", */
//			success : function(data) {
//			  var temp = $.trim(data);
//			  var obj = JSON.parse(temp);
//                 //키에 대한 값을 사용하기위해
//			   $.each(obj,function(key, val) {	
//				   //키가 count인 것을 사용
//				   if (key=="count") {
//					$("caption").append(
//							"<span>총 "+val+" 곳이 있습니다."+"</span>"		
//							)
//							if (val==0) {
//								$("thead").append(
//										"<tr><th>"+"다시 검색해 주세요"+ "</th></tr>")
//							}else{
//								$("thead").append(
//										"<tr><th>"+val.COURSE_ID+"</th>"+
//								     	"<th>"+val.COURSE_NM +"</th>"+
//										"<th>"+val.COURSE_REQUEST_STR_DT+"</th>"+
//										"<th>"+val.COURSE_REQUEST_END_DT+"</th>"+
//										"<th>"+val.COURSE_STR_DT+"</th>"+
//										"<th>"+val.COURSE_END_DT+"</th>"+
//										"<th>"+val.CAPACITY+"</th>"+
//										"<th>"+val.COURSE_APPLY_URL+"</th></tr>")
//							}
//						}
//				   //키가 DATA인 값들을 사용
//					if (key == "DATA") {
//						var list = val;
//						for (var i = 0; i < list.length; i++) {
//						  var str = list[i];
//                            $("tbody").append(
//                            		"<tr><td>" + str.course_id + "</td>" + 
//        							"<td>" + str.course_nm + "</td>" +
//        							"<td>" + str.course_request_str_dt + "</td>" + 
//        							"<td>" + str.course_request_end_dt+ "</td>" + 
//        							"<td>" + str.course_str_dt + "</td>" + 
//        							"<td>" + str.course_end_dt+ "</td>" +
//        							"<td>" + str.capacity + "</td>" + 
//        							"<td>" + str.course_apply_url + "</td></tr>")
//							}
//									
//				        	}
//
//				        })
//					},
//					error : function() {
//						alert("다시 입력해주세요");
//					}
//				})
//	 		}
//	
	
	
	
	//검색어
	var keyword = $("#keyword").val();
	//눌렀을때 계속생기는거 방지
	$("tbody").children().remove();
	
	$.ajax({
		url : "json/eduoff.json"+keyword,
		type : "GET",
		dataType : "json",
		success : function(data) {
			//data에서 각각의 row를 찾고
			$(data).find("row").each(function(){
		//그 각각의 row들에서 항목을 찾아서 넣어준다

				var course_id=$(this).find("COURSE_ID").text();
				var course_nm=$(this).find("COURSE_NM").text();
				var course_request_str_dt=$(this).find("COURSE_REQUEST_STR_DT").text();
				var course_request_end_dt=$(this).find("COURSE_REQUEST_END_DT").text();
				var course_str_dt=$(this).find("COURSE_STR_DT").text();
				var course_end_dt=$(this).find("COURSE_END_DT").text();
				var capacity=$(this).find("CAPACITY").text();
				var course_apply_url=$(this).find("COURSE_APPLY_URL").text();

				
					$("tbody").append(
							 "<tr><td>" + course_id + "</td>" + 
								"<td>" + course_nm + "</td>" +
								"<td>" + course_request_str_dt + "</td>" + 
								"<td>" + course_request_end_dt+ "</td>" + 
								"<td>" + course_str_dt + "</td>" + 
								"<td>" + course_end_dt+ "</td>" +
								"<td>" + capacity + "</td>" + 
								"<td>" + course_apply_url + "</td></tr>")
						
									})		
		},
		error : function() {
			alert("정보를 불러오는데 실패하였습니다.");
			}
		})
	}	
}
