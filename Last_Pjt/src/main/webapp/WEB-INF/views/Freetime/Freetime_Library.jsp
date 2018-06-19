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
p{
 text-align: center;"
}

</style>

<script type="text/javascript">
function testtest(){
	
	   $.getJSON("./resources/json/Library.json",function(data) {
	      alert(data);
	      var abc = "";
	      $.each(data, function(key,val) {
	         if (key=="DESCRIPTION") {
	            $("#apiList").attr("border","1");
	            $("thead").append(
						"<tr><th>"+val.GU_NM+"</th>"+
						"<th>"+val.HNR_NAM+"</th>"+
						"<th>"+val.NEADRES_NM+"</th>"+
						"<th>"+val.FLY_GBN+"</th>"+
						"<th>"+val.FCLTY_NM+"</th>"+
						"<th>"+val.HMPG_CN+"</th></tr>"
	            );
	            }else{
	            	var list = val;
	            	var abc = $("#searchAPI").val();
	            	for(var i = 0; i < list.length; i++){
	            		var str = list[i];
	            		if (abc==str.gu_nm) {
	            		$("tbody").append(
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
<div class="py-3 bg-dark" >
 <div class="col-md-20" draggable="true" >
          <div class="btn-group" >
          <a href="index.jsp" class="btn btn-lg mx-1 btn-dark">HOME</a>
          <a href="NoticeBoard_list.do" class="btn btn-lg mx-1 btn-dark">공지사항</a>
          <div class="btn-group">
            <button class="btn btn-lg mx-1 btn-dark" data-toggle="dropdown">교육</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">온라인</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">오프라인</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-lg mx-1 btn-dark dropdown-toggle" data-toggle="dropdown">운동</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="Exercise_walk.do">걷기</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Exercise_hiking.do">등산</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-lg mx-1 btn-dark dropdown-toggle" data-toggle="dropdown">음식</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">건강식단</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">맛집</a>
            </div>
          </div>
          <div class="btn-group">
            <button class="btn btn-lg mx-1 btn-dark dropdown-toggle" data-toggle="dropdown">여가</button>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="Freetime_Culture.do">문화행사</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Freetime_Library.do">도서관</a>
           <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Freetime_Park.do">공원</a>
            <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="Freetime_Center.do">노인교실/경로당</a>
            </div>
          </div>
          <div class="btn-group">
            <a href="#" class="btn btn-lg mx-1 btn-dark">자유게시판</a>
          </div>
        </div>
        </div>
        </div>
        
        <div class="py-5 text-white opaque-overlay" style="background-image: url(&quot;./resources/img/Freetime_Library.jpg&quot;); background-size: cover;" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="text-gray-white">도서관</h3>
          <h4></h4><br/><br/><br/><br/><br/>
        </div>
      </div>
    </div>
  </div><br/><br/><br/>
        
       <!--  <div class="container">
        	<p><img alt="도서관" src="./resources/img/Library.jpg" width="600px;" height="400px;" style="border: 2px solid black;"></p>
        </div><br/> -->
        
        <div class="container">
        <label>원하는 지역으로 찾을 수 있습니다.</label>
		<select class="form-control" id="searchAPI" style="width: 150px;">
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
		</select>
		<button onclick="testtest();" class="btn btn-dark" style="float: center;">검색</button>
		</div><br />
        
    <div class="container">			
		<table id="apiList" border="1">
			<thead></thead>
			<tbody></tbody>
		</table>
	</div>

<%@ include file="../bootstrap.jsp"%>
</body>
</html>