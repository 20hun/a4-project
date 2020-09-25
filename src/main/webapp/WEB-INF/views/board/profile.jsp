<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>말풍선</title>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>등록 시간</th>
		</tr>
		<c:forEach items="${list }" var="board" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${board.board_title }</td>
				<td>${board.board_content }</td>
				<td>${board.board_indate }</td>
				<td><a href="/board/delete?board_no=${board.board_no }">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>