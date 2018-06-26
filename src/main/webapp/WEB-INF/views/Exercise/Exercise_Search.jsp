<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>길찾기</title>
<style type="text/css">
 @font-face {
   font-family: "Godo";
   src: url("resources/font/GodoB.ttf");
}

* {
}

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="https://v40.pingendo.com/assets/4.0.0/default/theme.css" type="text/css"> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
  <div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
   </div>
  
    <div class="py-5 text-black" style="background-image: url(&quot;./resources/img/Exercise_Search.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-md-12"><br/><br/><br/><br/><br/><br/>
          <h1 class="text-gray-white" style="text-align: center;">길찾기/지도</h1>
          <h4></h4><br/>
        </div>
      </div>
    </div>
  </div><br/><br/><br/><br/><br/>
   
 <div class="container">
   <div style="float: right;">
      <form onsubmit="keyword1(); return false;" style="display: flex; " >
         <input class="form-control" id="keyword" placeholder="입력하세요." style="width:200px; vertical-align: bottom; height: 50px; font-size: 20px;"/>&nbsp;
         <button onclick="keyword1();" class="btn btn-dark" style="height: 50px; font-size: 20px;">검색</button><br/><br/>
      </form>
   </div> <br/><br/><br/>
   
   <div class="container"> 
      <div style="float: right;">
      <a class="btn btn-dark" href="Exercise_Walk.do" style="height: 50px; font-size: 20px;">걷기 게시판</a>
      <a class="btn btn-dark" href="Exercise_Hiking.do" style="height: 50px; font-size: 20px;">등산로 게시판</a>
   </div>
  </div><br/><br/><br/>
   
   <div class="Search">
      <div id="map" style="width:1000px; height:1000px; border:2px solid black; margin:0 auto; float: left;">
      </div>
   </div><br/><br/>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7860e07925e3692715c72048890bd002&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 

function keyword1(){
   
var keyword = document.getElementById('keyword').value;
ps.keywordSearch(keyword, placesSearchCB); 
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(place.y, place.x) 
    });
    
    //장소에 대한 설명
    var infowindow1 = new daum.maps.InfoWindow({
        content: '<div style=" font-size:20px; display:inline-block; height:auto; width:230px;">'+ place.place_name +'</div>'
    });
    infowindow1.open(map, marker);
    
    // 마커에 클릭이벤트를 등록합니다
    /* daum.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div> ');
        infowindow.open(map, marker);
    }); */
}
</script>
</div><br/><br/>

   <div>
      <table id="apiList" border="1">
      </table>

<button class="btn btn-dark" style="height: 50px; font-size: 20px;" onclick="location.href='http://map.seoul.go.kr/smgis/webs/theme/themeMapCopy.do?mode=themeMapCopy&thm_theme_id=100362&map_type=1&xpoint=126.978509&ypoint=37.566611&level=9&oldmap=&tp=0.7&maptile=BASEMAP_NAVER&order=0&utid=&copy_mode=theme#'">서울의 산과 공원 안내</button>
   </div><br/><br/>
   
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