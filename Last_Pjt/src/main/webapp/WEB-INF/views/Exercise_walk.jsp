<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 

<title>걷기게시판</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

* {
	font-family: 'Nanum Gothic Coding';
 	text-align: center; 
}

</style>
<script type="text/javascript">

function test1(){
	var searchAPI = $("#searchAPI").val();
			alert(searchAPI);
			
	$.ajax({        
        url: "http://openapi.seoul.go.kr:8088/427958685873776539364e63494a53/xml/SeoulGilWalkCourse/1/5/"+searchAPI,
        type: "get",
        dataType: "html",
        success:function(api){
        	alert("성공"); 
        /* 	$("body").append(api); */  
        $(api).find("row").each(function(){
        	var course_category_nm = " <h4> " + $(this).find("COURSE_CATEGORY_NM").text()+"</h4>";
        	var course_name = " <h4> " + $(this).find("COURSE_NAME").text()+"</h4>";
        	var detail_course = "<h4>" + $(this).find("DETAIL_COURSE").text()+"</h4>";
        	var cpi_name = "<h4>" + $(this).find("CPI_NAME").text()+"</h4>";
        	var area_gu = "<h4>" + $(this).find("AREA_GU").text()+"</h4>";
        	var distance = "<h4>" + $(this).find("DISTANCE").text()+"</h4>";
        	var lead_time = "<h4> " + $(this).find("LEAD_TIME").text()+"</h4>";
        	var course_level = "<h4>" + $(this).find("COURSE_LEVEL").text()+"</h4>";
        	var traffic_info = "<h4>" + $(this).find("TRAFFIC_INFO").text()+"</h4>";
        	var content = "<h4> " + $(this).find("CONTENT").text()+"</h4>";
        	var out = course_category_nm + course_name + detail_course + cpi_name + area_gu + distance + lead_time + course_level + traffic_info + content;
        	$("#apiList").append("<tr><th>유형</th><th>코스</th><th>상세코스</th><th>주요지점</th><th>지역</th><th>거리</th><th>소요시간</th><th>난이도</th><th>교통</th><th>설명</th></tr><tr><td>" + course_category_nm +"</td><td> " +  course_name +"</td><td> "+ detail_course +"</td><td> " + cpi_name +"</td><td> " + area_gu +"</td><td> " + distance +"</td><td> " + lead_time + "</td><td> " + course_level +"</td><td> " + traffic_info +"</td><td> " + content + "</td></tr>");
        });
	},		
		error:function(){								
			alert("실패"); 
	}
});
	}
	
$("select").click(function() {
	  var select = $(this).data("isLoad");
	  if(select) {
	    window.location.href = $(this).val()
	  }
	  //set isopen to opposite so next time when use clicked select box
	  //it wont trigger this event
	  $(this).data("isLoad", !select);
	});
</script>
</head>
<body>
  <div class="py-5" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <a class="btn btn-dark" href="index.jsp">HOME</a>
          <a class="btn btn-dark" href="NoticeBoard_list.do">공지사항</a>
          <div class="btn-group">
            <button class="btn btn-dark dropdown-toggle" data-toggle="dropdown"> 교육</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">온라인</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">오프라인</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-dark dropdown-toggle" data-toggle="dropdown"> 운동</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="Exercise_search.do">길찾기</a>
               <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Exercise_walk.do">걷기</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Exercise_hiking.do">등산</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-dark dropdown-toggle" data-toggle="dropdown">음식</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">건강식단</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">맛집</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-dark dropdown-toggle" data-toggle="dropdown"> 여가</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">문화행사</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">도서관</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">공원</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">노인교실/경로당</a>
            </div>
          </div>
          <a class="btn btn-dark" href="#">자유게시판</a>
        </div>
      </div>
    </div>
  </div><br/><br/><br/>
<br/><br/><br/><br/><br/>
	<div class="col-md-12" >
		<img alt="둘레길" src="https://t1.daumcdn.net/cfile/tistory/252531355791A62307" width="800px;" height="600px;" style="border:2px solid black; margin:0 auto;"><br/><br/><br/>
	</div>
<div class="container">
		<h3>코스 검색</h3><br/><br/><br/><br/><br/>
		<form class="form-inline m-0" method="post">
			<label for="se01" class="label01" class="form-control">유형별</label>&nbsp;&nbsp;
			<select id="select" class="form-control" onchange="window.location.href=this.value;">
				<option value="http://map.seoul.go.kr/smgis/short.jsp?p=6LBTL">서울둘레길</option>
				<option value="http://map.seoul.go.kr/smgis/short.jsp?p=6LARf">근교산자락길</option>
				<option value="http://seoulcitywall.seoul.go.kr/front/kor/sub01/course_all.do">한양도성길</option>
				<option value="http://map.seoul.go.kr/smgis/short.jsp?p=6LFiq">서울 봄꽃길</option>
					</select> 
						</form>
					<div style="float: right;">
						<label for="course_name">상세 검색</label>
						<input type="text" class="form-control" id="searchAPI" placeholder="ex)관악산, 도림천길" style="width:200px; "/>
						<button onclick="test1();" class="btn btn-dark" >검색</button>
					</div><br/><br/><br/>
					</div>
					
					
	<div class="container">			
	<table id="apiList" border="1">
	</table>
	</div>	
	<br/><br/><br/>
<%@ include file="bootstrap.jsp" %>
</body>
</html>