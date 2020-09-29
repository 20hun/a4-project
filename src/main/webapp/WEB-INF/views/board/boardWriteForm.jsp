<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 말풍선 작성 화면 ]</title>
</head>
<body>
	<h1>[ 말풍선 작성 ]</h1>
	
	<form action="boardWrite" method="post">
		글 제목 : <input type="text" name="board_title"> <br>
		글 내용  <br>
		<textarea rows="10" cols="40" name="board_content"></textarea><br>
		<input type="text" name="lat" value=${lat }>
        <input type="text" name="lon" value=${lon }>
		<input type="submit" value="글 등록">
	</form>
</body>
</html>