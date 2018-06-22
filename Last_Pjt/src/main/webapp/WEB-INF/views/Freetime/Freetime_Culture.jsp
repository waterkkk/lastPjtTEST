<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문화행사</title>
<style type="text/css">
p{
 text-align: center;"
}
.container:active,
.container:focus,
.container:hover{
	color: black;
}
.form-control:active,
.form-control:focus,
.form-control:hover{
	color: black;
}
</style>

<script type="text/javascript" src="reseources/json/Culture.json"></script>
<script type="text/javascript">

	function testtest(){
		
			   $.getJSON("./resources/json/Culture.json",function(data) {
			      var abc = "";
			      $.each(data, function(key,val) {
			         if (key=="DESCRIPTION") {
			            $("#apiList").attr("border","1");
			            $("thead").append(
								"<tr><th width=" +"50px;>"+val.CODENAME+"</th>"+
								"<th width=" +"100px;>"+val.TITLE+"</th>"+
								"<th width=" +"100px;>시작일~종료일</th>"+
								"<th width=" +"70px;>링크</th>"+
								"<th width=" +"100px;>"+val.PLACE+"</th>"+
								"<th width=" +"50px;>지역</th>"+
								"<th width=" +"50px;>"+val.USE_TRGT+"</th>"+
								"<th width=" +"50px;>"+val.USE_FEE+"</th>"+
								"<th width=" +"300px;>이미지</th></tr>"
			            );
			            }else{
			            	var list = val;
			            	var abc = $("#searchAPI").val();
			            	for(var i = 0; i < list.length; i++){
			            		var str = list[i];
			            		if (abc==str.codename) {
			            		$("tbody").append(
										"<tr><td>"+str.codename+"</td>"+
										"<td>"+str.title+"</td>"+
										"<td>"+str.strtdate+"~<br/>"+ str.end_date+"</td>"+
										"<td><a href="+"'"+str.org_link+"'>누르시면 site로 <br/>이동합니다.</a></td>"+
										"<td>"+str.place+"</td>"+
										"<td>"+str.gcode+"</td>"+
										"<td>"+str.use_trgt+"</td>"+
										"<td>"+str.use_fee+"</td>"+
										"<td><img src= "+str.main_img+" width=" +"300px;" +"height="+"200px;"+"></td></tr>"
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
        
    <div class="py-5" style="background-image: url(&quot;./resources/img/Freetime_Culture.jpg&quot;); background-size: cover;" >
    <div class="abc">
      <div class="row">
        <div class="col-md-12"><br/><br/><br/><br/>
          <h3 style="color: #bfa100; text-align: center;">문화행사</h3><br/>
          <h4></h4>
        </div>
      </div>
    </div>
  </div><br/><br/><br/><br/><br/>
	
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
		<label style="color: black;">원하는 장르로 찾을 수 있습니다.</label>
		<div class="container" style="display: flex;">
		<select class="form-control" id="searchAPI" style="width: 150px; text-align: center; height: 40px;">
		<option value="">선택하세요</option>
		<option value="영화">영화</option>
		<option value="기타">기타</option>
		<option value="연극">연극</option>
		<option value="콘서트">콘서트</option>
		<option value="문화교양/강좌">문화교양/강좌</option>
		<option value="독주/독창회">독주/독창회</option>
		<option value="전시/미술">전시/미술</option>
		<option value="무용">무용</option>
		<option value="국악">국악</option>
		<option value="뮤지컬/오페라">뮤지컬/오페라</option>
		<option value="축제">축제</option>
		<option value="문화·예술 ">문화·예술 </option>
		</select>&nbsp;
		<button onclick="testtest();" class="btn btn-dark" >검색</button>
		</div>
		</div><br />
		
   	<div class="API">			
	<table id="apiList" border="1" style="text-align: center;">
		<thead></thead>
		<tbody></tbody>
	</table>
	</div>	
	
	</c:if>
	
	<footer>
	  <div class="py-3 bg-dark text-white">
    <div class="container">
      <div class="row" >
        <div class="col-md-8">
          <div class="col-md-12 mt-3 text-left">
            <p>상호명 : 언제나 봄날 </p>
            <p>주소 : 서울시 영등포구 양평동 3가 15-1 월드메르디앙비즈센터 4층 </p>
            <p>전화번호 : 02-5340-2233</p>
          </div>
        </div>
        </div>
        </div>
      <div class="row">
        <div class="col-md-12 mt-3 text-center">
          <p>Copyright@2018 언제나 봄날 </p>
        </div>
      </div>
     </div>
     </footer>

</body>
</html>