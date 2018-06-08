$(function(){
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
		$("thead").append(
			"<tr><th>"+"강의ID"+"</th>"+
		     	"<th>"+"강의명"+"</th>"+
				"<th>"+"신청시작일"+"</th>"+
				"<th>"+"신청종료일"+"</th>"+
				"<th>"+"교육시작일"+"</th>"+
				"<th>"+"교육종료일"+"</th>"+
				"<th>"+"정원"+"</th>"+
				"<th>"+"수강신청 URL"+"</th></tr>"
				);
		}else{
			//key= DATA
			//DATA에 들어가 있는 value는 배열
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
						"<td>" + str.course_apply_url + "</td>" +
						
						//controller로 넘기기 위한 hidden type의 input
						"<input type='hidden' name='eduoff' value='"+
						str.course_id+"/"+
						str.course_nm+"/"+
						str.course_request_str_dt+"/"+
						str.course_request_end_dt+"/"+
						str.course_str_dt+"/"+
						str.course_end_dt+"/"+
						str.capacity+"/"+
						str.course_apply_url+"'/> </tr>"
					);
				}	
			}
	 	}) 
 	} 
 );
 }