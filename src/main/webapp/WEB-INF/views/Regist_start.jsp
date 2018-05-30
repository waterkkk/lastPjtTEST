<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function idChkConfirm() {
	var chk = document.getElementsByName("member_id")[0].title;
	if(chk == 'n'){
		alert("아이디 중복체크를 해주세요");
		//.focus = 커서표시를 표시한부분으로 이동시켜라
		document.getElementsByName("member_id")[0].focus();
	}
}

function phoneChkConfirm() {
	var chk = document.getElementsByName("member_phone")[0].title;
	if(chk == 'n'){
		alert("전화번호 중복체크를 해주세요");
		//.focus = 커서표시를 표시한부분으로 이동시켜라
		document.getElementsByName("member_phone")[0].focus();
	}
}

function emailChkConfirm() {
	var chk = document.getElementsByName("member_email")[0].title;
	if(chk == 'n'){
		alert("이메일 중복체크를 해주세요");
		//.focus = 커서표시를 표시한부분으로 이동시켜라
		document.getElementsByName("member_email")[0].focus();
	}
}

function idChk() {
	var doc = document.getElementsByName("member_id")[0];
	open("idChk.do?member_id="+doc.value);
}


function phoneChk() {
	var doc = document.getElementsByName("member_phone")[0];
	open("phoneChk.do?member_phone="+doc.value);
}


function emailChk() {
	var doc = document.getElementsByName("member_email")[0];
	open("emailChk.do?member_email="+doc.value);
}


</script>



</head>
<body>

 <h1>회원 가입</h1>
 
 <form action="insertUser.do" method="post">
   
    
    <table border="1">
    	<tr>
    	<th>아이디</th>
    	<td>
    	   <input type="text" name="member_id" title="n" required="required"/>
    	   <input type="button" value="중복체크" onclick="idChk();"/>
    	</td>
    	</tr>
    	<tr>
    	   <th>비밀번호</th>
    	   <td><input type="password" name="member_pw" onclick="idChkConfirm();" required="required"></td>
    	</tr>
    	<tr>
    	   <th>비밀번호 확인</th>
    	   <td><input type="password" name="member_pw2" onclick="idChkConfirm();" required="required"></td>
    	</tr>
    	<tr>
    	   <th>이름</th>
    	   <td><input type="text" name="member_name" onclick="idChkConfirm();" required="required"></td>
    	</tr>
    	
    	<tr>
    	   <th>전화번호</th>
    	   <td><input type="text" name="member_phone" onclick="idChkConfirm();" required="required">
    	    <input type="button" value="중복체크" onclick="phoneChk();"/>    </td>
    	
    	</tr>
    	<tr>
    	   <th>이메일</th>
    	   <td><input type="email" name="member_email" onclick="idChkConfirm();" required="required">
    	    <input type="button" value="중복체크" onclick="emailChk();"/></td>

    	<tr>
    	   <td colspan="2"><input type="submit"  value="가입"></td>
    	</tr>
    </table>   
 </form>

</body>
</html>