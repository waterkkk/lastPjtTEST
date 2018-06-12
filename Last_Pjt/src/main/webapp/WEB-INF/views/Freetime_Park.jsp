<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공원</title>
<script type="text/javascript" src="reseources/json/Park.json"></script>
<style type="text/css">
p{
 text-align: center;"
}

</style>
<script type="text/javascript">
function testtest(){
	
	   $.getJSON("./resources/json/Park.json",function(data) {
	      alert(data);
	      var abc = "";
	      $.each(data, function(key,val) {
	         if (key=="DESCRIPTION") {
	            $("#apiList").attr("border","1");
	            $("thead").append(
						"<tr><th>"+val.P_PARK+"</th>"+
						"<th>"+val.P_LIST_CONTENT+"</th>"+
						"<th>"+val.VISIT_ROAD+"</th>"+
						"<th>"+val.P_ADDR+"</th>"+
						"<th>"+val.P_ADMINTEL+"</th></tr>"
	            );
	            }else{
	            	var list = val;
	            	var abc = $("#searchAPI").val();
	            	for(var i = 0; i < list.length; i++){
	            		var str = list[i];
	            		if (abc==str.p_zone) {
	            		$("tbody").append(
								"<tr><td>"+str.p_park+"</td>"+
								"<td>"+str.p_list_content+"</td>"+
								"<td>"+str.visit_road+"</td>"+
								"<td>"+str.p_addr+"</td>"+
								"<td>"+str.p_admintel+"</td></tr>"
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
        </div><br/><br/><br/>
        
        <div class="container">
        	<p><img alt="공원" src="http://img.etoday.co.kr/pto_db/2015/11/20151113093448_752102_600_400.jpg" width="700px;" height="400px;" style="border: 2px solid black;"></p>
        </div><br/>

<div class="container">
<input type="text" class="form-control" id="searchAPI" placeholder="ex) 마포구, 종로구" style="width:200px;"/>
<button onclick="testtest();" class="btn btn-dark" style="float: center;">검색</button>
</div><br/><br/><br/>

  <div class="container">			
		<table id="apiList" border="1">
			<thead></thead>
			<tbody></tbody>
		</table>
	</div>


<%@ include file="bootstrap.jsp"%>
</body>
</html>