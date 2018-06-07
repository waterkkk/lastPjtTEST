<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

a { text-decoration:none }

     @import url(//fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);

* {
	font-family: 'Nanum Gothic Coding';
/* 	text-align: center; */
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="https://v40.pingendo.com/assets/4.0.0/default/theme.css" type="text/css"> 
</head>
<title>메인</title>
</head>
<body>
 <div class="py-3 bg-dark" >
 <div class="col-md-20" draggable="true" >
          <div class="btn-group" >
          <a href="#" class="btn btn-lg mx-1 btn-dark">HOME</a>
          <a href="NoticeBoard_list.do" class="btn btn-lg mx-1 btn-dark">공지사항</a>
            <button class="btn btn-lg mx-1 btn-dark dropdown-toggle" data-toggle="dropdown">교육</button>
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
              <a class="dropdown-item" href="#">도서관</a>
           <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">공원</a>
            <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">노인교실/경로당</a>
            </div>
          </div>
          <div class="btn-group">
            <a href="#" class="btn btn-lg mx-1 btn-dark">자유게시판</a>
          </div>
          <div class="btn-group" style="float: right;">
           <form class="form-inline m-0" action="Admin_list.do" method="post" >
          <input type="hidden" name="Admin_list.do" value="page">
          <button type="submit" class="btn btn-dark" style="float: right;">로그인</button><br/>
        <button type="button" class="btn btn-dark" style="float: right;">회원가입</button>
          </form>
          </div>
        </div>
        </div>
        
          <div class="py-5 text-white opaque-overlay" style="background-image: url(&quot;https://pingendo.github.io/templates/sections/assets/cover_restaurant.jpg&quot;);" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-gray-dark">제 2의 인생</h1>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5 bg-light" >
    <div class="container">
      <div class="row">
           <div class="py-5 col-md-3" >
          <div class="row">
            <div class="col-8 col-md-12">
              <h5 class="mb-3 text-primary">배우는 기쁨</h5>
              <p class="my-1">- </p>
            </div>
          </div>
        </div>
        <div class="py-5 col-md-3">
          <div class="row">
            <div class="col-8 col-md-12">
              <h5 class="mb-3 text-primary">
                <b>움직이는 희열</b>
              </h5>
              <p class="my-1">- </p>
            </div>
          </div>
        </div>
        <div class="py-5 col-md-3">
          <div class="row">
            <div class="col-8 col-md-12">
              <h5 class="mb-3 text-primary">
                <b>맛있는 즐거움</b>
              </h5>
              <p class="my-1">- </p>
            </div>
          </div>
        </div>
        <div class="py-5 col-md-3">
          <div class="row">
            <div class="col-8 col-md-12">
              <h5 class="mb-3 text-primary">
                <b>즐기는 기쁨</b>
              </h5>
              <p class="my-1">-
                <br>
                <br> </p>
            </div>
          </div>
        </div>
    </div>
    </div>
  </div>  
<div class="py-5 text-black bg-white" >
    <div class="container">
      <div class="row">
        <div class="col-md-6">
          <div class="list-group" style="opacity: 1.0;">
            <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">공지사항</h5>
                <small>3 days ago</small>
              </div>
              <p class="mb-1">우측 상단의 +를 누르면 화면이 커집니다.</p>
              <small>버튼을 눌러 확인해보세요.</small>
            </a>
            <a href="#" class="list-group-item list-group-item-action flex-column align-items-start">
              <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">공지사항</h5>
                <small class="text-muted">3 days ago</small>
              </div>
              <p class="mb-1">자유게시판의 글이 새롭게 등록되었습니다.</p>
              <small class="text-muted">버튼을 눌러 확인해보세요.</small>
            </a>
          </div>
        </div>
        <div class="col-md-6">
          <div class="embed-responsive embed-responsive-4by3  rounded">
            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/i__1Z5a9Sak?autoplay=0" allowfullscreen=""> </iframe>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div><br/><br/><br/><br/><br/>
  </div><br/><br/><br/><br/><br/>
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
        <div class="col-4 col-md-1 align-self-center">
          <a href="https://www.facebook.com" target="_blank">
            <i class="fa fa-fw fa-facebook fa-3x text-white"></i>
          </a>
        </div>
        <div class="col-4 col-md-1 align-self-center">
          <a href="https://twitter.com" target="_blank">
            <i class="fa fa-fw fa-twitter fa-3x text-white"></i>
          </a>
        </div>
        <div class="col-4 col-md-1 align-self-center">
          <a href="https://www.instagram.com" target="_blank">
            <i class="fa fa-fw fa-instagram text-white fa-3x"></i>
          </a>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12 mt-3 text-center">
          <p>Copyright@2018 언제나 봄날 </p>
        </div>
      </div>
    </div>
  </div>
  

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>
</body>
</html>