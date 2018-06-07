<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화행사</title>
<script type="text/javascript">
function testtest(){

	$.getJSON('json/seoul.json',function(data) {
		alert("test");
	    $.each(data, function(key,state) {
	        if(key=="DESCRIPTION"){
	        	$("body").append(data);
	        }
	    });
	});
	
	}
</script>
</head>
<body>
<div class="py-3 bg-dark" >
 <div class="col-md-20" draggable="true" >
          <div class="btn-group" >
          <a href="#" class="btn btn-lg mx-1 btn-dark">HOME</a>
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
              <a class="dropdown-item" href="#">문화행사</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">도서관</a>
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
			<img alt="문화행사" src="http://tour.busan.go.kr/upload_data/manage_img//139658027137712.jpg" width="400px;" height="300px;" style="border: 2px solid black; float: left;">
			<img alt="문화행사" src="http://art.boseong.go.kr/theme/bsart/img/sub0301_img01.jpg" width="400px;" height="300px;" style="border: 2px solid black; float: right;"><br />
			<br />
			<br />
		</div>
		
		<button onclick="testtest();" class="btn btn-dark" >test</button>
		
		</div>
		
		<div id="dictionary">
      </div>



		<%@ include file="bootstrap.jsp"%>
</body>
</html>