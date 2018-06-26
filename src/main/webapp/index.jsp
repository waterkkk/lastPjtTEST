<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html >
<html>
<head>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
   type="text/css">
<link rel="stylesheet"
   href="https://v40.pingendo.com/assets/4.0.0/default/theme.css"
   type="text/css">

<style type="text/css">


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
   height:960px;
}
.row{
   position: absolute;
   top:400px;
   width:500px;
   left:500px;
}
</style>

</head>
<body>



   <form action="main.do" method="post">
   <div class="py-5 text-white opaque-overlay"
      style="background-image: url('resources/img/blackwood.png'); background-size: 100% 100%">
      <div class="container">
         <br><br><br><br><br><br><br>
         <div class="row">
            <div class="col-md-7">
               <div align="center">
                  <h1 class="text-gray-dark"> 어서오세요. </h1>
                  <p class="lead mb-4" align="center">
               제2의 인생을 시작합니다.
               </p>
               </div>

               <br>
               <div align="center">
                  
                  <input type="button" class="btn btn-primary" value="제2의 인생 시작하기" 
                      onclick="location.href='main.do'">
                      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
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
</form>
</body>
</html>