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
  <div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
	</div>
        
     <div class="py-5 text-dark opaque-overlay" style="background-image: url(&quot;./resources/img/Freetime_Center.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-md-12"><br/>
          <h3 class="text-gray-white" align="left">&nbsp;&nbsp;&nbsp;&nbsp;경로당</h3><br/>
          <h4></h4><br/><br/><br/>
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
 <label style="color: black;">원하는 지역으로 검색할 수 있습니다.</label><br/>
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