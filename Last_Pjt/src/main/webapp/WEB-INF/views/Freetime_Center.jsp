<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경로당</title>
<script type="text/javascript" src="reseources/json/Center.json"></script>
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
function testtest(){
	
	   $.getJSON("./resources/json/Center.json",function(data) {
	      alert(data);
	     
	      var abc = "";
	      $.each(data, function(key,val) {
	         if (key=="DESCRIPTION") {
	        	 
	            $("#apiList").attr("border","1");
	            $("thead").append(
						"<tr><th>"+val.NM+"</th>"+
						"<th>"+val.ADDR_OLD+"</th>"+
						"<th>"+val.TOTAL_NUM+"</th>"+
						"<th>"+val.ENTRNC_PSNCPA+"</th></tr>"
	            );
	            }else{
	            	var list = val;
	            	var abc = $("#searchAPI").val();
	            	for(var i = 0; i < list.length; i++){
	            		var str = list[i];
	            	/* 	 var strify = JSON.stringify(data);
					     var test = JSON.parse(strify); */
							var aa = str.addr_old;
							var word = aa.replace(/(\s*)/g,"");
							var word1 = aa.indexOf(abc);
					      
	            		if (aa.indexOf(abc) != -1) {
	            		$("tbody").append(
								"<tr><td>"+str.nm+"</td>"+
								"<td>"+str.addr_old+"</td>"+
								"<td>"+str.total_num+"</td>"+
								"<td>"+str.entrnc_psncpa+"</td></tr>"
						);
	            	}
	            }
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
        
     <div class="py-5" style="background-image: url(&quot;https://www.splitshire.com/wp-content/uploads/2017/07/SplitShire-3307.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-gray-dark"><b>경로당</b></h1><br/>
          <h4><b>노인들이 모여 여가를 선용할 수 있도록 지어 놓은 집</b></h4><br/><br/><br/><br/>
        </div>
      </div>
    </div>
  </div><br/><br/><br/>
  
  <div class="container">
<input type="text" class="form-control" id="searchAPI" placeholder="ex) 마포구, 종로구" style="width:250px;"/>
<button onclick="testtest();" class="btn btn-dark" style="float: center;">검색</button>
</div><br/><br/><br/>

  <div class="container">			
		<table id="apiList" border="1">
			<thead></thead>
			<tbody></tbody>
		</table>
	</div>
	
	<div class="container">
	<table>
		<c:choose>
			<c:when test="${empty value }">
			</c:when>
			<c:otherwise>
				<c:forEach items="${requestScope.value }" var="abc">
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		</div>

<%@ include file="bootstrap.jsp" %>
</body>
</html>