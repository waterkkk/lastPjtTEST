<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%   request.setCharacterEncoding("UTF-8");%>
<%   response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
   type="text/css">
<link rel="stylesheet"
   href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"
   type="text/css">
<link rel="stylesheet" href="resources/css/footer.css?ver=1">
</head>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function searchPwByPhone() {   
   $("#searchPwMain").hide();
   $("#searchPwbyEmail").hide();
   $("#searchPwbyPhone").show();
}

function searchPwByEmail() {   
   $("#searchPwMain").hide();
   $("#searchPwbyPhone").hide();
   $("#searchPwbyEmail").show();
}

function searchPwMain() {   
   $("#searchPwbyPhone").hide();
   $("#searchPwbyEmail").hide();
   $("#searchPwMain").show();
}

//유효성 검사 코드 -전화번호로 비밀번호찾기
function searchPwByPhone2(){
   var idVal=$("#member_id").val();
   var phoneVal =$("#member_phone").val();
   
   if (idVal == null || idVal == "") {
      document.getElementById("idList").innerHTML = "아이디를 입력해 주세요.";
   }else if (phoneVal == null || phoneVal == "") {
      document.getElementById("idList").innerHTML = "전화번호를 입력해 주세요.";
   }else{
   
   $.ajax({
      url:"searchPwByPhone.do",
      data: "member_id=" + idVal + "&member_phone=" + phoneVal,
      
      success: function(data){
          document.getElementById("idList").innerHTML="회원님의 비밀번호는 "+data.member_pw+" 입니다.";
      },
      error: function(statusCode){         
         alert("회원정보를 다시 입력해 주세요.");
         } 
      });
   } 
}


function searchPwByEmail2(){

   var idVal=$("#member_id").val();
   var emailVal=$("#member_email").val();
   
   if (idVal == null || idVal == "") {
      document.getElementById("idList2").innerHTML = "아이디를 입력해 주세요.";
   }else if (emailVal == null || emailVal == "") {
      document.getElementById("idList2").innerHTML = "이메일 주소를 입력해 주세요.";
   }else{
   
   $.ajax({
      url:"searchPwByEmail.do",
      data: "member_id=" + idVal + "&member_email=" + emailVal,
      
      success: function(data){
         var searchIdRes2 = $(data).find("member_id");
         document.getElementById("idList2").innerHTML="회원님의 비밀번호는 "+data.member_pw+" 입니다.";
      },
      error:function(statusCode){         
//          alert("error:" + stuatudCode.status);
         alert("회원정보를 다시 입력해 주세요.");
         }   
      });
    }
}


</script>

<style>
#searchPwbyPhone {
   display: none;
}

#searchPwbyEmail {
   display: none;
}


@font-face {

font-family:"Godo";
src:url("resources/font/GodoB.ttf");
}

*{
   font-family:"Godo";
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

body, table, div, p, h1, h2, h5, h4 {
font-family:'Godo';
}
.opaque-overlay{
   position:absolute;
   height:800px;
   width:100%;
}
.container{
   position:absolute;
   left:22%;
   top:15%;
}
/* #foot{ */
/*    width:100%; */
/*    height:200px; */
/*    position:absolute; */
/*    margin-top:740px; */
/*    background-color:#000000; */
/* } */
/* #space{ */
/*    height:100px; */
/*    position:absolute; */
/*    width:100%; */
/*    top:50px; */
/* } */
/* #left{ */
/*    position:absolute; */
/*    left:50px; */
/*    display: inline-block; */
/* } */
/* #copy{ */
/*    display: inline-block; */
/*    position:absolute; */
/*    left:400px; */
/*    top:70px; */
/* } */
</style>
<body>

<div id="header"> 
<%@ include file="../Form/Header4.jsp"%> 
</div>

<div id="searchPwMain">
   <div class="py-5 text-white opaque-overlay"
      style="background-image: url('resources/img/blackwood.png'); background-size: 100% 100%">
      <div class="container">
         <div class="row">
            <div class="col-md-7">
               <div align="center">
                  <br><br><br><br><br><br><br>
                  <h1 class="text-gray-dark">비밀번호 찾기</h1>
                  <p class="lead mb-4">비밀번호가 기억나지 않아 답답하셨나요?&nbsp; 
                  <br>아이디와 회원정보를 입력하시면 찾을 수 있는 방법을 알려드려요</p>
               </div>               
               
               <div align="center">
                  <button id="phone" class="btn btn-primary"  onclick="searchPwByPhone();">아이디와 전화번호로 찾기</button>            
                  <button id="email" class="btn btn-primary"  onclick="searchPwByEmail();">아이디와 이메일로 찾기</button>               
               <br> <br> <label>아이디가 생각나지 않으신가요?&nbsp;</label> 
               <a href="searchId.do" style="color: white">아이디 찾기</a>
            
               </div>            
            </div>
         </div>
      </div>
   </div>
</div>


<div id="searchPwbyPhone">
   <div class="py-5 text-white opaque-overlay"
      style="background-image: url('resources/img/blackwood.png'); background-size: 100% 100%">
      <div class="container">
         <div class="row">
            <div class="col-md-7">
               <div align="center">
                  <br><br><br><br><br><br><br>
                  <h1 class="text-gray-dark">전화번호로 비밀번호 찾기</h1>
                  <p class="lead mb-4">가입하실 때 등록된 아이디와 전화번호를 입력해 주세요. <br>
                  </p>
               </div>
               <div class="form-group">
                  <label>아이디</label> <input type="text" name="member_id" id="member_id"
                     class="form-control" placeholder="아이디를 입력해 주세요.">
               </div>
               <div class="form-group">
                  <label>전화번호</label> <input type="text" class="form-control"
                     placeholder="특수기호 없이 전화번호를 입력해 주세요. 예)03100001234"
                     name="member_phone" id="member_phone"><br>
                                 
                  <div align="center">
                     <button class="btn btn-primary" onclick="searchPwByPhone2();">확인</button>
                     <button  class="btn btn-primary"  onclick="searchPwByEmail();">이메일로 비밀번호 찾기</button>   
                     <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                     <br> <br> <label>아이디가 생각나지 않으시나요?&nbsp;</label> 
                     <a href="searchId.do" style="color: white">아이디 찾기</a>
                     <br><br> <span id="idList"></span>
                  </div>                  
               </div>
            </div>
         </div>
      </div>
   </div>
</div>


<div id="searchPwbyEmail">
   <div class="py-5 text-white opaque-overlay"
      style="background-image: url('resources/img/blackwood.png'); background-size: 100% 100%">
      <div class="container">
         <div class="row">
            <div class="col-md-7">
               <div align="center">
                  <br><br><br><br><br><br><br>
                  <h1 class="text-gray-dark">이메일로 비밀번호 찾기</h1>
                  <p class="lead mb-4">
                     가입하실 때 등록된 아이디와 이메일 주소를 입력해 주세요. <br>
                  </p>
               </div>
               <div class="form-group">
                  <label>아이디</label> <input type="text" name="member_id" id="member_id"
                     class="form-control" placeholder="아이디를 입력해 주세요.">
               </div>
               <div class="form-group">
                  <label>이메일</label> <input type="email" name="member_email" id="member_email"
                     class="form-control"
                     placeholder="이메일을 입력해  주세요  예)xxxx@email.com"> <br>
                  
                     <div align="center">
                     <button class="btn btn-primary" onclick="searchPwByEmail2();">확인</button>
                     <button  class="btn btn-primary"  onclick="searchPwByPhone();">전화번호로 비밀번호 찾기</button>   
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                     <br> <br> <label>아이디가 생각나지 않으시나요?&nbsp;</label> 
                     <a href="searchId.do" style="color: white">아이디 찾기</a>
                     <br><br> <span id="idList2"></span>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<div id="foot">
   <div id="space">
      <div id="left">
         <p style="color:white; font-size:15pt;">상호명 : 언제나 봄날</p>
         <p style="color:white; font-size:15pt;">주소 : 서울시 영등포구 양평동 3가 15-1 월드메르디앙비즈센터 4층</p>
         <p style="color:white; font-size:15pt;">전화번호 : 02-5340-2233</p>
      </div>
      <div id="copy">
         <p style="color:white; font-size:15pt;">Copyright@2018 언제나 봄날</p>
      </div>
   </div>
</div>

</body>

</html>