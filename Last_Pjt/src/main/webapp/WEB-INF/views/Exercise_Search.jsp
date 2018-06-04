<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등산</title>
<style type="text/css">
@import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

* {
	font-family: 'Nanum Gothic Coding';
 	text-align: center; 
}

</style>

</head>
<body>
<h3>등산 게시판</h3><br/><br/><br/>
<div>
<button class="btn btn-primary" onclick="location.href='index.jsp'">메인</button>
<button class="btn btn-primary" onclick="location.href='NoticeBoard_list.do'">공지사항 </button>

</div><br/><br/><br/>
	
	<div class="container">
	<div style="float: right;">
	<form onsubmit="keyword1(); return false;" >
		<input class="form-control" id="keyword" placeholder="입력하세요." style="width:200px; vertical-align: bottom;"/>
		<button onclick="keyword1();" class="btn btn-primary">검색</button>
	</form>
	</div>
	
<div id="map" style="width:800px; height:700px; border:1px solid black; margin:0 auto;"></div><br/><br/>


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
$("#apiList").append(keyword);
ps.keywordSearch(keyword, placesSearchCB); 
}


// 키워드로 장소를 검색합니다

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

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
</script>
<table id="apiList" border="1"></table>
	</div>
	
	<%@ include file="bootstrap.jsp" %>
</body>
</html>