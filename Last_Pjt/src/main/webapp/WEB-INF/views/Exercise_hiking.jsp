<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등산로</title>

<script type="text/javascript">

function test3(){
			
	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.forest.go.kr/openapi/service/cultureInfoService/gdTrailInfoOpenAPI'; /*URL*/
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'lgVtVTsJEuXKfNpq8RSVgdwFIDbku065dngPfBYOMYz4KauXQuCilV9aVwqZ2m2Z8kc9eGxiXmCY7zAWkV4m%2Bg%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('searchArNm') + '=' + encodeURIComponent('강원'); /*2619990400*/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	    	alert(xhr);
	    	//document.getElementByTagName("items").innerHTML=this.responseText;
			
	        alert('Status: '+this.status+' Headers: '+JSON.stringify(this.getAllResponseHeaders())+' Body: '+this.responseText);
	    }
	};

	xhr.send('');
	}
	
function testtest(){
	
	var queryParams = 'http://openapi.forest.go.kr/openapi/service/cultureInfoService/gdTrailInfoOpenAPI'+'?ServiceKey='+'lgVtVTsJEuXKfNpq8RSVgdwFIDbku065dngPfBYOMYz4KauXQuCilV9aVwqZ2m2Z8kc9eGxiXmCY7zAWkV4m%2Bg%3D%3D'; /*Service Key*/
	queryParams += '&searchArNm=' + '강원';
	alert(queryParams);
	
$.ajax({
	url : queryParams,
	success: function (api) {
         alert("URL 파일 접근이 가능합니다.");
    },
    error: function (request,status,error) {
         alert("다시 시도"+"code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
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
        
        <div class="col-md-12" style="margin:0 auto;">
		<img alt="등산" src="http://admin.brainworld.com/Library/FileDown.aspx?filename=sshutterstock_111970076.jpg&filepath=BrainHealth" width="800px;" height="600px;" style="border:2px solid black; margin:0 auto;"><br/><br/><br/>
	</div>

<div>
<input type="text" class="form-control" id="searchArNm" placeholder="ex)제주, 서울" style="width:200px; "/>
</div>
<button onclick="test3();" class="btn btn-dark" >abc</button>
<button onclick="testtest();" class="btn btn-dark" >검색</button>
<a href="http://openapi.forest.go.kr/openapi/service/cultureInfoService/gdTrailInfoOpenAPI?ServiceKey=lgVtVTsJEuXKfNpq8RSVgdwFIDbku065dngPfBYOMYz4KauXQuCilV9aVwqZ2m2Z8kc9eGxiXmCY7zAWkV4m%2Bg%3D%3D&searchArNm=제주">click</a>


 
	<c:choose>
		<c:when test="${empty hiking }">
			<h3>******회원정보가 없습니다.*******</h3>
		</c:when>
		      <c:otherwise>
					<c:forEach items="${requestScope.hiking }" var="hiking">
						<tr>
							<td>${hiking }</td>
						</tr>
					</c:forEach>
				</c:otherwise>	
	</c:choose>	

<%@ include file="bootstrap.jsp" %>
</body>
</html>