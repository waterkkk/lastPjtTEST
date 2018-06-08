<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화행사</title>
<script type="text/javascript" src="reseources/json/seoul.json"></script>
<script type="text/javascript">

	function testtest(){
		
			   $.getJSON("./resources/json/seoul.json",function(data) {
			      alert(data);
			      var abc = "";
			      $.each(data, function(key,val) {
			         if (key=="DESCRIPTION") {
			            $("#apiList").attr("border","1");
			            $("thead").append(
								"<tr><th>"+val.CODENAME+"</th>"+
								"<th>"+val.TITLE+"</th>"+
								"<th>시작일~종료일</th>"+
								"<th>링크</th>"+
								"<th>"+val.PLACE+"</th>"+
								"<th>지역</th>"+
								"<th>"+val.USE_TRGT+"</th>"+
								"<th>"+val.USE_FEE+"</th>"+
								"<th>이미지</th></tr>"
			            );
			            }else{
			            	var list = val;
			            	var abc = $("#searchAPI").val();
			            	for(var i = 0; i < list.length; i++){
			            		var str = list[i];
			            		if (abc==str.codename) {
			            		$("tbody").append(
										"<tr><td>"+str.codename+"</td>"+
										"<td>"+str.title+"</td>"+
										"<td>"+str.strtdate+"~"+ str.end_date+"</td>"+
										"<td><a href="+"'"+str.org_link+"'>site</a></td>"+
										"<td>"+str.place+"</td>"+
										"<td>"+str.gcode+"</td>"+
										"<td>"+str.use_trgt+"</td>"+
										"<td>"+str.use_fee+"</td>"+
										"<td><img src= "+str.main_img+" width=" +"300px;" +"height="+"200px;"+"></td></tr>"
								);
			            	}
			            }
			            }
			         });
			      });
		
		/* $.ajax({      
	    	url: "http://openapi.seoul.go.kr:8088/744d6c4744737765313131446e414771/xml/SearchConcertDetailService/1/99/",
	   		type: "get",
	   		dataType: "html",
	   		success:function(api){
	    		alert("성공"); 
	    	 /* 	$("body").append(api);   */
	    	/* $(api).find("row").each(function(){
	        	var codename =  $(this).find("CODENAME").text() +"<br/>";
	        	var title =  $(this).find("TITLE").text()+"<br/>";
	        	var strtdate = "<p><span style=&quot;font-size: 14px;&quot;> ○ 시작 날짜 : " + $(this).find("STRTDATE").text()+"</span></p>";
	        	var end_date = $(this).find("END_DATE").text()+"<br/>";
	        	var time = $(this).find("TIME").text()+"<br/>";
	        	var gcode = $(this).find("GCODE").text()+"<br/>";
	        	var org_link = $(this).find("ORG_LINK").text()+"<br/>";
	        	var main_img = "<img src= "+ $(this).find("MAIN_IMG").text()+" width=" +"400px;" +"height="+"300px;"+">";
	         	var use_fee = "<h4> 이용요금 : " + $(this).find("USE_FEE").text()+"</h4>";
	        	var contents = "<h4> 내용 : " + $(this).find("CONTENTS").text()+"</h4>"; 
	        	var out = codename + title + strtdate + end_date + time + gcode+ org_link + main_img + use_fee + contents;
	        	$("#apiList").append(out);
	    	});
		},		
	/* 	error:function(){							
			alert("실패"); 
			}
		}); */ 
	}

</script>
</head>
<body>
<div class="py-3 bg-dark" >
 <div class="col-md-20" draggable="true" >
          <div class="btn-group" >
          <a href="index.jsp" class="btn btn-lg mx-1 btn-dark">HOME</a>
          <a href="NoticeBoard_list.do" class="btn btn-lg mx-1 btn-dark">공지사항</a>
          <div class="btn-group">
            <button class="btn btn-lg mx-1 btn-dark" data-toggle="dropdown">교육</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">온라인</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">오프라인</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-lg mx-1 btn-dark dropdown-toggle" data-toggle="dropdown">운동</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="Exercise_walk.do">걷기</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Exercise_hiking.do">등산</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-lg mx-1 btn-dark dropdown-toggle" data-toggle="dropdown">음식</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">건강식단</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">맛집</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-lg mx-1 btn-dark dropdown-toggle" data-toggle="dropdown">여가</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="Freetime_Culture.do">문화행사</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Freetime_Library.do">도서관</a>
           <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">공원</a>
            <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">노인교실/경로당</a>
            </div>
          </div>
          <div class="btn-group">
            <a href="#" class="btn btn-lg mx-1 btn-dark">자유게시판</a>
          </div>
        </div>
        </div>
        </div><br/><br/><br/>

	<div class="container">
		<div class="col-md-12" style="margin: 0 auto;">
			<img alt="미술관" src="http://tour.busan.go.kr/upload_data/manage_img//139658027137712.jpg" width="400px;" height="300px;" style="border: 2px solid black; float: left;">
			<img alt="공연장" src="http://art.boseong.go.kr/theme/bsart/img/sub0301_img01.jpg" width="400px;" height="300px;" style="border: 2px solid black; float: center;"><br />
			<br />
			<br />
		</div>
		</div><br/><br/>
		<div class="container">
		<select class="form-control" id="searchAPI" style="width: 150px;">
		<option value="영화">영화</option>
		<option value="기타">기타</option>
		<option value="연극">연극</option>
		<option value="콘서트">콘서트</option>
		<option value="문화교양/강좌">문화교양/강좌</option>
		<option value="독주/독창회">독주/독창회</option>
		<option value="전시/미술">전시/미술</option>
		<option value="무용">무용</option>
		<option value="국악">국악</option>
		<option value="뮤지컬/오페라">뮤지컬/오페라</option>
		<option value="축제">축제</option>
		<option value="문화·예술 ">문화·예술 </option>
		</select>
		<button onclick="testtest();" class="btn btn-dark" >test</button>
		</div><br />
		
     <div class="container">			
	<table id="apiList" border="1">
		<thead></thead>
		<tbody></tbody>
	</table>
	</div>	

		<%@ include file="bootstrap.jsp"%>
</body>
</html>