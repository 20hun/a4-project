<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

<script type="text/javascript">

	function formCheck(){

			alert("중복 확인 해주세요");
			return false;

	}

	function check(){
		var id = document.getElementById("member_id").value;
		if(id == ""){
				alert("아이디 입력해 주세요");
			}else{
		location.href="check?member_id="+id;
			}
	}

</script>

</head>
<body>
	<h1>[ 회원 가입 ]</h1>
	
	<form action="join" onsubmit="return formCheck();" method="post">
		ID : <input type="text" id="member_id" name="member_id"> ${repeat } <input type="button" value="중복확인" onclick="check()"><br>
		비밀번호 : <input type="password" name="member_pw" id="member_pw"> <br>
		비밀번호 확인 : <input type="password" id="member_pw_check"> <br>
		이름 : <input type="text" name="member_nm"> <br>
		<input type="submit" value="가입">
	</form>
	
</body>
</html>