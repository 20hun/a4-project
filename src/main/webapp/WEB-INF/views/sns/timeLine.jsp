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
    
	<style type="text/css">
		#chatroom{
			width: 300px;
			height: 300px;
			border: 1px solid;
		}
	</style>
		
	<script src="<c:url value="/resources/js/jquery.min.js" />"></script>
	<script src="<c:url value="/resources/js/sockjs.js" />"></script>
	<script src="<c:url value="/resources/js/stomp.js" />"></script>
	
	<script type="text/javascript">
	
		var didScroll = false;
			$(window).on('scroll', function(){didScroll = true;});

		setInterval(function(){
			var bottomHeight = $(window).scrollTop() + 755;
			var docHeight = $(document).height();
			var lastid = document.getElementById("follow_id").value;
			
			if(didScroll){
				didScroll = false;
				if(bottomHeight > docHeight){
					var lastbno = $(".scrolling:last").attr("data-bno");
					
					$.ajax({
						type: 'post',
						url: '/sns/infiniteScrollDown',
						headers:{
							"Content-Type":"application/json",
							"X-HTTP-Method-Override":"POST"
						},
						dataType: 'json',
						data: JSON.stringify({
							board_no: lastbno,
							member_id: lastid
							}),
							success: function(data){

								var str="";

								if(data != ""){
									$(data).each(
										function(){
											console.log(this);
											str += 	"<div class="+"'scrolling2'"+">"
												+	"<div class="+"'card'"+">"
												+	"<div class="+"'listToChange'"+">"
												+	"<input class="+"'scrolling'"+" type="+"'hidden'"+" data-bno='"+this.board_no+"' value='"+this.board_no+"'>"
												+		"<table class="+"'table table-hover'"+">"
												+		"<tr>"
												+			"<td>title</td>"
												+			"<td><input style="+"'border: none;'"+" type="+"'text'"+" id="+"'title'"+" value='"+this.board_title+"'></td>"
												+		"</tr>"
												+		"<tr>"
												+			"<td>content</td>"
												+			"<td><textarea style="+"'border: none; width: 250'"+" id="+"'content'"+" form="+"'inform'"+" cols="+"'40'"+" rows="+"'3'"+">"+this.board_content+"</textarea></td>"
												+		"</tr>"	
												+		"<tr>"
												+			"<td>upload time</td>"
												+			"<td><input style="+"'border: none;'"+" type="+"'text'"+" id="+"'indate'"+" value='"+this.board_indate+"'></td>"
												+		"</tr>"	
												+		"<tr>"
												+			"<td>view</td>"
												+			"<td><input style="+"'border: none;'"+" type="+"'text'"+" id="+"'view'"+" value='"+this.board_view+"'></td>"
												+		"</tr>"	
												+		"</table>"
												+		"<img width="+"'200'"+" height="+"'200'"+" src="+"'/board/download?board_no="+this.board_no+"'>"														
                        						+	"</div>"
                        						+	"</div>"
                        						+	"</div>"
											});
									$(".scrolling2:last").after(str);									
								}else{
									alert("더 불러올 데이터가 없습니다.");
									}									
							}
					});

				}
			}
		}, 250);
	
		$(function(){
			connect();
			
			$("#send").on("click",function(){
				sendMessage();
			})
			
			document.onkeydown = function ( event ) {
			    if ( event.keyCode == 116  // F5
			        || event.ctrlKey == true && (event.keyCode == 82) // ctrl + r
			    ) {
			        //접속 강제 종료
			        disconnect();
			        // keyevent
			        event.cancelBubble = true; 
			        event.returnValue = false; 
			        setTimeout(function() {
			            window.location.reload();
			        }, 100);
			        return false;
			    }
			}
			
		})
	
		var stompClient = null;
		
		//채팅방 연결
		function connect() {
			// WebsocketMessageBrokerConfigurer의 registerStompEndpoints() 메소드에서 설정한 endpoint("/endpoint")를 파라미터로 전달
			var socket = new SockJS('/endpoint');
			stompClient = Stomp.over(socket);
			stompClient.connect({}, function(frame) {
				
				// 메세지 구독
				// WebsocketMessageBrokerConfigurer의 configureMessageBroker() 메소드에서 설정한 subscribe prefix("/subscribe")를 사용해야 함
				stompClient.subscribe('/subscribe/basicChatRoom', function(message){
					var data = JSON.parse(message.body);
					$("#chatroom").append(data.send_id+" 님 -> "+data.message+"<br />");
				});
				
			});
		}
		
		//채팅 메세지 전달
		function sendMessage() {
			var str = $("#chatbox").val();
			var r_id = document.getElementById("follow_id").value;
			str = str.replace(/ /gi, '&nbsp;')
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
			if(str.length > 0){
				// WebsocketMessageBrokerConfigurer의 configureMessageBroker() 메소드에서 설정한 send prefix("/")를 사용해야 함
				stompClient.send("/basicChatRoom", {}, JSON.stringify({
					message : str
					,receive_id : r_id
				}));
				
			}
			
			$("#chatbox").val("");
		}
		
		// 채팅방 연결 끊기
		function disconnect() {
			stompClient.disconnect();
		}
	</script>
</head>
  <body>
    <!-- Pre-loader start -->
    <div class="theme-loader">
        <div class="ball-scale">
            <div class='contain'>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
                <div class="ring"><div class="frame"></div></div>
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
                        <a class="mobile-search morphsearch-search" href="#">
                            <i class="ti-search"></i>
                        </a>
                        <a href="/">
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
                                <a href="/member/mypage">
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
                                        <a href="/member/mypage">
                                            <i class="ti-user"></i> Profile
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-email"></i> My Messages
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/member/update">
                                            <i class="ti-lock"></i> Lock Screen
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/member/logout">
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
                                    <!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont-layout bg-c-blue"></i>
                                                    <div class="d-inline">
                                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
															  <div class="modal-dialog">
															    <div class="modal-content">
															      <div class="modal-header">
															        <h5 class="modal-title" id="exampleModalLabel">채팅방</h5>
															        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
															          <span aria-hidden="true">&times;</span>
															        </button>
															      </div>
															      <div class="modal-body">
															        <input type="text" id="chatbox"><input type="button" id="send" value="전송"><br><br>
																	<div id="chatroom">
																	</div>
															      </div>
															      <div class="modal-footer">
															        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
															        <button type="button" onclick="location.href='/member/write?board_no=5'" class="btn btn-primary">Save changes</button>
															      </div>
															    </div>
															  </div>
															</div>
                                                        <h4>Label Badge</h4>
                                                        <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="page-header-breadcrumb">
                                                    <ul class="breadcrumb-title">
                                                        <li class="breadcrumb-item">
                                                            <a href="#">
                                                                <i class="icofont icofont-home"></i>
                                                            </a>
                                                        </li>
                                                        <li class="breadcrumb-item"><span name="toggle-control">팔로우</span>
                                                        <span name="toggle-control" style="display: none;">팔로우 취소</span>
                                                        </li>
                                                        <li class="breadcrumb-item"><i class="icofont icofont-chat" id="chat_icon"></i>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Page-header end -->
                                    
                                    <!-- Page body start -->
                                    <div class="page-body">                                        
                                        <div class="row">
                                            <div class="col-sm-12">
                                            <div class="scrolling2">
                                            <!-- <div class="scrollLocation">  -->  
                                            <c:forEach items="${list }" var="data" varStatus="status">
                                            <input class="scrolling" type="hidden" data-bno="${data.board_no }" value="${data.board_no }">
                                                <div class="card">                                                                                              
                                                            <table class="table table-hover">
        															<tr>
        																<td>title</td>
        																<td><input style="border: none;" type="text" id = "title" value="${data.board_title}"></td>
        															</tr>
        															<tr>
        																<td>content</td>
        																<td><textarea style="border: none; width: 250" id="content" form="inform" cols="40" rows="3">${data.board_content}</textarea></td>
        															</tr>
        															<tr>
        																<td>upload time</td>
        																<td><input style="border: none;" type="text" id = "indate" value="${data.board_indate}"></td>
        															</tr>
        															<tr>
        																<td>view</td>
        																<td><input style="border: none;" type="text" id = "view" value="${data.board_view}"></td>
        															</tr>
        														</table> 
        														<img id="bubble_image" width="200" height="200" src="/board/download?board_no=${data.board_no}">       														
                                                </div>
                                                </c:forEach>
                                                </div>
                                                <!-- Label card end -->
                                                </div>
                                            </div>
                                        </div> 
                                </div>
                                <!-- Page body end -->
                            </div>
                        </div>
                        <!-- Main-body end -->
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript" src="/resources/assets/js/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/popper.js/popper.min.js"></script>
<script type="text/javascript" src="/resources/assets/js/bootstrap/js/bootstrap.min.js"></script>
<!-- jquery slimscroll js -->
<script type="text/javascript" src="/resources/assets/js/jquery-slimscroll/jquery.slimscroll.js"></script>
<!-- modernizr js -->
<script type="text/javascript" src="/resources/assets/js/modernizr/modernizr.js"></script>
<script type="text/javascript" src="/resources/assets/js/modernizr/css-scrollbars.js"></script>
<!-- classie js -->
<script type="text/javascript" src="/resources/assets/js/classie/classie.js"></script>
<script type="text/javascript" src="/resources/assets/js/script.js"></script>
<script src="/resources/assets/js/pcoded.min.js"></script>
<script src="/resources/assets/js/demo-12.js"></script>
<script src="/resources/assets/js/jquery.mCustomScrollbar.concat.min.js"></script>

<input type="hidden" value="${list[0].member_id}" id="follow_id">

<script type="text/javascript">

	var follow_id;
	var check = 0;

	$("span[name='toggle-control']").click(function(){

		follow_id  = document.getElementById("follow_id").value;
		
		if(check == 0){
		$.ajax({
			url: "/sns/follow",
			type:"get",
			data: {
				msg: follow_id
			},
			success: function(data) {alert("통신 성공!");console.log(data)
			//$("#memberId").html(data.member_id);
			//$("#a_tag").attr("href", "/sns/timeLine?member_id="+data.member_id)
			//$("#title").attr("value", data.board_title);
			check = data;
			},
			error: function(e) {alert("통신 실패...");console.log(e);}
		});	
		}else{
		$.ajax({
			url: "/sns/followCancle",
			type:"get",
			data: {
				msg: follow_id
			},
			success: function(data) {alert("통신 성공!");console.log(data)
			//$("#memberId").html(data.member_id);
			//$("#a_tag").attr("href", "/sns/timeLine?member_id="+data.member_id)
			//$("#title").attr("value", data.board_title);
			check = data;
			},
			error: function(e) {alert("통신 실패...");console.log(e);}
		});	
		}
		$("#target").toggle();
		$("span[name='toggle-control']").toggle();
		});

	$("#chat_icon").click(function(){
		$('#exampleModal').modal('show');
	});
</script>

</body>

</html>