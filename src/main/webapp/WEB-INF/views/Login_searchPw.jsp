<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="https://v40.pingendo.com/assets/4.0.0/default/theme.css" type="text/css"> </head>

<body >
     <div class="py-5 text-white opaque-overlay" style="background-image: url('images/good.jpg'); background-size:100% 100%">
    <div class="container">
      <div class="row">
        <div class="col-md-7">
        <div align="center">
          <h1 class="text-gray-dark">비밀번호 찾기</h1>
          <p class="lead mb-4">비밀번호가 기억나지 않아 답답하셨나요?&nbsp;
            <br>회원정보를 입력하시면 찾을 수 있는 방법을 알려드려요
            <br>
            </div>
          </p>
          <form class="" method="post" action="https://formspree.io/">
            <div class="form-group">
              <label>아이디</label>
              <input type="text" name="member)id" class="form-control" placeholder="아이디를 입력해 주세요."> </div>
            <div class="form-group">
              <label>이메일</label>
              <input type="email" name="member_email" class="form-control" placeholder="이메일을
 입력해  주세요  예)xxxx@email.com">
 <br>
              <label>전화번호</label>
              <input type="text" class="form-control" placeholder="특수기호 없이 전화번호를 입력해
 주세요. 예)03100001234" name="member_phone">
 <div align="center">
 <br>
      <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
      <br><br>
              <label>아이디가 생각나지 않으시나요?&nbsp;</label>
              <label onclick="location.href='searchId.do'">아이디 찾기</label>
              
       
            </div>
            </div>
           
            
            
          </form>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
</body>

</html>