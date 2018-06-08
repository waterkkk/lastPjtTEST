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
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

* {
	font-family: 'Nanum Gothic Coding';
 	text-align: center; 
}

</style>

</head>
<body>
<div class="py-5" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <a class="btn btn-dark" href="index.jsp">HOME</a>
          <a class="btn btn-dark" href="NoticeBoard_list.do">공지사항</a>
          <div class="btn-group">
            <button class="btn btn-dark dropdown-toggle" data-toggle="dropdown"> 교육</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">온라인</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">오프라인</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-dark dropdown-toggle" data-toggle="dropdown"> 운동</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="Exercise_walk.do">걷기</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Exercise_hiking.do">등산</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-dark dropdown-toggle" data-toggle="dropdown">음식</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">건강식단</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">맛집</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-dark dropdown-toggle" data-toggle="dropdown"> 여가</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="Freetime_Culture.do">문화행사</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Freetime_Library.do">도서관</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">공원</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">노인교실/경로당</a>
            </div>
          </div>
          <a class="btn btn-dark" href="#">자유게시판</a>
        </div>
      </div>
    </div>
  </div><br/><br/><br/>

<h3>길찾기 게시판</h3>
<div class="container">
<br/><br/><br/><br/><br/><br/><br/>
	
	<div class="container">
	<div style="float: right;">
	<form onsubmit="keyword1(); return false;" >
		<input class="form-control" id="keyword" placeholder="입력하세요." style="width:200px; vertical-align: bottom;"/>
		<button onclick="keyword1();" class="btn btn-dark">검색</button><br/><br/>
	 <a class="btn btn-dark" href="Exercise_hiking.do">등산로</a>
	</form>
	</div>
	
	
<div id="map" style="width:800px; height:700px; border:2px solid black; margin:0 auto;"></div><br/><br/>

<script type="text/javascript">

</script>

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
        content: '<div style="padding:2px; font-size:12px;">'+ place.place_name +'</div>'
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
</div>
<table id="apiList" border="1"></table>

<button class="btn btn-dark" onclick="location.href='http://map.seoul.go.kr/smgis/webs/theme/themeMapCopy.do?mode=themeMapCopy&thm_theme_id=100362&map_type=1&xpoint=126.978509&ypoint=37.566611&level=9&oldmap=&tp=0.7&maptile=BASEMAP_NAVER&order=0&utid=&copy_mode=theme#'">서울의 산과 공원 안내</button>
	</div>
	
	<%@ include file="bootstrap.jsp" %>
</body>
</html>