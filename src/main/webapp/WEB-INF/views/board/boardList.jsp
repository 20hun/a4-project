<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록</title>
<script type="text/javascript" src="/resources/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function sendArray(){
		$.ajax({
			url: "/sendArray",
			type: "post",
			data: {
				arr: [
					$("input:text").val(),
					$("input:password").val()
					]
				},
				traditional: true, //배열을 전달하기 때문에
				success: function(){alert("통신 성공!");},
				error: function(e) {alert("통신 실패...");console.log(e);}
								//실패하면 콘솔에 사유 나옴
			});
		}
	function sendVO(){
		$.ajax({
			url: "/sendVO",
			type: "post",
			/* data: {
				userid: $("input:text").val(),
				userpw: $("input:password").val()
				}, */
			data: $("form").serialize(),
			success: function() {alert("통신 성공!");},
			error: function(e) {alert("통신 실패...");console.log(e);}
		});
	}

	function receiveArray(){
			$.ajax({
				url: "/receiveArray",
				type: "post",
				success: function(data) {alert("통신 성공!");console.log(data)},
				error: function(e) {alert("통신 실패...");console.log(e);}
				});
		}

	function receiveVO(){
			$.ajax({
				url: "/receiveVO",
				type: "post",
				success: function(data) {alert("통신 성공!");console.log(data)},
				error: function(e) {alert("통신 실패...");console.log(e);}
			});
	}

	function sendJSON(){
		$.ajax({
			url:"/sendJSON",
			type:"post",
			data:JSON.stringify({
				userid: $("input:text").val(),
				userpw: $("input:password").val()
				}), //jquery가 제공하는 객체 중 json이란 객체가 있음 stringify라는 함수는 문자열 화해주는
		contentType: "application/json;charset=utf-8;",
		success: function() {alert("통신 성공!");},
		error: function(e){alert("통신 실패...");console.log(e);}
	});
}

	function receiveJSON(){
		$.ajax({
			url:"/receiveJSON",
			type:"post",
			dataType: "json",
		success: function(data){alert("통신 성공!");console.log(data)},
		error: function(e){alert("통신 실패...");console.log(e);}
	})
	}
	
	function sendList(){
		var arr = [
			$("input:text").val(),
			$("input:password").val()
		];
	
		
		$.ajax({
			url:"/sendList",
			type: "post",
			data: JSON.stringify(arr), //자바스크립트 객체를 문자열 화 해서 json객체로 보낸다
			contentType: "application/json;charset=utf-8;",
			success: function() {alert("통신 성공!");},
			error: function(e){alert("통신 실패...");console.log(e);}
		});
	}
	
	function sendMap(){
		var map = {
				userid: $("input:text").val(),
				userpw: $("input:password").val(),
				};
		
		$.ajax({
			url:"/sendMap",
			type: "post",
			data: JSON.stringify(map),
			contentType: "application/json;charset=utf-8;",
			success: function() {alert("통신 성공!");},
			error: function(e){alert("통신 실패...");console.log(e);}
		});
	}
	
	function receiveList(){
		$.ajax({
			url:"/board/receiveList",
			type:"post",
			dataType: "text",
			//dataType: "json",
		//success: function(data){alert("통신 성공!");console.log(data)},
		success: function(data){
				alert("통신 성공");
				console.log(data);
				console.log(JSON.parse(data)); //stringify랑 반대 > 문자열을 객체화
			},
		error: function(e){alert("통신 실패...");console.log(e);}
	})
	}
	
	function receiveMap(){
		$.ajax({
			url:"/receiveMap",
			type:"post",
			//dataType: "json",
			dataType: "text",
			//success: function(data){alert("통신 성공!");console.log(data)},
			success: function(data){
					alert("통신 성공");
					console.log(data);
					console.log(JSON.parse(data)); //stringify랑 반대 > 문자열을 객체화
				},
		error: function(e){alert("통신 실패...");console.log(e);}
	})
	}
</script>
</head>
<body>
	<table>
		<tr>
			<th>말풍선 번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>좋아요</th>
			<th>위도</th>
			<th>경도</th>
		</tr>
		<c:forEach items="${list }" var="data" varStatus="status">
			<tr>
				<td>${status.count }</td>
				<td>${data.board_title }</td>
				<td>${data.board_content }</td>
				<td>${data.member_id }</td>
				<td>${data.board_indate }</td>
				<td>${data.board_view }</td>
				<td>${data.board_like }</td>
				<td>${data.lat }</td>
				<td>${data.lon }</td>
			</tr>
		</c:forEach>
	</table>
	
	<form>
		<input type="text">
		<input type="password">
	</form>
	<button onclick="sendArray();">컨트롤러로 배열 보내기</button>
	<button onclick="sendVO();">컨트롤러로 VO 보내기</button>
	<br>
	<button onclick="receiveArray();">컨트롤에서 배열 받기</button>
	<button onclick="receiveVO();">컨트롤러에서 VO 받기</button>
	<br>
	<button onclick="sendJSON();">컨트롤러에서 json 객체 보내기</button>
	<button onclick="receiveJSON();">컨트롤러에서 json 객체 받기</button>
	<br>
	<button onclick="sendList();">컨트롤러에 ArrayList 객체 보내기(feat. JSON)</button>
	<button onclick="sendMap();">컨트롤러에 HashMap 객체 보내기(feat. JSON)</button>
	<br>
	<button onclick="receiveList();">컨트롤러에 ArrayList 객체 받기(feat. JSON)</button>
	<button onclick="receiveMap();">컨트롤러에 HashMap 객체 받기(feat. JSON)</button>
</body>
</html>