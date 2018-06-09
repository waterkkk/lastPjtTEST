$(function() {
	getJson();
})

function getJson(){
	
	 $.getJSON("json/eduoff.json",function(data){
		 $.each(data,function(key, val){
		 /*
		  eduoff.json 파일에는 DESCRIPTION과 DATA의 두가지 KEY
		     가 있고, DESCRIPTION 안에는 설명이, DATA 안에는 실제 
		     데이터가 들어가 있다.
		 */
			 
		 //DESCRIPTION이라는 KEY안에 있는 VALUE명을 TABLE의 컬럼명으로 만들어 준다. 
		if(key=="DESCRIPTION"){
			$("table").attr("border","1");
			//thead 아래 값을 string 배열 방식으로 추가.
			$("thead").append(
				"<tr><th>"+val.COURSE_ID+"</th>"+
			     	"<th>"+val.COURSE_NM +"</th>"+
					"<th>"+val.COURSE_REQUEST_STR_DT+"</th>"+
					"<th>"+val.COURSE_REQUEST_END_DT+"</th>"+
					"<th>"+val.COURSE_STR_DT+"</th>"+
					"<th>"+val.COURSE_END_DT+"</th>"+
					"<th>"+val.CAPACITY+"</th>"+
					"<th>"+val.COURSE_APPLY_URL+"</th></tr>"
					);
			}else{
				//key= DATA
				//tbody에는 string 배열 방식 값을 한줄씩 추가.	
				var list=val;
			for(var i=0; i<list.length; i++){
				var str = list[i];
				$("tbody").append(
					    "<tr><td>" + str.course_id + "</td>" + 
							"<td>" + str.course_nm + "</td>" +
							"<td>" + str.course_request_str_dt + "</td>" + 
							"<td>" + str.course_request_end_dt+ "</td>" + 
							"<td>" + str.course_str_dt + "</td>" + 
							"<td>" + str.course_end_dt+ "</td>" +
							"<td>" + str.capacity + "</td>" + 
							"<td>" + str.course_apply_url + "</td></tr>"
						);
					}	
				}
		 	}); 
	 	}); 
    }
