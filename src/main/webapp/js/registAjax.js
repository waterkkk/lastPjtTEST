
function idChk() {
	
	var mid= document.getElementById("member_id");

	if (mid.value == null || mid.value == "") {
		document.getElementById("idChk").innerHTML="아이디를 입력해 주세요.";
		mid.focus();
		
	} else if(mid.value.length<6||mid.value.length>12){
		document.getElementById("idChk").innerHTML="아이디를 6~12자까지 입력해 주세요.";
		 	mid.focus();
		 	mid.select();	 
		 	
	}else{	
		$.ajax({
			method:"post",
			url:"idChk.do",
			data:"member_id="+mid.value,
		
			success:function(msg){
				if(msg.idNotUsed){
					document.getElementById("idChk").innerHTML
					="아이디를 사용하실 수 있습니다.";
				}else{
					document.getElementById("idChk").innerHTML
					="중복된 아이디입니다. 다른 아이디를 사용해 주세요.";
					}
				},
			error: function(statusCode){	
			alert("error:" + statusCode.status);
				}   
			})
		}
	}



function insertUser() {
		var mid= document.getElementById("member_id");
		var mpw = document.getElementById("member_pw");
		var mpw2 = document.getElementById("member_pw2");
		var mname= document.getElementById("member_name");
		var mphone = document.getElementById("member_phone");
		var memail = document.getElementById("member_email");

	if (mpw.value == null || mpw.value == "") {
		document.getElementById("pwChk").innerHTML="비밀번호를 입력해 주세요.";
		mpw.focus();
		
	} else if(mpw.value.length<9){
		document.getElementById("pwChk").innerHTML="비밀번호는 9자 이상 입력해 주세요.";
		mpw.focus();
		mpw.select();	 
	
	} else if (mpw.value != mpw2.value){
		document.getElementById("pwChk").innerHTML="비밀번호가 일치하지 않습니다. 다시 한번 확인해 주세요.";
		mpw.focus();
		mpw.select();
		
	} else if (mpw.value == mpw2.value){	
		document.getElementById("pwChk").innerHTML="비밀번호가 일치합니다.";
			
		$.ajax({
//			method:"post",
			url:"insertUser.do",
			data:"member_id="+mid.value+
			     "&member_pw="+mpw.value+
			     "&member_name="+mname.value+
			     "&member_email="+memail.value+
			     "&member_phone="+mphone.value,
		
			success:function(msg){
				if(msg>0){
				  alert("가입이 완료되었습니다! 제2의인생 회원이 되신 것을 환영합니다.");
				  location.href="login.do";
				}else{
				  alert("오류가 발생했습니다. 다시 정보를 입력해 주세요.");
				  location.href="regiStart.do";
					}
				},
			error: function(statusCode){	
			alert("error:" + statusCode.status);
				}   
			})
		}
	}
		

		


