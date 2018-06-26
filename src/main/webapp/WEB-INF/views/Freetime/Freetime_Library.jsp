<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서관</title>
<script type="text/javascript" src="reseources/json/Library.json"></script>
<script type="text/javascript" src="reseources/img/Library.jpg"></script>
<style type="text/css">
 @font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}

</style>

<script type="text/javascript">
function testtest(){
   
      $.getJSON("./resources/json/Library.json",function(data) {
         var abc = "";
         $.each(data, function(key,val) {
            if (key=="DESCRIPTION") {
               $("#apiList").attr("border","1");
               $("thead").html(
                  "<tr><th width=" +"80px;>"+val.GU_NM+"</th>"+
                  "<th width=" +"100px;>"+val.HNR_NAM+"</th>"+
                  "<th width=" +"300px;>"+val.NEADRES_NM+"</th>"+
                  "<th width=" +"150px;>"+val.FLY_GBN+"</th>"+
                  "<th width=" +"300px;>"+val.FCLTY_NM+"</th>"+
                  "<th width=" +"200px;>"+val.HMPG_CN+"</th></tr>"
               );
               }else{
                  var list = val;
                  var abc = $("#searchAPI").val();
                  for(var i = 0; i < list.length; i++){
                     var str = list[i];
                     if (abc==str.gu_nm) {
                     $("tbody").html(
                        "<tr><td>"+str.gu_nm+"</td>"+
                        "<td>"+str.hnr_nam+"</td>"+
                        "<td>"+str.neadres_nm+"</td>"+
                        "<td>"+str.fly_gbn+"</td>"+
                        "<td>"+str.fclty_nm+"</td>"+
                        "<td><a href="+"'http://"+str.hmpg_cn+"'>"+str.hmpg_cn+"</a></td></tr>"
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
   
        <div class="py-5 text-white opaque-overlay" style="background-image: url(&quot;./resources/img/Freetime_Library.jpg&quot;); background-size: cover;" >
    <div class="container">
      <div class="row">
        <div class="col-md-12" >
          <h1 class="text-gray-white" style="text-align: right;">도서관</h1>
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
      <select class="form-control" id="searchAPI" style="width: 150px; height: 50px; font-size: 20px;" >
      <option value="">선택하세요</option>
      <option value="강남구">강남구</option>
      <option value="강동구">강동구</option>
      <option value="강북구">강북구</option>
      <option value="강서구">강서구</option>
      <option value="관악구">관악구</option>
      <option value="광진구">광진구</option>
      <option value="구로구">구로구</option>
      <option value="금천구">금천구</option>
      <option value="노원구">노원구</option>
      <option value="도봉구">도봉구</option>
      <option value="동대문구">동대문구</option>
      <option value="동작구">동작구</option>
      <option value="마포구">마포구</option>
      <option value="서대문구">서대문구 </option>
      <option value="서초구">서초구</option>
      <option value="성동구">성동구</option>
      <option value="성북구">성북구</option>
      <option value="송파구">송파구 </option>
      <option value="양천구">양천구 </option>
      <option value="영등포구">영등포구 </option>
      <option value="용산구">용산구</option>
      <option value="은평구">은평구 </option>
      <option value="종로구">종로구</option>
      <option value="중구">중구 </option>
      <option value="중랑구">중랑구 </option>
      </select>&nbsp;
      <button onclick="testtest();" class="btn btn-dark" style="float: center;">검색</button>
      </div>
      </div><br /><br /><br />
        
    <div class="container">         
      <table id="apiList">
         <thead></thead>
         <tbody></tbody>
      </table>
   </div><br/><br/><br/><br/><br/><br/><br/><br/>
   
   </c:if>
   <br/><br/><br/>
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