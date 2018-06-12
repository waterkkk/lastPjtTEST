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
<style type="text/css">
* {
	font-family: 'Nanum Gothic Coding';
}

input{
text-align: center; 
}

p{
 text-align: center;"
}

</style>
<script type="text/javascript">

/* function test3(){
	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.forest.go.kr/openapi/service/cultureInfoService/gdTrailInfoOpenAPI'; /*URL*/
	var queryParams = '?' + encodeURIComponent('ServiceKey') + '='+'lgVtVTsJEuXKfNpq8RSVgdwFIDbku065dngPfBYOMYz4KauXQuCilV9aVwqZ2m2Z8kc9eGxiXmCY7zAWkV4m%2Bg%3D%3D';
	queryParams += '&' + encodeURIComponent('searchArNm') + '=' + encodeURIComponent('강원'); 
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	    	alert(xhr);
	        alert('Status: '+this.status+' Headers: '+JSON.stringify(this.getAllResponseHeaders())+' Body: '+this.responseText);
	    }
	};
	xhr.send('');
	} */
	
function testtest(){
	
$.ajax({
	url : abc,
	success: function (abc) {
         alert(abc);
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
              <a class="dropdown-item" href="Freetime_Park.do">공원</a>
            <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Freetime_Center.do">노인교실/경로당</a>
            </div>
          </div>
          <div class="btn-group">
            <a href="#" class="btn btn-lg mx-1 btn-dark">자유게시판</a>
          </div>
        </div>
        </div>
        </div>
        
     <div class="py-5 text-white opaque-overlay" style="background-image: url(&quot;https://www.splitshire.com/wp-content/uploads/2016/03/SplitShire-3080060.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-gray-dark">등산로</h1>
          <h4></h4><br/><br/><br/><br/><br/>
        </div>
      </div>
    </div>
  </div><br/><br/><br/>
        
    <div class="col-md-12">
		<p><img alt="등산" src="http://admin.brainworld.com/Library/FileDown.aspx?filename=sshutterstock_111970076.jpg&filepath=BrainHealth" width="800px;" height="600px;" style="border:2px solid black; margin:0 auto;"></p>
	<a class="btn btn-dark" href="Exercise_Search.do">길찾기</a><br/><br/><br/>
	</div>

<div class="container">
<form class="form-inline m-0" action="Exercise_hiking1.do" method="post">
<input type="text" name="hiking_keyword" id="hiking_keyword" placeholder="ex)제주, 서울"/>
<input type="submit" class="btn btn-dark" value="검색" />
</form>
</div>

<div class="container">
	<table>
		<c:choose>
			<c:when test="${empty abc }">
			
			</c:when>
			<c:otherwise>
				<c:forEach items="${requestScope.abc }" var="abc">
				<c:out value="${abc }" escapeXml="false"/>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		</div><br/><br/><br/>

	<%@ include file="bootstrap.jsp" %>
</body>
</html>