<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="CodedThemes">
    <meta name="keywords" content=" Admin , Responsive, Landing, Bootstrap, App, Template, Mobile, iOS, Android, apple, creative app">
    <meta name="author" content="CodedThemes">
    <!-- Favicon icon -->
    <link rel="icon" href="/resources/assets/images/favicon.ico" type="image/x-icon">
    <!-- Google font--><link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,800" rel="stylesheet">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/bootstrap/css/bootstrap.min.css">
    <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/icon/themify-icons/themify-icons.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/icon/icofont/css/icofont.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="/resources/assets/css/style.css">
    
<script type="text/javascript">

	function formCheck(){
		var member_pw = document.getElementById('member_pw').value;
		var member_pw_check = document.getElementById('member_pw_check').value;
	
		if(member_pw != member_pw_check){
			alert("비밀번호 틀림");
			return false;
			}
	
		return true;
	}

	/* function check(){
		var id = document.getElementById("member_id").value;
		if(id == ""){
				alert("아이디 입력해 주세요");
			}else{
		location.href="check?member_id="+id;
			}
	} */

</script>

</head>
<body class="fix-menu">
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
    <section class="login p-fixed d-flex text-center bg-primary common-img-bg">
        <!-- Container-fluid starts -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <!-- Authentication card start -->
                    <div class="signup-card card-block auth-body mr-auto ml-auto">
                        <form action="join" onsubmit="return formCheck();" 
                        class="md-float-material" method="post">
                            <div class="text-center">
                                <img src="/resources/assets/images/auth/logo-dark2.png" alt="logo.png">
                            </div>
                            <div class="auth-box">
                                <div class="row m-b-20">
                                    <div class="col-md-12">
                                        <h3 class="text-center txt-primary">Sign up. It is fast and easy.</h3>
                                    </div>
                                </div>
                                <hr/>
                                <div class="input-group">
                                    <input type="text" name="member_nm" class="form-control" placeholder="Choose Username">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="text" id="member_id" name="member_id" class="form-control" placeholder="Your Email Address">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="password" name="member_pw" id="member_pw" class="form-control" placeholder="Choose Password">
                                    <span class="md-line"></span>
                                </div>
                                <div class="input-group">
                                    <input type="password" id="member_pw_check" class="form-control" placeholder="Confirm Password">
                                    <span class="md-line"></span>
                                </div>
                                <div class="row m-t-25 text-left">
                                    <div class="col-md-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input type="checkbox" value="">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">I read and accept <a href="#">Terms &amp; Conditions.</a></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="checkbox-fade fade-in-primary">
                                            <label>
                                                <input type="checkbox" value="">
                                                <span class="cr"><i class="cr-icon icofont icofont-ui-check txt-primary"></i></span>
                                                <span class="text-inverse">Send me the <a href="#!">Newsletter</a> weekly.</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row m-t-30">
                                    <div class="col-md-12">
                                        <button type="submit" class="btn btn-primary btn-md btn-block waves-effect text-center m-b-20">Sign up now.</button>
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
	
		<%-- ID : <input type="text" id="member_id" name="member_id"> ${repeat } <input type="button" value="중복확인" onclick="check()"><br>
		비밀번호 : <input type="password" name="member_pw" id="member_pw"> <br>
		비밀번호 확인 : <input type="password" id="member_pw_check"> <br>
		이름 : <input type="text" name="member_nm"> <br> --%>
	
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
    
</body>
</html>