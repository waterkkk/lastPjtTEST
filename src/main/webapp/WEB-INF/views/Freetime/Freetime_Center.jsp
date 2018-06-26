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
 @font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}

input{
text-align: center; 
}


</style>
<script type="text/javascript">
function testtest(){
   
      $.getJSON("./resources/json/Center.json",function(data) {
        
         var abc = "";
         $.each(data, function(key,val) {
            if (key=="DESCRIPTION") {
               
               $("#apiList").attr("border","1");
               $("thead").html(
                  "<tr><th width=" +"300px;>"+val.NM+"</th>"+
                  "<th width=" +"500px;>"+val.ADDR_OLD+"</th>"+
                  "<th width=" +"100px;>"+val.TOTAL_NUM+"</th>"+
                  "<th width=" +"100px;>"+val.ENTRNC_PSNCPA+"</th></tr>"
               );
               }else{
                  var list = val;
                  var abc = $("#searchAPI").val();
                  for(var i = 0; i < list.length; i++){
                     var str = list[i];
                  /*     var strify = JSON.stringify(data);
                    var test = JSON.parse(strify); */
                     var aa = str.addr_old;
                     var word = aa.replace(/(\s*)/g,"");
                     var word1 = aa.indexOf(abc);
                     
                     if (aa.indexOf(abc) != -1) {
                     $("tbody").html(
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
          <h1 class="text-gray-white" align="left">&nbsp;&nbsp;&nbsp;&nbsp;경로당</h1><br/>
          <h4></h4><br/><br/><br/><br/><br/>
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
            <input type="button" style="height: 50px; font-size: 20px;" class="btn btn-dark" onclick="location.href='loginStart.do'"
               value="로그인"> <br> <br> <br>
         </div>
      </c:if>
      <c:if test="${dto.member_id != null}">
  
  <div class="container">
    <label style="color: black; ">원하는 지역으로 검색할 수 있습니다.</label><br/>
       <div class="container" style="display: flex;">
         <input type="text" class="form-control" id="searchAPI" placeholder="ex) 관악구, 여의도동" style="width:250px; height: 50px; font-size: 20px;"/>&nbsp;
         <button onclick="testtest();" class="btn btn-dark" style="float: center; height: 50px; font-size: 20px;">검색</button>
      </div>
   </div><br/><br/><br/><br/><br/>

  <div class="container">         
      <table id="apiList">
         <thead></thead>
         <tbody></tbody>
      </table>
   </div><br/><br/><br/><br/><br/><br/><br/>
   
   </c:if>   
      <br/><br/><br/><br/><br/>
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