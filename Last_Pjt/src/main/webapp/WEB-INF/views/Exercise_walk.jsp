<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://v40.pingendo.com/assets/4.0.0/default/theme.css" type="text/css">

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
        	var lead_time = "<h4 " + $(this).find("LEAD_TIME").text()+"</h4>";
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
          <a class="btn btn-primary" href="#">HOME</a>
          <a class="btn btn-primary" href="NoticeBoard_list.do">공지사항</a>
          <div class="btn-group">
            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> 교육</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">온라인</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">오프라인</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> 운동</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="Exercise_walk.do">걷기</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Exercise_hiking.do">등산</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">음식</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">건강식단</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">맛집</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> 여가</button>
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
          <a class="btn btn-primary" href="#">자유게시판</a>
        </div>
      </div>
    </div>
  </div>

<h3>걷기 게시판</h3><br/>
<div>
<button class="btn btn-primary" onclick="location.href='index.jsp'">메인</button>
<button class="btn btn-primary" onclick="location.href='NoticeBoard_list.do'">공지사항 </button>
<br/><br/><br/>
</div>
<div class="col-md-12">
		<img alt="둘레길" src="https://t1.daumcdn.net/cfile/tistory/252531355791A62307"><br/><br/><br/>
		</div>
<div class="container">
	
		<h3>코스 검색</h3><br/><br/><br/>
		<form class="form-inline m-0" method="post">
			<label for="se01" class="label01" class="form-control">유형별</label>
			<select id="select" class="form-control" onchange="window.location.href=this.value;">
				<option value="http://map.seoul.go.kr/smgis/short.jsp?p=6LBTL">서울둘레길</option>
				<option value="http://map.seoul.go.kr/smgis/short.jsp?p=6LARf">근교산자락길</option>
				<option value="http://seoulcitywall.seoul.go.kr/front/kor/sub01/course_all.do">한양도성길</option>
				<option value="http://map.seoul.go.kr/smgis/short.jsp?p=6LFiq">서울 봄꽃길</option>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="south_north_div" class="label01" class="form-control">지 역 별</label>
						<select id="south_north_div" name="south_north_div" title="지역 검색" onchange="changeArea(this.value); return false;" class="form-control">
							<option value="1">전체</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label for="AREA_GU" class="blind">지역별</label>
						<select id="AREA_GU" name="AREA_GU" title="구 검색" class="form-control">
							<option value="1호선">1호선</option>
							<option value="2호선">2호선</option>
							<option value="3호선">3호선</option>
							<option value="4호선">4호선</option>
							<option value="5호선">5호선</option>
							<option value="6호선">6호선</option>
							<option value="7호선">7호선</option>
							<option value="8호선">8호선</option>
							<option value="9호선">9호선</option>
							<option value="경춘선">경춘선</option>
							<option value="중앙선">중앙선</option>
							<option value="인천선">인천선</option>
							<option value="경의선">경의선</option>
							<option value="분당선">분당선</option>
							<option value="신분당선">신분당선</option>
							<option value="공항철도">공항철도</option>
							<option value="인천선">인천선</option>
							<option value="수인선">수인선</option>
							<option value="의정부">의정부</option>
						</select>
						</form><br/><br/><br/>
						<div class="div-inline m-0">
						<label for="course_name">상세 검색</label><br/>
						<input class="form-control" id="searchAPI" placeholder="ex)관악산,도림천길"/>
						<br/>
						<button onclick="test1();" class="btn btn-primary" >검색</button>
					</div>
				</div><br/><br/><br/>
	<table id="apiList" border="1">

	</table>
	<br/><br/><br/>
<%@ include file="bootstrap.jsp" %>
</body>
</html>