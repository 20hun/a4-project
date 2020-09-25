<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

<script type="text/javascript">
	function formCheck(){
		var member_pw = document.getElementById('member_pw').value;
		var member_pw_check = document.getElementById('member_pw_check').value;

		if(member_pw != member_pw_check){
			alert("비밀번호 틀림");
			return false;
			}

		return true;
	}

</script>

</head>
<body>
	<h1>[ 회원 가입 ]</h1>
	
	<form action="join" onsubmit="return formCheck();" method="post">
		ID : <input type="text" name = "member_id" readonly="readonly" value="${member_id }"> 사용가능한 ID<br>
		비밀번호 : <input type="password" name="member_pw" id="member_pw"> <br>
		비밀번호 확인 : <input type="password" id="member_pw_check"> <br>
		이름 : <input type="text" name="member_nm"> <br>
		<input type="submit" value="가입">
	</form>
	
</body>
</html>