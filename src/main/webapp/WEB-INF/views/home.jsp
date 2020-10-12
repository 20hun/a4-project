<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>simpleMap</title>
        <script src="https://kit.fontawesome.com/74d52cdd15.js" crossorigin="anonymous"></script>
<script type="text/JavaScript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {

        // Geolocation 객체를 사용
        if(navigator.geolocation) {
            
            navigator.geolocation.getCurrentPosition(function(position) {
                
                // 위치를 가져오는데 성공할 경우
                jQuery.each(position.coords, function(key, item) {
                    jQuery("<h3></h3>").html("● " + key + " : " + item).appendTo("body");
                });
            }, function(error) {
                
                // 위치를 가져오는데 실패한 경우
                consol.log(error.message);
                // geolocation 대신 ip-api.com 사용하면 해결된다고 하는데 객체 받아서 그 안에 있는 위도, 경도 값 넣어주면 해결
                // position 객체       json 객체
            });
        } else {
            consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
        }
    });
</script>        
        <script src="https://apis.openapi.sk.com/tmap/jsv2?version=1&appKey=l7xx8fafbc9262fa45d1bc02913311bdf244"></script>
        <script type="text/javascript">

        var cnt;
        var cnt2 = 0;
        
        document.addEventListener("DOMContentLoaded", function() {
			function getLocation(position) {

		            var latitud = position.coords.latitude;
		            var longitude = position.coords.longitude;
		            
		            var lonlat;
		            var markers = [];
		            var marker;
				
				var map = new Tmapv2.Map("map_div",  
				{
					center: new Tmapv2.LatLng(latitud, longitude), // 지도 초기 좌표
					width: "890px", 
					height: "500px",
					zoom: 15
				});

				$.ajax({
						url:"/board/receiveList",
						type:"post",
						dataType: "json",
					success: function(data){
							console.log(data);
							var str2;
							var str3;
							$.each(data, function(index,item){
								var title = item.board_title.substr(0,5);
								label="<span style='background-color: #46414E;color:white'>"+title+"</span>";
								var marker = new Tmapv2.Marker({
									position: new Tmapv2.LatLng(item.lat, item.lon), //Marker의 중심좌표 설정.
									title : title,
									map: map,
									label : label
								});
									marker.addListener("click", function(evt) {
									document.getElementById("result2").innerHTML = 'Mouse Click!';
									$.ajax({
										url: "/board/getBubble",
										type:"post",
										data: {
											msg: item.board_no
										},
										success: function(data) {alert("통신 성공!");console.log(data)
										$("#title").attr("value", data.board_title);
										$("#content").attr("value", data.board_content);
										$("#indate").attr("value", data.board_indate);
										$("#view").attr("value", data.board_view);
										$("#like").attr("value", data.board_like);

										var str = "";										
										if (data.like_check == '0') {
											str = '<i class="far fa-heart"></i>';
											str2 = 0;
										}
										else {
											str = '<i class="fas fa-heart"></i>';
											str2 = 1;
										}
										$("#likeDiv").html(str);

										str3 = item.board_no;
										},
										error: function(e) {alert("통신 실패...");console.log(e);}
									});									
								});								
							})
							$("#likeDiv").click(function(){
									if(str2 == 0){
										str2 = 1;
										$.ajax({
											url: "/board/likeInsert",
											type:"post",
											data: {
												msg: str3
											},
											error: function(e) {alert("통신 실패...");console.log(e);}
										});												
										str = '<i class="fas fa-heart"></i>';
										}else{
											str2 = 0;
											$.ajax({
												url: "/board/likeDelete",
												type:"post",
												data: {
													msg: str3
												},
												error: function(e) {alert("통신 실패...");console.log(e);}
											});		
											str = '<i class="far fa-heart"></i>';
											}
									$("#likeDiv").html(str);											
									});
							//console.log(JSON.parse(data)); //stringify랑 반대 > 문자열을 객체화
					},
					error: function(e){alert("통신 실패...");console.log(e);}
				})
				
				map.addListener("click", onClick1);
				map.addListener("click", onClick);

				var lat;
				var lon;
									
				function onClick1(e){
					if(cnt == 1){
						console.log(markers[0]);
					if (markers.length != 0) {
						var markerX = markers[0]._elementBounds._left;
						var markerY = markers[0]._elementBounds._top;

						var userX = e.mapPixel.x;
						var userY = e.mapPixel.y;

						//console.log(e.latLng._lat);
						//console.log(e.latLng._lng);
						
						lat = e.latLng._lat;
						lon = e.latLng._lng;

						if (markerX <= userX && userX <= markerX + 24
								&& markerY <= userY && userY <= markerY +38)
							return;
					}
					
					// 클릭한 위치에 새로 마커를 찍기 위해 이전에 있던 마커들을 제거
					removeMarkers();
					if(markers.length == 0){
						lonlat = e.latLng;
						//Marker 객체 생성.
						marker = new Tmapv2.Marker({
							position: new Tmapv2.LatLng(lonlat.lat(),lonlat.lng()), //Marker의 중심좌표 설정.
							map: map //Marker가 표시될 Map 설정.
						});
						  
						markers.push(marker);
					
					}
					
					markers[0].addListener("click", function(evt) {
						document.getElementById("result").innerHTML = 'Mouse Click!';
						location.href="/board/boardWriteForm?lat="+lat+"&lon="+lon;
					});
					}
				}
				
				// 모든 마커를 제거하는 함수입니다.
				function removeMarkers() {
					for (var i = 0; i < markers.length; i++) {
						markers[i].setMap(null);
					}
					markers = [];
				}

				function onClick(e){
					if(cnt == 2){
						if(cnt2 != 1){
						removeMarkers();
						}
					lonlat = e.latLng;

					if(markers.length != 2){
					if(markers.length == 0){
					addMarker("llStart",lonlat.lat(),lonlat.lng(),1);
					cnt2 = 1;
					}else{
						addMarker("llEnd",lonlat.lat(),lonlat.lng(),2);
						}
					markers.push(marker);
					}
					}
				}
					//addMarker("llStart",latitud, longitude,1);
					// 도착 
					//addMarker("llEnd",37.49288934463672,127.11971717230388,2);
					function addMarker(status,lat, lon, tag) {
					//출도착경유구분
					//이미지 파일 변경.
					//var markerLayer;
					switch (status) {
						case "llStart":
							imgURL = 'http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png';
							break;
						case "llPass":
							imgURL = 'http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png';
							break;
						case "llEnd":
							imgURL = 'http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png';
							break;
						default:
					};
					marker = new Tmapv2.Marker({
						position: new Tmapv2.LatLng(lat,lon),
						icon: imgURL,
						draggable : true,
						map: map
					});
					/* // 마커 드래그 설정
					marker.tag = tag;
					marker.addListener("dragend", function (evt) {
					markerListenerEvent(evt);
				    });
				    marker.addListener("drag", function (evt) {    	
				    	markerObject = markerList[tag];
				    });
				    markerList[tag] = marker;
					return marker; */
				}
			}

			if(navigator.geolocation) {
	            navigator.geolocation.getCurrentPosition(getLocation, function(error) {
	                consol.log(error.message);    
	            });
	        } else {
	            consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
	        }
        });

        function upload(){
			cnt = 1;
			cnt2 = 0;
            } 
        function navi(){
			cnt = 2;
            }         
		</script>
</head>
<body>
<h1>[ Map SNS ]</h1>
<c:choose>
	<c:when test="${not empty sessionScope.loginId }">
		${sessionScope.loginId } 님 환영합니다.
		<div id="map_div">
        </div>
        <p id="result"></p>
        <p id="result2"></p>
        <br>
	<input type="text" id = "title" placeholder="버블 제목"> <br>
	<input type="text" id = "content" placeholder="버블 내용"> <br>
	<input type="text" id = "indate" placeholder="버블 등록 시간"> <br>
	<input type="text" id = "view" placeholder="조회수"> <br>
	<div id="likeDiv"></div>
	<!-- <a id="likeA"><i></i></a> -->
	<input type="text" id = "like" placeholder="좋아요">
	<br>
	<input type="button" onclick="upload();" value="거품 등록">
	<input type="button" onclick="navi();" value="길찾기">
		<ul>
			<li>
				<a href="member/logout">로그아웃</a>
			</li>
			<li>
				<a href="board/boardList">말풍선 목록</a>
			</li>
			<li>
				<a href="member/mypage">마이페이지</a>
			</li>
			<li>
				<a href="board/profile">내 프로필</a>
			</li>
			<li>
				<a href="member/joinList">회원 목록</a> 관리자만 들어갈 수 있어요!
			</li>			
		</ul>
	</c:when>
	<c:otherwise>
		<ul>
			<li>
				<a href="member/joinForm">회원가입</a>
			</li>
			<li>
				<a href="member/loginForm">로그인</a>
			</li>
		</ul>
	</c:otherwise>
</c:choose>
</body>
</html>