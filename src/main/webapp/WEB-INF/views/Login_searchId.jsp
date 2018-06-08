<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
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
</head>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

function searchByPhone() {
	$("#searchIdMain").hide();
	$("#searchIdbyEmail").hide();
	$("#searchIdbyPhone").show();
}

function searchByEmail() {
	$("#searchIdMain").hide();
	$("#searchIdbyPhone").hide();
	$("#searchIdbyEmail").show();
}

function searchIdMain() {
	$("#searchIdbyPhone").hide();
	$("#searchIdbyEmail").hide();
	$("#searchIdMain").show();
}


function searchIdByPhone2(){
		var phoneVal =$("#member_phone").val();		
		if (phoneVal == null || phoneVal == "") {
			document.getElementById("idList").innerHTML = "전화번호를 입력해 주세요.";
		}else{		
		$.ajax({
			url:"searchIdByPhone.do",
			data: "member_phone=" + phoneVal,
			
			success: function(data){
			    document.getElementById("idList").innerHTML
			    ="회원님의 정보로 등록된 아이디는 "+data.member_id+" 입니다.";
			},
			error: function(statusCode){			
				alert("error:" + statusCode.status);
			} 			 
		});
 	} 
}

	
function searchIdByEmail2(){	
		var emailVal =$("#member_email").val();		
		if (emailVal == null || emailVal == "") {
			document.getElementById("idList2").innerHTML = "이메일 주소를 입력해 주세요.";
		}else{		
		$.ajax({
			url:"searchIdByEmail.do",
			data: "member_email=" + emailVal,
			
			success: function(data){
				document.getElementById("idList2").innerHTML
				="회원님의 정보로 등록된 아이디는 "+data.member_id+" 입니다.";
			},
			error:function(statusCode){			
				alert("error:" + statusCode.status);
				}	
			});
	 	}
	}
	

	
</script>

<style>
#searchIdbyPhone {
	display: none;
}

#searchIdbyEmail {
	display: none;
}
</style>


<body>
<div id="searchIdMain">
	<div class="py-5 text-white opaque-overlay"
		style="background-image: url('images/good.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div align="center">
						<h1 class="text-gray-dark">아이디 찾기</h1>
						<p class="lead mb-4">비밀번호가 기억나지 않아 답답하셨나요?&nbsp; 
						<br>회원정보를 입력하시면 찾을 수 있는 방법을 알려드려요</p>
					</div>					
					
					<div align="center">
						<button  class="btn btn-primary"  onclick="searchByPhone();">전화번호로 찾기</button>			
						<button  class="btn btn-primary"  onclick="searchByEmail();">이메일로 찾기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div id="searchIdbyPhone">
	<div class="py-5 text-white opaque-overlay"
		style="background-image: url('images/good.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div align="center">
						<h1 class="text-gray-dark">전화번호로 아이디 찾기</h1>
						<p class="lead mb-4">가입하실 때 등록된 전화번호를 입력해 주세요.</p>
					</div>													
						<div class="form-group">
							<label>전화번호</label> <input type="text" name="member_phone"
								id="member_phone" class="form-control"
								placeholder="특수기호 없이 전화번호를 입력해 주세요. 예)03100001234"> 
						</div>

						<div align="center">
							<button class="btn btn-primary" onclick="searchIdByPhone2();">확인</button>
							<button  class="btn btn-primary"  onclick="searchByEmail();">이메일로 찾기</button>
							<br><br> <span id="idList"></span>
						</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div id="searchIdbyEmail">
	<div class="py-5 text-white opaque-overlay"
		style="background-image: url('images/good.jpg'); background-size: 100% 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<div align="center">
						<h1 class="text-gray-dark">이메일로 아이디 찾기</h1>
						<p class="lead mb-4">가입하실 때 등록된 이메일 주소를 입력해 주세요.</p>
					</div>
						<div class="form-group">
							<label>이메일</label> <input type="email" name="member_email"
								id="member_email" class="form-control"
								placeholder="이메일을  입력해 주세요 예)xxxx@email.com">
						</div>
						
						<div align="center">
							<button class="btn btn-primary" onclick="searchIdByEmail2();">확인</button>
							<button  class="btn btn-primary"  onclick="searchByPhone();">전화번호로 찾기</button>	
							<br><br> <span id="idList2"></span>
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

</body>
</html>