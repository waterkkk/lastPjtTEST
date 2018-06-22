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
  <div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
	</div>
        
     <div class="py-5 text-white opaque-overlay" style="background-image: url(&quot;./resources/img/Freetime_Park.jpg&quot;); background-size: cover;" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="text-gray-dark">공원</h3>
          <h4></h4><br/><br/><br/><br/><br/>
        </div>
      </div>
    </div>
  </div><br/><br/><br/>
  
  <!--로그인-->
      <c:if test="${empty dto.member_id }">
         <div id="loginAlert" align="center">
            로그인해주시면 게시판을 이용하실 수 있습니다.<br> <br>
         </div>
         <div align="center">
            <input type="button" onclick="location.href='loginStart.do'"
               value="로그인"> <br> <br> <br>
         </div>
      </c:if>
      <c:if test="${dto.member_id != null}">
        
	<div class="container">
		<label style="color: black;">원하는 지역으로 찾을 수 있습니다.</label>
			<div class="container" style="display: flex;">
			<input type="text" class="form-control" id="searchAPI" placeholder="ex) 마포구, 종로구" style="width:200px;"/>&nbsp;
			<button onclick="testtest();" class="btn btn-dark" style="float: center;">검색</button>
			</div>
	</div><br/><br/><br/>

  <div class="container">			
		<table id="apiList" border="1">
			<thead></thead>
			<tbody></tbody>
		</table>
	</div>
	
	</c:if>


</body>
</html>