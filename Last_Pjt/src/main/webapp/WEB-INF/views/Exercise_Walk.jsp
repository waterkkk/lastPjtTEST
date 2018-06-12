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
}

p{
 text-align: center;"
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="https://v40.pingendo.com/assets/4.0.0/default/theme.css" type="text/css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function test1(){
	var searchAPI = $("#searchAPI").val();
			alert(searchAPI);
			
	$.ajax({
        url: "http://openapi.seoul.go.kr:8088/427958685873776539364e63494a53/xml/SeoulGilWalkCourse/1/5/"+searchAPI,
        type: "get",
        dataType: "html",
        success:function(api){
        /* 	$("body").append(api); */  
        $(api).find("row").each(function(){
        	var course_name = $(this).find("COURSE_NAME").text();
        	var detail_course =  $(this).find("DETAIL_COURSE").text();
        	var area_gu =  $(this).find("AREA_GU").text();
        	var distance = $(this).find("DISTANCE").text();
        	var lead_time = $(this).find("LEAD_TIME").text();
        	var course_level =  $(this).find("COURSE_LEVEL").text();
        	var traffic_info = $(this).find("TRAFFIC_INFO").text();
        	var content = $(this).find("CONTENT").text()+"</h4>";
        	var out = course_name + detail_course + area_gu + distance + lead_time + course_level + traffic_info + content;
        	$("#apiList").append("<tr><th>코스</th><th>상세코스</th><th>지역</th><th>거리</th><th>소요시간</th><th>난이도</th><th>교통</th><th>설명</th></tr><br/><tr><td> " +  course_name +"</td><td> "+ detail_course +"</td><td> " + area_gu +"</td><td> " + distance +"</td><td> " + lead_time + "</td><td> " + course_level +"</td><td><br/> " + traffic_info +"<br/></td><td><br/> " + content + "</td></tr><br/>");
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
              <a class="dropdown-item" href="Freetime_Culture.do">문화행사</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Freetime_Library.do">도서관</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Freetime_Park.do">공원</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Freetime_Center.do">노인교실/경로당</a>
            </div>
          </div>
          <a class="btn btn-dark" href="#">자유게시판</a>
        </div>
      </div>
    </div>
    
       <div class="py-5 text-white" style="background-image: url(&quot;https://www.splitshire.com/wp-content/uploads/2017/08/SplitShire-04295.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-gray-dark">걷기</h1>
          <h4></h4><br/><br/><br/><br/><br/>
        </div>
      </div>
    </div>
  </div>
    
  </div><br/><br/><br/>
	<div class="col-md-12" >
		<p><img alt="둘레길" src="https://t1.daumcdn.net/cfile/tistory/252531355791A62307" width="800px;" height="600px;" style="border:2px solid black; margin:0 auto;"><br/><br/><br/>
	<a class="btn btn-dark" href="Exercise_Search.do">길찾기</a></p>
	</div> <br/><br/><br/>
<div class="container">
		<h3>코스 검색</h3><br/>
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
						<input type="text" class="form-control" id="searchAPI" placeholder="ex) 관악산, 안양천" style="width:200px;"/>
						<button onclick="test1();" class="btn btn-dark" >검색</button>
					</div><br/><br/><br/>
					</div><br/><br/>
					
					
	<div class="container">			
	<table id="apiList" border="1">
	</table>
	</div>	
	<br/><br/><br/>
<%@ include file="bootstrap.jsp" %>
</body>
</html>