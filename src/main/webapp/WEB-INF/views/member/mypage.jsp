<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Chat</title>
		
		<script type="text/javascript">
	// 웹 소켓 객체를 담을 변수.
	var webSocket;

	// 소켓을 열고 세션 생성을 요청할 함수.
	function openSocket() {
		// 웹 소켓 객체를 초기화하는 코드. 생성자에 전달하는 url 문자열을 인식하여 해당 주소로 접속하고 세션 생성을 요청한다.
		// url 앞쪽의 'ws://'는 웹 소켓을 의미하는 식별자다. 빠지면 오류가 발생하니 빼먹지 말자.
		// url 뒤쪽의 '/basicChat.do'는 BasicChatController.java 파일의 @ServerEndpoint 어노테이션의 값과 연결된다.
		webSocket = new WebSocket("ws://localhost:8888/basicChat.do");
		// 위 코드가 실행되면 컨트롤러의 @OnOpen 어노테이션이 적용된 onOpen() 메서드가 자동으로 실행된다.
		// 그후, 이 웹 소켓 객체의 onopen 이벤트(바로 아래 내용 참고)가 발생한다.

		// 생성된 웹 소켓 객체에 onopen, onmessage, onclose 이벤트를 각각 적용시켜준다.
		// 각각의 이벤트가 발생하면, 컨트롤러에서 해당 이벤트를 먼저 처리하고, 그 결과를 아래의 함수들이 전달받아 실행한다.
		// onopen: 소켓을 열 때 발생하는 이벤트. output() 함수를 통해 채팅 시작을 표시한다. output() 함수는 37번째 줄부터 정의되어 있다.
		webSocket.onopen = function(event) {output("채팅을 시작합니다.");};
		// onmessage: 메시지를 전송받을 때 발생하는 이벤트. output() 함수를 통해 전송받은 메시지를 표시한다.
		webSocket.onmessage = function(event) {output(event.data);};
		// onclose: 소켓을 닫을 때 발생하는 이벤트. output() 함수를 통해 채팅 종료를 표시한다.
		webSocket.onclose = function(event) {output("채팅을 종료합니다.");};

		// 소켓이 열렸는데 또 소켓 열기 버튼을 클릭하지 못하도록 처리하는 코드. 웹 소켓 기술과 큰 상관이 있는 코드는 아님.
		document.getElementById("openBtn").disabled = "disabled";
		document.getElementById("closeBtn").disabled = false;
		document.getElementById("sendBtn").disabled = false;
	}

	// 메시지를 화면에 표시해줄 함수.
	function output(txt) {
		// 표시할 메시지를 매개변수 txt로 전달받고, 기존의 내용에 덧붙인다.
		document.getElementById("messages").innerHTML += txt + "<br>";
	}

	// 소켓을 닫고 세션 제거를 요청할 함수.
	function closeSocket() {
		// 앞서 연 웹 소켓을 닫고 생성된 세션을 제거하도록 컨트롤러에 요청한다.
		webSocket.close();
		// 위 코드가 실행되면 컨트롤러의 @OnClose 어노테이션이 적용된  onClose() 메서드가 자동으로 실행된다.
		// 그후, 이 웹 소켓 객체의 onclose 이벤트(openSocket() 함수 참고)가 발생한다.

		// 소켓이 닫혔는데 또 소켓 닫기 버튼을 클릭하지 못하도록 처리하는 코드. 웹 소켓 기술과 큰 상관이 있는 코드는 아님.
		document.getElementById("openBtn").disabled = false;
		document.getElementById("closeBtn").disabled = "disabled";
		document.getElementById("sendBtn").disabled = "disabled";
	}

	// 메시지를 전송하는 함수.
	function sendMessage() {
		// 사용자가 입력한 메시지를 가져온다.
		var txt = document.getElementById("msg").value;

		// 앞서 연 웹 소켓 객체를 통해 메시지를 보낸다.
		webSocket.send(txt);
		// 위 코드가 실행되면 컨트롤러의 @OnMessage 어노테이션이 적용된  onMessage() 메서드가 자동으로 실행된다.
		// 그후, 이 웹 소켓 객체의 onmessage 이벤트(openSocket() 함수 참고)가 발생한다.
	}
</script>
	</head>
	<!--Coded With Love By Mutiullah Samim-->
	<body>
		
		
		<!-- 소켓을 열고 닫는 버튼들 -->
	<input type="button" id="openBtn" value="시작하기(소켓 열기)" onclick="openSocket();">
	<input type="button" id="closeBtn" value="종료하기(소켓 닫기)" onclick="closeSocket();" disabled="disabled"><br><br>
	
	<!-- 메시지를 입력받고 전송하는 입력란 -->
	내용: <input type="text" id="msg">
	<input type="button" id="sendBtn" value="전송" onclick="sendMessage();" disabled="disabled"><br><br>
	
	<!-- 메시지를 표시하는 곳 -->
	<div id="messages"></div>
	</body>
</html>

<%-- 	<h1>[ 회원 정보 ]</h1>
	<form action="/member/update" method="post">
	ID : ${member.member_id } <br>
	PW : ${member.member_pw } <br>
	Name : ${member.member_nm } <br>
	등록일 : ${member.member_indate } <br>
	
	<input type = "submit" value = "수정하기">
	</form> --%>	