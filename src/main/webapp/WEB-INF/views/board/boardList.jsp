<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>scroll</title>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
<script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script>
  <style type="text/css" media="screen">
    * { margin: auto; }
    body { margin: 20px 0; background: #abc; color: #111; font-family: Helvetica, Arial, Verdana, 'Lucida Grande', sans-serif; }
    h1, h3, p { text-align: center; }
    div.example { padding: 20px; margin: 10px auto; background: #bcd; width: 750px; }
    div.example h3 { margin-bottom: 10px; }
    ul, ol { padding: 0; }
    #list { width: 50px; height: 150px; overflow-y: scroll; }
    #images { width: 600px; height: 550px; overflow-x: hidden; text-align: center; list-style: none; }
    .endless_scroll_loader { position: fixed; top: 10px; right: 20px; }
  </style>
  <script type="text/javascript">
		$(document).ready(function(){
			$('#btnSend').on('click', function(evt) {
				  evt.preventDefault();
			if (socket.readyState !== 1) return;
			  	  let msg = $('input#msg').val();
			  	  socket.send(msg);
			  });
			  connect();
			})
  </script>
  
  <script type="text/javascript">
  var socket = null;
  function connect(){
	  var ws = new WebSocket("ws://localhost:8888/replyEcho?bno=1234");
		socket = ws;

	  ws.onopen = function () {
	      console.log('Info: connection opened.');	      
	  };


	  ws.onmessage = function (event) {
	      console.log(event.data+'\n');
	  };


	  ws.onclose = function (event) { console.log('Info: connection closed.');
	  		//setTimeout( function(){ connect(); }, 1000); // retry connection!!
	  		};
	  ws.onerror = function (err) { console.log('Error:', err); };
	  }	
  </script>
  
	<script type="text/javascript" src="/resources/assets/js/jquery.min.js"></script>
  <script type="text/javascript" src="/resources/assets/js/jquery.endless-scroll.js"></script>
  <script type="text/javascript" charset="utf-8">
    $(function() {
      $('#list').endlessScroll({
        pagesToKeep: 10,
        fireOnce: false,
        insertBefore: "#list div:first",
        insertAfter: "#list div:last",
        content: function(i, p) {
          console.log(i, p)
          return '<li>' + p + '</li>'
        },
        ceaseFire: function(i) {
          if (i >= 10) {
            return true;
          }
        },
        intervalFrequency: 5
      });

      $('#images').scrollTop(101);
      var images = $("ul#images").clone().find("li");
      $('#images').endlessScroll({
        pagesToKeep: 5,
        inflowPixels: 100,
        fireDelay: 10,
        content: function(i, p, d) {
          console.log(i, p, d)
          return images.eq(Math.floor(Math.random()*8))[0].outerHTML;
        }
      });
    });
  </script>

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
<div class="well">
	<input type="text" id="msg" value="1212" class="form-control"/>
	<button id="btnSend" class="btn btn-primary">Send Message</button>
</div>
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
	
        <div class="example">
    <h3>Ends in 10 calls:</h3>
    <ul id="list">
      <li>1</li>
      <li>2</li>
      <li>3</li>
      <li>4</li>
      <li>5</li>
      <li>6</li>
      <li>7</li>
      <li>8</li>
      <li>9</li>
      <li>10</li>
      <li>11</li>
      <li>12</li>
      <li>13</li>
      <li>14</li>
      <li>15</li>
      <li>16</li>
      <li>17</li>
      <li>18</li>
      <li>19</li>
      <li>20</li>
    </ul>
  </div>

  <div class="example">
    <h3>Never ending:</h3>
    <ul id="images">
      <li><img src="/resources/assets/images/scrollimg/grass-blades.jpg" width="580" height="360" alt="Grass Blades" /></li>
      <li><img src="/resources/assets/images/scrollimg/stones.jpg" width="580" height="360" alt="Stones" /></li>
      <li><img src="/resources/assets/images/scrollimg/sea-mist.jpg" width="580" height="360" alt="Sea Mist" /></li>
      <li><img src="/resources/assets/images/scrollimg/pier.jpg" width="580" height="360" alt="Pier" /></li>
      <li><img src="/resources/assets/images/scrollimg/lotus.jpg" width="580" height="360" alt="Lotus" /></li>
      <li><img src="/resources/assets/images/scrollimg/mojave.jpg" width="580" height="360" alt="Mojave" /></li>
      <li><img src="/resources/assets/images/scrollimg/lightning.jpg" width="580" height="360" alt="Lightning" /></li>
      <li><img src="/resources/assets/images/scrollimg/flowing-rock.jpg" width="580" height="360" alt="Grass Blades" /></li>
    </ul>
  </div>

  <div class="example">
    <p>Copyright &copy; <a href="http://fredwu.me/">Fred Wu</a></p>
  </div>
</body>
</html>