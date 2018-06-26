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
 @font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}

</style>
<script type="text/javascript">
function testtest(){
   
      $.getJSON("./resources/json/Park.json",function(data) {
         var abc = "";
         $.each(data, function(key,val) {
            if (key=="DESCRIPTION") {
               $("#apiList").attr("border","1");
               $("thead").html(
                  "<tr><th width=" +"100px;>"+val.P_PARK+"</th>"+
                  "<th width=" +"200px;>"+val.P_LIST_CONTENT+"</th>"+
                  "<th width=" +"200px;>"+val.VISIT_ROAD+"</th>"+
                  "<th width=" +"100px;>"+val.P_ADDR+"</th>"+
                  "<th width=" +"80px;>"+val.P_ADMINTEL+"</th></tr>"
               );
               }else{
                  var list = val;
                  var abc = $("#searchAPI").val();
                  for(var i = 0; i < list.length; i++){
                     var str = list[i];
                     if (abc==str.p_zone) {
                    	
                     $("tbody").html(
                        "<tr><td>"+str.p_park+"</td>"+
                        "<td><br/>"+str.p_list_content+"<br/></td>"+
                        "<td><br/>"+str.visit_road+"<br/></td>"+
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
        
     <div class="py-5 text-dark opaque-overlay" style="background-image: url(&quot;./resources/img/Freetime_Park.jpg&quot;); background-size: cover;" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-gray-dark">공원</h1>
          <h4></h4><br/><br/><br/><br/><br/><br/><br/>
        </div>
      </div>
    </div>
  </div><br/><br/><br/><br/><br/><br/><br/>
  
  <!--로그인-->
  <c:if test="${empty dto.member_id }">
         <div id="loginAlert" align="center">
            로그인해주시면 게시판을 이용하실 수 있습니다.<br> <br>
         </div>
         <div align="center">
            <input type="button" style="height: 50px; font-size: 20px;" class="btn btn-dark" onclick="location.href='loginStart.do'"
               value="로그인"> <br> <br> <br>
         </div>
      </c:if>
      <c:if test="${dto.member_id != null}">
        
   <div class="container">
      <label style="color: black;">원하는 지역으로 찾을 수 있습니다.</label>
         <div class="container" style="display: flex;">
         <input type="text" class="form-control" id="searchAPI" placeholder="ex) 동작구, 관악구" style="width:200px; height: 50px; font-size: 20px;"/>&nbsp;
         <button onclick="testtest();" class="btn btn-dark" style="float: center; height: 50px; font-size: 20px;">검색</button>
         </div>
   </div><br/><br/><br/><br/><br/>

  <div class="Park">         
      <table id="apiList" border="1">
         <thead></thead>
         <tbody></tbody>
      </table><br/><br/><br/>
   </div>
   
   </c:if>
<br/><br/><br/><br/>
<footer id="footer">
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