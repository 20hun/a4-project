<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Bubblemap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <!-- Favicon icon -->
    <link rel="icon" href="/resources/assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/jquery.mCustomScrollbar.css">
        
        <script src="https://kit.fontawesome.com/74d52cdd15.js" crossorigin="anonymous"></script>
		<script type="text/JavaScript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javascript">
    jQuery(document).ready(function() {

        // Geolocation 객체를 사용
        if(navigator.geolocation) {
            
            navigator.geolocation.getCurrentPosition(function(position) {
                
                // 위치를 가져오는데 성공할 경우
                jQuery.each(position.coords, function(key, item) {
                    //jQuery("<h3></h3>").html("● " + key + " : " + item).appendTo("body");
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







				






				/* var markerInfo;
				//출발지,도착지 마커
				var marker_s, marker_e, marker_p;
				//경로그림정보
				var drawInfoArr = [];
				var drawInfoArr2 = [];
			
				var chktraffic = [];
				var resultdrawArr = [];
				var resultMarkerArr = [];

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
					
				}
					
					// 2. 시작, 도착 심볼찍기
					// 시작
					marker_s = new Tmapv2.Marker(
							{
								position : new Tmapv2.LatLng(37.39116200000000,
										127.11217000000000),
								icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png",
								iconSize : new Tmapv2.Size(24, 38),
								map : map
							});
			
					//도착
					marker_e = new Tmapv2.Marker(
							{
								position : new Tmapv2.LatLng(37.35108900000000,
										127.930844000000000),
								icon : "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png",
								iconSize : new Tmapv2.Size(24, 38),
								map : map
							});
			
					// 3. 경로탐색 API 사용요청
					$("#btn_select")
							.click(
									function() {
			
										//기존 맵에 있던 정보들 초기화
										resettingMap();
			
										var searchOption = $("#selectLevel").val();
			
										var trafficInfochk = $("#year").val();
			
										//JSON TYPE EDIT [S]
										$
												.ajax({
													type : "POST",
													url : "https://apis.openapi.sk.com/tmap/routes?version=1&format=json&callback=result",
													async : false,
													data : {
														"appKey" : "l7xx9163c0f7e9934ab4856f6c1df4d4b2c6",
														"startX" : "126.9850380932383",
														"startY" : "37.566567545861645",
														"endX" : "127.10331814639885",
														"endY" : "37.403049076341794",
														"reqCoordType" : "WGS84GEO",
														"resCoordType" : "EPSG3857",
														"searchOption" : searchOption,
														"trafficInfo" : trafficInfochk
													},
													success : function(response) {
			
														var resultData = response.features;
			
														var tDistance = "총 거리 : "
																+ (resultData[0].properties.totalDistance / 1000)
																		.toFixed(1) + "km,";
														var tTime = " 총 시간 : "
																+ (resultData[0].properties.totalTime / 60)
																		.toFixed(0) + "분,";
														var tFare = " 총 요금 : "
																+ resultData[0].properties.totalFare
																+ "원,";
														var taxiFare = " 예상 택시 요금 : "
																+ resultData[0].properties.taxiFare
																+ "원";
			
														$("#result").text(
																tDistance + tTime + tFare
																		+ taxiFare);
			
														//교통정보 표출 옵션값을 체크
														if (trafficInfochk == "Y") {
															for ( var i in resultData) { //for문 [S]
																var geometry = resultData[i].geometry;
																var properties = resultData[i].properties;
			
																if (geometry.type == "LineString") {
																	//교통 정보도 담음
																	chktraffic
																			.push(geometry.traffic);
																	var sectionInfos = [];
																	var trafficArr = geometry.traffic;
			
																	for ( var j in geometry.coordinates) {
																		// 경로들의 결과값들을 포인트 객체로 변환 
																		var latlng = new Tmapv2.Point(
																				geometry.coordinates[j][0],
																				geometry.coordinates[j][1]);
																		// 포인트 객체를 받아 좌표값으로 변환
																		var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																				latlng);
			
																		sectionInfos
																				.push(convertPoint);
																	}
			
																	drawLine(sectionInfos,
																			trafficArr);
																} else {
			
																	var markerImg = "";
																	var pType = "";
			
																	if (properties.pointType == "S") { //출발지 마커
																		markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
																		pType = "S";
																	} else if (properties.pointType == "E") { //도착지 마커
																		markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
																		pType = "E";
																	} else { //각 포인트 마커
																		markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
																		pType = "P"
																	}
			
																	// 경로들의 결과값들을 포인트 객체로 변환 
																	var latlon = new Tmapv2.Point(
																			geometry.coordinates[0],
																			geometry.coordinates[1]);
																	// 포인트 객체를 받아 좌표값으로 다시 변환
																	var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																			latlon);
			
																	var routeInfoObj = {
																		markerImage : markerImg,
																		lng : convertPoint._lng,
																		lat : convertPoint._lat,
																		pointType : pType
																	};
																	// 마커 추가
																	addMarkers(routeInfoObj);
																}
															}//for문 [E]
			
														} else {
			
															for ( var i in resultData) { //for문 [S]
																var geometry = resultData[i].geometry;
																var properties = resultData[i].properties;
			
																if (geometry.type == "LineString") {
																	for ( var j in geometry.coordinates) {
																		// 경로들의 결과값들을 포인트 객체로 변환 
																		var latlng = new Tmapv2.Point(
																				geometry.coordinates[j][0],
																				geometry.coordinates[j][1]);
																		// 포인트 객체를 받아 좌표값으로 변환
																		var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																				latlng);
																		// 포인트객체의 정보로 좌표값 변환 객체로 저장
																		var convertChange = new Tmapv2.LatLng(
																				convertPoint._lat,
																				convertPoint._lng);
																		// 배열에 담기
																		drawInfoArr
																				.push(convertChange);
																	}
																	console.log(drawInfoArr);
																	drawLine(drawInfoArr,
																			"0");
																} else {
			
																	var markerImg = "";
																	var pType = "";
			
																	if (properties.pointType == "S") { //출발지 마커
																		markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png";
																		pType = "S";
																	} else if (properties.pointType == "E") { //도착지 마커
																		markerImg = "http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png";
																		pType = "E";
																	} else { //각 포인트 마커
																		markerImg = "http://topopen.tmap.co.kr/imgs/point.png";
																		pType = "P"
																	}
			
																	// 경로들의 결과값들을 포인트 객체로 변환 
																	var latlon = new Tmapv2.Point(
																			geometry.coordinates[0],
																			geometry.coordinates[1]);
																	// 포인트 객체를 받아 좌표값으로 다시 변환
																	var convertPoint = new Tmapv2.Projection.convertEPSG3857ToWGS84GEO(
																			latlon);
			
																	var routeInfoObj = {
																		markerImage : markerImg,
																		lng : convertPoint._lng,
																		lat : convertPoint._lat,
																		pointType : pType
																	};
			
																	// Marker 추가
																	addMarkers(routeInfoObj);
																}
															}//for문 [E]
														}
													},
													error : function(request, status, error) {
														console.log("code:"
																+ request.status + "\n"
																+ "message:"
																+ request.responseText
																+ "\n" + "error:" + error);
													}
												});
										//JSON TYPE EDIT [E]
									});
				}
			
				function addComma(num) {
					var regexp = /\B(?=(\d{3})+(?!\d))/g;
					return num.toString().replace(regexp, ',');
				}
			
				//마커 생성하기
				function addMarkers(infoObj) {
					var size = new Tmapv2.Size(24, 38);//아이콘 크기 설정합니다.
			
					if (infoObj.pointType == "P") { //포인트점일때는 아이콘 크기를 줄입니다.
						size = new Tmapv2.Size(8, 8);
					}
			
					marker_p = new Tmapv2.Marker({
						position : new Tmapv2.LatLng(infoObj.lat, infoObj.lng),
						icon : infoObj.markerImage,
						iconSize : size,
						map : map
					});
			
					resultMarkerArr.push(marker_p);
				}
			
				//라인그리기
				function drawLine(arrPoint, traffic) {
					var polyline_;
			
					if (chktraffic.length != 0) {
			
						// 교통정보 혼잡도를 체크
						// strokeColor는 교통 정보상황에 다라서 변화
						// traffic :  0-정보없음, 1-원활, 2-서행, 3-지체, 4-정체  (black, green, yellow, orange, red)
			
						var lineColor = "";
			
						if (traffic != "0") {
							if (traffic.length == 0) { //length가 0인것은 교통정보가 없으므로 검은색으로 표시
			
								lineColor = "#06050D";
								//라인그리기[S]
								polyline_ = new Tmapv2.Polyline({
									path : arrPoint,
									strokeColor : lineColor,
									strokeWeight : 6,
									map : map
								});
								resultdrawArr.push(polyline_);
								//라인그리기[E]
							} else { //교통정보가 있음
			
								if (traffic[0][0] != 0) { //교통정보 시작인덱스가 0이 아닌경우
									var trafficObject = "";
									var tInfo = [];
			
									for (var z = 0; z < traffic.length; z++) {
										trafficObject = {
											"startIndex" : traffic[z][0],
											"endIndex" : traffic[z][1],
											"trafficIndex" : traffic[z][2],
										};
										tInfo.push(trafficObject)
									}
			
									var noInfomationPoint = [];
			
									for (var p = 0; p < tInfo[0].startIndex; p++) {
										noInfomationPoint.push(arrPoint[p]);
									}
			
									//라인그리기[S]
									polyline_ = new Tmapv2.Polyline({
										path : noInfomationPoint,
										strokeColor : "#06050D",
										strokeWeight : 6,
										map : map
									});
									//라인그리기[E]
									resultdrawArr.push(polyline_);
			
									for (var x = 0; x < tInfo.length; x++) {
										var sectionPoint = []; //구간선언
			
										for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
											sectionPoint.push(arrPoint[y]);
										}
			
										if (tInfo[x].trafficIndex == 0) {
											lineColor = "#06050D";
										} else if (tInfo[x].trafficIndex == 1) {
											lineColor = "#61AB25";
										} else if (tInfo[x].trafficIndex == 2) {
											lineColor = "#FFFF00";
										} else if (tInfo[x].trafficIndex == 3) {
											lineColor = "#E87506";
										} else if (tInfo[x].trafficIndex == 4) {
											lineColor = "#D61125";
										}
			
										//라인그리기[S]
										polyline_ = new Tmapv2.Polyline({
											path : sectionPoint,
											strokeColor : lineColor,
											strokeWeight : 6,
											map : map
										});
										//라인그리기[E]
										resultdrawArr.push(polyline_);
									}
								} else { //0부터 시작하는 경우
			
									var trafficObject = "";
									var tInfo = [];
			
									for (var z = 0; z < traffic.length; z++) {
										trafficObject = {
											"startIndex" : traffic[z][0],
											"endIndex" : traffic[z][1],
											"trafficIndex" : traffic[z][2],
										};
										tInfo.push(trafficObject)
									}
			
									for (var x = 0; x < tInfo.length; x++) {
										var sectionPoint = []; //구간선언
			
										for (var y = tInfo[x].startIndex; y <= tInfo[x].endIndex; y++) {
											sectionPoint.push(arrPoint[y]);
										}
			
										if (tInfo[x].trafficIndex == 0) {
											lineColor = "#06050D";
										} else if (tInfo[x].trafficIndex == 1) {
											lineColor = "#61AB25";
										} else if (tInfo[x].trafficIndex == 2) {
											lineColor = "#FFFF00";
										} else if (tInfo[x].trafficIndex == 3) {
											lineColor = "#E87506";
										} else if (tInfo[x].trafficIndex == 4) {
											lineColor = "#D61125";
										}
			
										//라인그리기[S]
										polyline_ = new Tmapv2.Polyline({
											path : sectionPoint,
											strokeColor : lineColor,
											strokeWeight : 6,
											map : map
										});
										//라인그리기[E]
										resultdrawArr.push(polyline_);
									}
								}
							}
						} else {
			
						}
					} else {
						polyline_ = new Tmapv2.Polyline({
							path : arrPoint,
							strokeColor : "#DD0000",
							strokeWeight : 6,
							map : map
						});
						resultdrawArr.push(polyline_);
					}
			
				}
			
				//초기화 기능
				function resettingMap() {
					//기존마커는 삭제
					marker_s.setMap(null);
					marker_e.setMap(null);
			
					if (resultMarkerArr.length > 0) {
						for (var i = 0; i < resultMarkerArr.length; i++) {
							resultMarkerArr[i].setMap(null);
						}
					}
			
					if (resultdrawArr.length > 0) {
						for (var i = 0; i < resultdrawArr.length; i++) {
							resultdrawArr[i].setMap(null);
						}
					}
			
					chktraffic = [];
					drawInfoArr = [];
					resultMarkerArr = [];
					resultdrawArr = [];
				} */














				















				

		            var latitud = position.coords.latitude;
		            var longitude = position.coords.longitude;
		            
		            var lonlat;
		            var markers = [];
		            var marker;
				
				var map = new Tmapv2.Map("map_div",  
				{
					center: new Tmapv2.LatLng(latitud, longitude), // 지도 초기 좌표
					width: "960px", 
					height: "600px",
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
							var str4;
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
										$("#memberId").attr("value", data.member_id);
										$("#title").attr("value", data.board_title);
										$("#content").attr("value", data.board_content);
										$("#indate").attr("value", data.board_indate);
										$("#view").attr("value", data.board_view);
										$("#like").attr("value", data.board_like);
										$("#bubble_image").attr("src", "/board/download?board_no="+data.board_no);
										//$("#bubble_video").attr("src", "/board/download?board_no="+data.board_no);
										//$("#bubble_video").attr("src", "<c:url value='https://www.youtube.com/watch?v=jPJthgBj5Z0'/>");
										str4 = data.board_like;

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
										$("#like").attr("value", str4+1);
										str4 = str4 + 1;
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
											$("#like").attr("value", str4-1);
											str4 = str4 - 1;
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
<body class="fix-menu">
<c:choose>
	<c:when test="${not empty sessionScope.loginId }">
		<!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">

                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
                <div class="ring">
                    <div class="frame"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Pre-loader end -->
    <div id="pcoded" class="pcoded">
        <div class="pcoded-overlay-box"></div>
        <div class="pcoded-container navbar-wrapper">

            <nav class="navbar header-navbar pcoded-header">
                <div class="navbar-wrapper">

                    <div class="navbar-logo">
                        <a class="mobile-menu" id="mobile-collapse" href="#!">
                            <i class="ti-menu"></i>
                        </a>
                        <a class="mobile-search morphsearch-search" href="#">
                            <i class="ti-search"></i>
                        </a>
                        <a href="index.html">
                            <img class="img-fluid" src="/resources/assets/images/logo3.png" style="width: 190; height: 57" alt="Theme-Logo" />
                        </a>
                        <a class="mobile-options">
                            <i class="ti-more"></i>
                        </a>
                    </div>

                    <div class="navbar-container container-fluid">
                        <ul class="nav-left">
                            <li>
                                <div class="sidebar_toggle"><a href="javascript:void(0)"><i class="ti-menu"></i></a></div>
                            </li>

                            <li>
                                <a href="#!" onclick="javascript:toggleFullScreen()">
                                    <i class="ti-fullscreen"></i>
                                </a>
                            </li>
                            <li>
                            	<div class="pcoded-search-box">
							    	<input type="text" placeholder="Search" style="width: 300; height: 50">
							    	<span class="search-icon"><i class="ti-search" aria-hidden="true"></i></span>
							    </div>
                            </li>
                        </ul>
                        <ul class="nav-right">
                            <li class="header-notification">
                                <a href="#!">
                                    <i class="ti-bell"></i>
                                    <span class="badge bg-c-pink"></span>
                                </a>
                                <ul class="show-notification">
                                    <li>
                                        <h6>Notifications</h6>
                                        <label class="label label-danger">New</label>
                                    </li>
                                    <li>
                                        <div class="media">
                                            <img class="d-flex align-self-center img-radius" src="/resources/assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="notification-user">jone</h5>
                                                <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                <span class="notification-time">30 minutes ago</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="media">
                                            <img class="d-flex align-self-center img-radius" src="/resources/assets/images/avatar-3.jpg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="notification-user">Joseph William</h5>
                                                <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                <span class="notification-time">30 minutes ago</span>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="media">
                                            <img class="d-flex align-self-center img-radius" src="/resources/assets/images/avatar-4.jpg" alt="Generic placeholder image">
                                            <div class="media-body">
                                                <h5 class="notification-user">Sara Soudein</h5>
                                                <p class="notification-msg">Lorem ipsum dolor sit amet, consectetuer elit.</p>
                                                <span class="notification-time">30 minutes ago</span>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <li class="user-profile header-notification">
                                <a href="member/mypage">
                                    <img src="/resources/assets/images/avatar-4.jpg" class="img-radius" alt="User-Profile-Image">
                                    <span>${sessionScope.loginId }</span>
                                    <i class="ti-angle-down"></i>
                                </a>
                                <ul class="show-notification profile-notification">
                                    <li>
                                        <a href="#!">
                                            <i class="ti-settings"></i> Settings
                                        </a>
                                    </li>
                                    <li>
                                        <a href="member/mypage">
                                            <i class="ti-user"></i> Profile
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-email"></i> My Messages
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-lock"></i> Lock Screen
                                        </a>
                                    </li>
                                    <li>
                                        <a href="member/logout">
                                            <i class="ti-layout-sidebar-left"></i> Logout
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="pcoded-main-container">
                <div class="pcoded-wrapper">                                        
                        <div class="pcoded-inner-content">
                            <div class="main-body">
                                <div class="page-wrapper">
                                    <div class="page-body">
                                        <div class="row">                                        
                                        	<!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="icofont icofont-ui-home bg-c-pink card1-icon"></i>
                                                        <span class="text-c-pink f-w-600">뉴스피드</span>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                                <i class="text-c-pink f-16 icofont icofont-refresh m-r-10"></i>Just update
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->                                            
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="icofont icofont-pie-chart bg-c-blue card1-icon"></i>
                                                        <span class="text-c-blue f-w-600">기능</span>
                                                        <input type="button" onclick="upload();" value="거품 등록">                                                                                                              
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                                <i class="text-c-blue f-16 icofont icofont-warning m-r-10"></i>Get more space
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="icofont icofont-warning-alt bg-c-green card1-icon"></i>
                                                        <span class="text-c-green f-w-600">길찾기</span>
							                            <input type="button" onclick="navi();" value="길찾기">					                        
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                                <i class="text-c-green f-16 icofont icofont-tag m-r-10"></i>Tracked via microsoft
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            <!-- card1 start -->
                                            <div class="col-md-6 col-xl-3">
                                                <div class="card widget-card-1">
                                                    <div class="card-block-small">
                                                        <i class="icofont icofont-social-twitter bg-c-yellow card1-icon"></i>
                                                        <span class="text-c-yellow f-w-600">거품 순위</span>
                                                        <div>
                                                            <span class="f-left m-t-10 text-muted">
                                                            	<i class="text-c-yellow f-16 icofont icofont-calendar m-r-10"></i>Last 24 hours                                                                
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- card1 end -->
                                            <!-- Statestics Start -->
                                            <div class="col-md-12 col-xl-8">
	                                            <div class="ft_area">
													<div class="ft_select_wrap">
														<div class="ft_select">
															<select id="selectLevel">
																<option value="0" selected="selected">교통최적+추천</option>
																<option value="1">교통최적+무료우선</option>
																<option value="2">교통최적+최소시간</option>
																<option value="3">교통최적+초보</option>
																<option value="4">교통최적+고속도로우선</option>
																<option value="10">최단거리+유/무료</option>
																<option value="12">이륜차도로우선</option>
																<option value="19">교통최적+어린이보호구역 회피</option>
															</select> <select id="year">
																<option value="N" selected="selected">교통정보 표출 옵션</option>
																<option value="Y">Y</option>
																<option value="N">N</option>
															</select>
															<button id="btn_select">적용하기</button>
														</div>
													</div>
													<div class="map_act_btn_wrap clear_box"></div>
													<div class="clear"></div>
												</div>
                                            	<div id="map_div"></div>
                                            	<div class="map_act_btn_wrap clear_box"></div>
												<p id="result3"></p>
                                                <!-- <div class="card">
                                                    <div class="card-header">
                                                        <h5>Statestics</h5>
                                                        <div class="card-header-left ">
                                                        </div>
                                                        <div class="card-header-right">
                                                            <ul class="list-unstyled card-option">
                                                                <li><i class="icofont icofont-simple-left "></i></li>
                                                                <li><i class="icofont icofont-maximize full-card"></i></li>
                                                                <li><i class="icofont icofont-minus minimize-card"></i></li>
                                                                <li><i class="icofont icofont-refresh reload-card"></i></li>
                                                                <li><i class="icofont icofont-error close-card"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div id="statestics-chart" style="height:517px;"></div>
                                                    </div>
                                                </div> -->
                                            </div>



                                            <div class="col-md-12 col-xl-4">
                                                    <div class="card fb-card">
                                                        <div class="card-header">
                                                            <i class="icofont icofont-social-facebook"></i>
                                                            <div class="d-inline-block">
                                                                <h5>facebook</h5>
                                                                <span>blog page timeline</span>
                                                            </div>
                                                        </div>
                                                        <div class="card-block text-center">
                                                            <div class="row">
                                                                <div class="col-6 b-r-default">
                                                                    <h2>23</h2>
                                                                    <p class="text-muted">Active</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <h2>23</h2>
                                                                    <p class="text-muted">Comment</p>
                                                                </div>
                                                            </div>
                                                            	<p id="result"></p>
        														<p id="result2"></p>
	                                                            <a href="/sns/timeLine"><input type="button" id = "memberId"></a> <br>
																<input type="text" id = "title" placeholder="버블 제목"> <br>
																<input type="text" id = "content" placeholder="버블 내용"> <br>
																<input type="text" id = "indate" placeholder="버블 등록 시간"> <br>
																<input type="text" id = "view" placeholder="조회수"> <br>
																<div id="likeDiv"></div>
																<!-- <a id="likeA"><i></i></a> -->
																<input type="text" id = "like" placeholder="좋아요"><br>
																<img id="bubble_image" width="200" height="200">
																<!-- <embed id="bubble_video" width="200" height="200"> -->
																<br>
                                                        <a href="board/boardList">말풍선 목록</a><br>
                                                        <a href="/member/check">경로</a><br>
														<a href="board/profile">내 말풍선들</a><br>
														<a href="member/joinList">회원 목록</a> (관리자만 접근)		
                                                        </div>                                                        
                                                    </div>
                                                </div>
                                           
                                            <!-- Email Sent End -->
                                            </div>
                                        </div>
                                    </div>

                                    <div id="styleSelector">

                                    </div>
                                </div>
                            </div>
                        
                    </div>
                </div>
                <div class="fixed-button">
                    <a href="https://codedthemes.com/item/guru-able-admin-template/" target="_blank" class="btn btn-md btn-primary">
                      <i class="fa fa-shopping-cart" aria-hidden="true"></i> Upgrade To Pro
                    </a>
                </div>
            </div>
        </div>

<!-- Required Jquery -->
<script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="/resources/assets/js/modernizr/modernizr.js"></script>
<!-- am chart -->
<script src="/resources/assets/pages/widget/amchart/amcharts.min.js"></script>
<script src="/resources/assets/pages/widget/amchart/serial.min.js"></script>
<!-- Todo js -->
<script type="text/javascript " src="/resources/assets/pages/todo/todo.js "></script>
<!-- Custom js -->
<script type="text/javascript" src="/resources/assets/pages/dashboard/custom-dashboard.js"></script>
<script type="text/javascript" src="/resources/assets/js/script.js"></script>
<script type="text/javascript " src="/resources/assets/js/SmoothScroll.js"></script>
<script src="/resources/assets/js/pcoded.min.js"></script>
<script src="/resources/assets/js/demo-12.js"></script>
<script src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
var $window = $(window);
var nav = $('.fixed-button');
    $window.scroll(function(){
        if ($window.scrollTop() >= 200) {
         nav.addClass('active');
     }
     else {
         nav.removeClass('active');
     }
 });
</script>
	</c:when>
	<c:otherwise>
    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="login-card card-block auth-body mr-auto ml-auto">
                        <form action="member/login" class="md-float-material" method="post">
                            <div class="text-center">
                                <img src="/resources/assets/images/auth/logo-dark2.png" alt="logo.png">
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-left txt-primary">Sign In</h3>
                                    </div>
                                </div>
                                <hr/>
                                <div class="input-group">
                                    <input type="email" name="member_id" class="form-control" placeholder="Your Email Address">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="password" name="member_pw" class="form-control" placeholder="Password">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-25 text-left">
                                    <div class="col-sm-7 col-xs-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input type="checkbox" value="">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">Remember me</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-sm-5 col-xs-12 forgot-phone text-right">
                                        <a href="member/joinForm" class="text-right f-w-600 text-inverse"> 회원가입</a>
                                    </div>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">Sign in</button>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-10">
                                        <p class="text-inverse text-left m-b-0">Thank you and enjoy our website.</p>
                                        <p class="text-inverse text-left"><b>Your Authentication Team</b></p>
                                    </div>
                                    <div class="col-md-2">
                                        <img src="/resources/assets/images/auth/Logo-small-bottom.png" alt="small-logo.png">
                                    </div>
                                </div>

                            </div>
                        </form>
                        <!-- end of form -->
                    </div>
                    <!-- Authentication card end -->
                </div>
                <!-- end of col-sm-12 -->
            </div>
            <!-- end of row -->
        </div>
        <!-- end of container-fluid -->
    </section>
    
    <script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/resources/assets/js/popper.js/popper.min.js"></script>
    <script type="text/javascript" src="/resources/assets/js/bootstrap/js/bootstrap.min.js"></script>
    <!-- jquery slimscroll js -->
    <script type="text/javascript" src="/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
    <!-- modernizr js -->
    <script type="text/javascript" src="/resources/assets/js/modernizr/modernizr.js"></script>
    <script type="text/javascript" src="/resources/assets/js/modernizr/css-scrollbars.js"></script>
    <script type="text/javascript" src="/resources/assets/js/common-pages.js"></script>
    
	</c:otherwise>
</c:choose>

</body>
</html>