



//var mid= document.getElementById("member_id");
//var mpw = document.getElementById("member_pw");
//var mpw2 = document.getElementById("member_pw2");
//var mname= document.getElementById("member_name");
//var mphone = document.getElementById("member_phone");
//var memail = document.getElementById("member_email");

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


// //아이디 유효성 검사(영어소문자, 숫자만 허용)
// function idChk2(){
// 	for (var i = 0; i < mid.value.length; i++) {
// 		var ch=mid.value.charAt(i);
// 		if (!(ch>='0' && ch<='9')&&!(ch>='a' && ch<='z')) {
// 		alert("아이디는 소문자, 숫자만 입력 가능합니다.");
// 		mid.focus();
// 		mid.select();
// 		mid.value="";
// 		return;
// 		}
// 	}
// }



// //아이디 길이체크(6~12자)
// function idChk3(){
// if(mid.value.length<6||mid.value.length>12){
// 	alert("아이디를 6~12자까지 입력해 주세요.");
// 	mid.focus();
// 	mid.select();
// 	return;
// 	}	
// }



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
		

		
// //비밀번호 입력여부 검사
// function pwChk1(){
// if( mpw.value=="" || mpw.value==null ){
// 	alert("비밀번호를 입력해 주세요.");
// 	mpw.focus();
// 	return;
// 	}
// }

// //비밀번호 길이 체크(9자 이상)
// function pwChk2(){
// if(mpw.value.length<9){
// 	alert("비밀번호를 9자 이상 입력해 주세요.");
// 	mpw.focus();
// 	mpw.select();
// 	return;
// 	}
// }

// //비밀번호 일치여부 체크
// function pwChk3(){
// if(mpw.value!=mpw2.value){
// 	alert("비밀번호가 일치하지 않습니다.");
// }else{
//   alert("비밀번호가 일치합니다.");	
//   mpw.value="";
//   mpw2.value="";
// }
// }

// //전화번호 입력여부 검사
// function phone(){
// if(mphone.value==""){
// 	alert("전화번호를 입력하세요");
// 	mphone.focus();
// 	return;
// 	}
// }

// //전화번호 길이체크
// function phonelength(){
// 	if(mphone.value.length<10||mphone.value.length>11){
// 		alert("전화번호를 다시 입력해 주세요");
// 		mpw.focus();
// 		mpw.select();
// 		return;
// 	}
// }

//전화번호 숫자만 입력가능하게 함.



//이메일 입력여부 검사
// function memail(){
// if(memail.value==""){
// 	alert("전화번호를 입력하세요");
// 	memail.focus();
// 	return;
// 	}
// }

//이메일 형식체크(@,'.'가 있어야함)
// function email(){
// if((memail.value.indexOf('@'))<=0) && (memail.value.indexOf('.'<=0)){
// 	alert("이메일 형식에 맞추어 입력해 주세요.");
// 	memail.value="";
// 	memail.focus();
// 	return;
// 	}
// }

