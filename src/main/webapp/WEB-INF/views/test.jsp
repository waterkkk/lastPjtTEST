<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html >
<html>


<head>
<style type="text/css">

@font-face {
  font-family: 'Godo';
  font-style: normal;
  font-weight: 400;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff') format('woff');
}

@font-face {
  font-family: 'Godo';
  font-style: normal;
  font-weight: 700;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff') format('woff');
}

.godo * {
 font-family: 'Godo', sans-serif;
}

/** 이하는 공통 **/
.normal {
 font-style: normal;
}

.w250 {
 font-weight: 250;
}

.w300 {
 font-weight: 300;
}

.w350 {
 font-weight: 350;
}

.w400 {
 font-weight: 400;
}

.w500 {
 font-weight: 500;
}

.w700 {
 font-weight: 700;
}

.w800 {
 font-weight: 800;
}

.w900 {
 font-weight: 900;
}

li span {
 line-height: 1.8;
 font-size: 1.3em;
}

body, table, div, p {
font-family:'Godo';
}
</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"
	type="text/css">
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
        
        <!-- 점보트론 -->
	<div class="py-5"
		style="background-image: url('images/study2.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-gray-dark" align="left">
						<b>&nbsp;</b></h1>
					<br />
					<h4 align="left">
						<b>&nbsp;</b>
					</h4>
					<br />
					<br />
					<br />
					<br />
				</div>
			</div>
		</div>
	</div>
        
<div class="py-5 text-white opaque-overlay"	style="background-image: url('images/food.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<h1 class="text-gray-dark" style="font-family:'Godo'">회원가입</h1>
					<p class="lead mb-4">
						제2의인생과 함께하세요! 회원가입을 하시면 <br> 게시판 글쓰기와&nbsp; 캘린더를 통한 일정관리가
						가능합니다.&nbsp;
					</p>

					

						<div class="form-group">
							<label>아이디</label>
							<div><input type="text" name="member_id" id="member_id" title="n" class="form-control" 
							placeholder="아이디를 입력해 주세요." required="required"><input type="button" value="중복확인" class="btn btn-primary"  
						      onclick="idChk();">  <div id="idChk"></div></div>						
						</div>
						
						<div class="form-group">
							
							<div>
							<label>비밀번호</label> 
							<input type="password"  id="member_pw" class="form-control" 
								placeholder="비밀번호를 입력해 주세요. (숫자,글자 포함 9자리수 이상)"  required="required">
							</div>
							
							<div>
							<label>비밀번호 재입력</label> 
							<input type="password"  id="member_pw2" class="form-control" 
								placeholder="비밀번호를 다시 입력해 주세요. (숫자, 글자 포함 9자리수 이상)"   required="required">
							</div>
							 <div id="pwChk"></div>
							<br>
							
							<div>
							<label>이름</label>
							<input type="text" class="form-control"   id="member_name"
								placeholder="이름을 입력해 주세요. 예)김인생"  required="required">
							</div>
							
							<br>
							<div>				
							<label>이메일</label>
							<input type="email" class="form-control" id="member_email"
								placeholder="메일주소를 입력해 주세요. 예)secondlife@naver.com" required="required" >
							</div>
							
							<div>
							<label>전화번호</label>
							<input type="text" class="form-control"   id="member_phone"   
								placeholder="전화번호를 입력해 주세요.(기호 없이 입력) 예)03100001234" required="required" >
							</div>
						</div>
						   			
							<div align="center"><br>
							<input type="button" onclick="insertUser();" id="regist" value="회원가입" class="btn btn-primary">
							</div>
							
				</div>
			</div>
		</div>
	</div>
	

	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

	
	<div class="py-5 text-white opaque-overlay"
		style="background-image: url('images/backtoschool.jpg'); background-size: 100% 100%">
    	<div class="container">
     	 <div class="row">
        	<div class="col-md-12">
         	  <h1 class="text-gray-dark" align="right"><b>오프라인 강의 찾아보기</b></h1><br/>
         	  <h4 align="right"><b>오프라인 교육을 찾아보세요! 강좌명, 수강시작일 등으로</b>
         	  <br/><br>  검색하여 링크를 통해 바로 수강신청하실 수 있습니다.</h4><br/><br/><br/>
        	</div>
     	 </div>
   	    </div>
   	    	<div class="col-md-11" align="right" >
				<a class="btn btn-primary btn-lg">오프라인 강의 찾아보기</a>
				<a href="eduoffMap.do" class="btn btn-outline-primary btn-lg">지도에서	교육기관 찾아보기</a>
			</div>		
    	</div>








<!--  	<div class="py-5 "  -->
<!-- 		style="background-image: url('images/nori.jpg'); background-size: 100% 100%"> -->
<!--     	<div class="container"> -->
<!--      	 <div class="row"> -->
<!--         	<div class="col-md-13"> -->
<!--          	  <h1 class="text-gray-dark" align="left"><b>자유게시판</b></h1><br/> -->
<!--          	  <h4 align="left"><b>&nbsp;</b></h4><br/><br/><br/><br/> -->
<!--         	</div> -->
<!--      	 </div> -->
<!--    	    </div> -->
<!--     </div> -->



	<!-- 헤더 -->
	<!-- <div id="header"> -->
	<%-- 	<%@ include file="Form/Header.jsp"%> --%>
	<!-- </div> -->

	<!-- 점보트론 -->
	<div class="py-5"
		style="background-image: url('images/nori.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-gray-dark" align="left">
						<b>자유게시판</b></h1>
					<br />
					<h4 align="left">
						<b>&nbsp;</b>
					</h4>
					<br />
					<br />
					<br />
					<br />
				</div>
			</div>
		</div>
	</div>


	<!-- 	<br> -->
	<!-- 	<div class="title" align="center"> -->
	<!-- 		<h1> -->
	<!-- 			<b>자유게시판</b> -->
	<!-- 		</h1> -->
	<!-- 	</div> -->
	<!-- 	<br> -->

	<br>
	<div class="content">
		<!--로그인-->
		<c:if test="${empty dto.member_id }">
			<div id="loginAlert" align="center">
				로그인해주시면 게시판을 이용하실 수 있습니다.<br>
				<br>
			</div>
			<div align="center">
				<input type="button" onclick="location.href='loginStart.do'"
					value="로그인"> <br> <br> <br>
			</div>
		</c:if>
		<c:if test="${dto.member_id != null}">
			<!---->
			<c:if test="${empty map.keyword }">
				<div>
					
					<br>

					<!-- 페이징 -->
					<table id="paging1">

						<tr>
							<td id="paging2" colspan="4" align="center"><c:choose>
									<c:when test="${nowPage eq 1 }">◀</c:when>
									<c:otherwise>
										<a href="board.do?nowPage=${nowPage-1 }">◀</a>
									</c:otherwise>
								</c:choose> <c:forEach begin="${startPage }" end="${endPage }" var="i">
									<a href="board.do?nowPage=${i }">${i}</a>&nbsp;
				        </c:forEach> <c:choose>
									<c:when test="${nowPage eq countPage }">▶</c:when>
									<c:otherwise>
										<a href="board.do?nowPage=${nowPage+1} ">▶</a>
									</c:otherwise>
								</c:choose></td>

							<td align="right"><input id="writebtn" type="button"
								value="글쓰기" onclick="location.href='writeForm.do'"></td>
						</tr>
					</table>
				</div>
				<br>
			</c:if>


			<!-- 검색결과 -->
			<c:if test="${map.keyword != null}">
				<div>
					<table border="1">
						<tr>
							<th>번호</th>
							<th>작성자</th>
							<th>제 목</th>
							<th>날 짜</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="${map.allList}" var="row">
							<tr>
								<td>${row.freetable_no}</td>
								<td>${row.freetable_id}</td>
								<td><a href="detail.do?freetable_no=${row.freetable_no}">${row.freetable_title}</a>
								</td>
								<td>${row.freetable_regDate}</td>
								<td>${row.freetable_readCount}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</c:if>

			<!-- 검색 -->
			<div align="center">
				<form action="search.do" method="get">
					<select name="searching" id="searching">
						<option value="freetable_id">작성자</option>
						<option value="freetable_title">글 제목</option>
						<option value="freetable_content">글 내용</option>
						<option value="freetable_no">글 번호</option>
					</select> <input name="keyword" value="${map.keyword}"> <input
						type="submit" value="검색">
				</form>
			</div>
			<br>
			<br>

		</c:if>

	</div>
	<!-- 	<div id="footer"> -->
	<%-- 	<%@ include file="Form/Footer.jsp"%> --%>
	<!-- 	</div> -->



</body>
</html>