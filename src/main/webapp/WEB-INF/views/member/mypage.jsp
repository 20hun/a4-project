<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

</head>
<body>

	<h1>[ 회원 정보 ]</h1>
	<form action="/member/update" method="post">
	ID : ${member.member_id } <br>
	PW : ${member.member_pw } <br>
	Name : ${member.member_nm } <br>
	등록일 : ${member.member_indate } <br>
	
	<input type = "submit" value = "수정하기">
	</form>
</body>
</html>