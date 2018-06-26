<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>걷기게시판</title>
<style type="text/css">
 @font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}


body{
margin: 0;
height: 100%;
}

.wrap{
min-height: 100%;
position: relative;
}


</style>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="https://v40.pingendo.com/assets/4.0.0/default/theme.css" type="text/css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<script type="text/javascript">

function test1(){
   var searchAPI = $("#searchAPI").val();
         
   $.ajax({
        url: "http://openapi.seoul.go.kr:8088/427958685873776539364e63494a53/xml/SeoulGilWalkCourse/1/5/"+searchAPI,
        type: "get",
        dataType: "html",
        success:function(api){
        /*    $("body").append(api); */  
        $(api).find("row").each(function(){
           var course_name = $(this).find("COURSE_NAME").text();
           var detail_course =  $(this).find("DETAIL_COURSE").text();
           var area_gu =  $(this).find("AREA_GU").text();
           var distance = $(this).find("DISTANCE").text();
           var lead_time = $(this).find("LEAD_TIME").text();
           var course_level =  $(this).find("COURSE_LEVEL").text();
           var traffic_info = $(this).find("TRAFFIC_INFO").text();
           var content = $(this).find("CONTENT").text()+"</h4>";
           var out = course_name + detail_course + area_gu + distance + lead_time + course_level + traffic_info + content;
           /*$("#apiList").append("<tr><th>코스</th><th>상세코스</th><th>지역</th><th>거리</th><th>소요시간</th><th>난이도</th><th>교통</th><th>설명</th></tr><br/><tr><td> " +  course_name +"</td><td> "+ detail_course +"</td><td> " + area_gu +"</td><td> " + distance +"</td><td> " + lead_time + "</td><td> " + course_level +"</td><td><br/> " + traffic_info +"<br/></td><td><br/> " + content + "</td></tr><br/>");*/
           $("#apiList").append("<tr><th width=" +"100px;" + "align="+"center;"+">코스</th><td align="+"left;"+">" + course_name +"</td></tr><br/><tr><th width=" +"50px;>상세코스</th><td>"+ detail_course +"</td></tr><br/><tr><th width=" +"50px;>지역</th><td>" + area_gu +"</td></tr><tr><th width=" +"50px;>거리</th><td>" + distance +"</td></tr><tr><th width=" +"70px;>소요시간</th><td>" + lead_time + "</td></tr><tr><th width=" +"50px;>난이도</th><td>" + course_level +"</td></tr><tr><th width=" +"50px;>교통</th><td><br /> " + traffic_info +"<br /></td></tr><tr><th width=" +"50px;>설명</th><td><br /> " + content + "</td></tr><tr><th></th><td colspan="+"1"+"><br/>다음 코스♡ <br/><td><br/></tr><br/>");
        }); 
   },      
      error:function(){                        
         alert("실패"); 
   }
});
   }
   
$("select").click(function() {
     var select = $(this).data("isLoad");
     if(select) {
       window.location.href = $(this).val()
     }
     //set isopen to opposite so next time when use clicked select box
     //it wont trigger this event
     $(this).data("isLoad", !select);
   });
</script>
</head>
<body>
  <div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
   </div>
   
       <div class="py-5 text-white" style="background-image: url(&quot;./resources/img/Exercise_walk.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-gray-white">걷기</h1>
          <h4></h4><br/><br/><br/><br/><br/>
        </div>
      </div>
    </div>
  </div><br/><br/><br/><br/><br/><br/>

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
      
      
   <div class="wrap">      
   <div class="container">      
   <div style="width: 50%; float:left;">
        <div class="container">
      <h4 style="color: black; font-size: 20px;">코스로 검색할 수 있습니다</h4><br/>
      <div class="container" style="float: left;">
         <form class="form-inline m-0" method="post">
            <label for="se01" class="label01" class="form-control" style="color: black; font-size: 20px;">유형별</label>&nbsp;&nbsp;
            <select id="select" class="form-control" onchange="window.location.href=this.value;" style="height: 50px; font-size: 20px;">
               <option value="">선택하세요</option>
               <option value="http://map.seoul.go.kr/smgis/short.jsp?p=6LBTL">서울둘레길</option>
               <option value="http://map.seoul.go.kr/smgis/short.jsp?p=6LARf">근교산자락길</option>
               <option value="http://seoulcitywall.seoul.go.kr/front/kor/sub01/course_all.do">한양도성길</option>
               <option value="http://map.seoul.go.kr/smgis/short.jsp?p=6LFiq">서울 봄꽃길</option>
            </select> 
         </form>
      </div>
   </div>
  </div>
         
      <div style=" width: 50%; float:left;" >
         <h4 style="color: black; font-size: 20px;">직접 검색할 수 있습니다</h4><br/>
         <div style="display: flex;">
            <input type="text" class="form-control" id="searchAPI" placeholder="ex) 관악산, 안양천" style="width:200px; height: 50px; font-size: 20px;"/>&nbsp;<br/>
            <button onclick="test1();" class="btn btn-dark" style="height: 50px; font-size: 20px; width: 100px;">검  색</button>&nbsp;
            <a class="btn btn-dark" href="Exercise_Search.do" style="height: 50px; font-size: 20px; width: 100px;">길찾기</a>
         </div>
      </div>
   </div>
<br/><br/><br/><br/><br/><br/>
               
               
   <div class="container">         
   <table id="apiList">
   </table>
   </div>   
   </div>
   <br/><br/><br/>
   
   </c:if>
<br/><br/><br/><br/><br/><br/><br/>   
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