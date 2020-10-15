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
                                        <a href="#">
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
                        <h1>User Timeline</h1>
                            <!-- Main-body start -->
                            <%-- <div class="main-body">
                                <div class="page-wrapper">
                                    <!-- Page-header start -->
                                    <div class="page-header card">
                                        <div class="row align-items-end">
                                            <div class="col-lg-8">
                                                <div class="page-header-title">
                                                    <i class="icofont icofont-layout bg-c-blue"></i>
                                                    <div class="d-inline">
                                                        <h4>Label Badge</h4>
                                                        <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="page-header-breadcrumb">
                                                    <ul class="breadcrumb-title">
                                                        <li class="breadcrumb-item">
                                                            <a href="index.html">
                                                                <i class="icofont icofont-home"></i>
                                                            </a>
                                                        </li>
                                                        <li class="breadcrumb-item"><a href="#!">Basic Components</a>
                                                        </li>
                                                        <li class="breadcrumb-item"><a href="#!">Label Badge</a>
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
                                                <!-- Badges card start -->
                                                <div class="card">
                                                    <div class="card-header">
                                                        <div class="card-header-left">
                                                            <h5>Badges</h5>
                                                            <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>
                                                        </div>
                                                        <div class="card-header-right">                                                             <i class="icofont icofont-spinner-alt-5"></i>                                                         </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <div class="row">
                                                            <div class="col-lg-4 col-xl-3 col-sm-12">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Default badge

                                                                    </div>

                                                                    <p>Use class <code>badge-default</code></p>
                                                                    <div>
                                                                        <label class="badge badge-default">5</label>
                                                                        <label class="badge badge-default">9</label>
                                                                        <label class="badge badge-default">15</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Primary badge

                                                                    </div>

                                                                    <p>Use class <code>badge-primary</code></p>
                                                                    <label class="badge badge-primary">5</label>
                                                                    <label class="badge badge-primary">9</label>
                                                                    <label class="badge badge-primary">15</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Success badge

                                                                    </div>

                                                                    <p>Use class <code>badge-success</code></p>
                                                                    <label class="badge badge-success">5</label>
                                                                    <label class="badge badge-success">9</label>
                                                                    <label class="badge badge-success">15</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Warning badge

                                                                    </div>

                                                                    <p>
                                                                        Use class <code>badge-warning</code>
                                                                    </p>
                                                                    <label class="badge badge-warning">5</label>
                                                                    <label class="badge badge-warning">9</label>
                                                                    <label class="badge badge-warning">15</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Danger badge

                                                                    </div>

                                                                    <p>
                                                                        Use class <code>bg-danger</code>
                                                                    </p>
                                                                    <label class="badge badge-danger">5</label>
                                                                    <label class="badge badge-danger">9</label>
                                                                    <label class="badge badge-danger">15</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Info badge

                                                                    </div>

                                                                    <p>
                                                                        Use class <code>badge-info</code>
                                                                    </p>
                                                                    <label class="badge badge-info ">5</label>
                                                                    <label class="badge badge-info">9</label>
                                                                    <label class="badge badge-info">15</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">inverse default badge

                                                                    </div>

                                                                    <p>
                                                                        Use class <code>badge-inverse-default</code>
                                                                    </p>
                                                                    <label class="badge badge-inverse-default">5</label>
                                                                    <label class="badge badge-inverse-default">9</label>
                                                                    <label class="badge badge-inverse-default">15</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Inverse primary badge

                                                                    </div>

                                                                    <p>
                                                                        Use class <code>badge-inverse-primary</code>
                                                                    </p>
                                                                    <label class="badge badge-inverse-primary">5</label>
                                                                    <label class="badge badge-inverse-primary">9</label>
                                                                    <label class="badge badge-inverse-primary">15</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Inverse success badge

                                                                    </div>

                                                                    <p>
                                                                        Use class <code>badge-inverse-success</code>
                                                                    </p>
                                                                    <label class="badge badge-inverse-success">5</label>
                                                                    <label class="badge badge-inverse-success">9</label>
                                                                    <label class="badge badge-inverse-success">15</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Inverse warning badge
                                                                    </div>

                                                                    <p>
                                                                        Use class <code>badge-inverse-warning</code>
                                                                    </p>
                                                                    <label class="badge badge-inverse-warning">5</label>
                                                                    <label class="badge badge-inverse-warning">9</label>
                                                                    <label class="badge badge-inverse-warning">15</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Inverse Danger badge

                                                                    </div>

                                                                    <p>
                                                                        Use class <code>badge-inverse-danger</code>
                                                                    </p>
                                                                    <label class="badge badge-inverse-danger">5</label>
                                                                    <label class="badge badge-inverse-danger">9</label>
                                                                    <label class="badge badge-inverse-danger">15</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4 col-xl-3 col-sm-6">
                                                                <div class="badge-box">
                                                                    <div class="sub-title">Inverse Info badge

                                                                    </div>

                                                                    <p>
                                                                        Use class <code>badge-inverse-info</code>
                                                                    </p>
                                                                    <label class="badge badge-inverse-info">5</label>
                                                                    <label class="badge badge-inverse-info">9</label>
                                                                    <label class="badge badge-inverse-info">15</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Badges card end -->
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <!-- Label card start -->
                                                <div class="card">
                                                    <div class="card-header">
                                                        <div class="card-header-left">
                                                            <h5>Labels</h5>
                                                            <span>lorem ipsum dolor sit amet, consectetur adipisicing elit</span>
                                                        </div>
                                                        <div class="card-header-right">                                                             <i class="icofont icofont-spinner-alt-5"></i>                                                         </div>
                                                    </div>
                                                    <div class="card-block">
                                                        <!-- labels -->
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <p>Use the <code>.label</code> class,&nbsp; followed by one of the six contextual classes <code>.label-default</code>, <code>.bg-primary</code>, <code>.bg-success</code>,
                                                                    <code>.bg-info</code>, <code>.bg-warning</code> or <code>.bg-danger</code>, within a <code>&lt;label&gt;</code> element to create a label:
                                                                </p>
                                                                <div class="label-main">
                                                                    <label class="label label-default">Default Label</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-primary">Primary Label</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-success">Success Label</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-info">Info Label</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-warning">Warning Label</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-danger">Danger Label</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-inverse">Inverse Label</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-inverse-default">Border Default</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-inverse-primary">Border Primary</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-inverse-success">Border Success</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-inverse-info">Border Label</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-inverse-warning">Border Warning</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-inverse-danger">Border Danger</label>
                                                                </div>
                                                                <div class="label-main">
                                                                    <label class="label label-inverse-info-border">Border Inverse</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Label card end -->
                                            </div>
                                        </div> 
                                </div>
                                <!-- Page body end -->
                            </div>
                        </div> --%>
                        <!-- Main-body end -->
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


<!-- Warning Section Starts -->
<!-- Older IE warning message -->
    <!--[if lt IE 9]>
<div class="ie-warning">
    <h1>Warning!!</h1>
    <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
    <div class="iew-container">
        <ul class="iew-download">
            <li>
                <a href="http://www.google.com/chrome/">
                    <img src="/resources/assets/images/browser/chrome.png" alt="Chrome">
                    <div>Chrome</div>
                </a>
            </li>
            <li>
                <a href="https://www.mozilla.org/en-US/firefox/new/">
                    <img src="/resources/assets/images/browser/firefox.png" alt="Firefox">
                    <div>Firefox</div>
                </a>
            </li>
            <li>
                <a href="http://www.opera.com">
                    <img src="/resources/assets/images/browser/opera.png" alt="Opera">
                    <div>Opera</div>
                </a>
            </li>
            <li>
                <a href="https://www.apple.com/safari/">
                    <img src="/resources/assets/images/browser/safari.png" alt="Safari">
                    <div>Safari</div>
                </a>
            </li>
            <li>
                <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                    <img src="/resources/assets/images/browser/ie.png" alt="">
                    <div>IE (9 & above)</div>
                </a>
            </li>
        </ul>
    </div>
    <p>Sorry for the inconvenience!</p>
</div>
<![endif]-->
<!-- Warning Section Ends -->
<!-- Required Jquery -->
<script type="text/javascript" src="/resources/assets/js/jquery/jquery.min.js"></script>
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

<!-- Custom js -->
<script>
    $(document).ready(function() {
        $('[data-toggle="popover"]').popover({
            html: true,
            content: function() {
                return $('#primary-popover-content').html();
            }
        });
    });

</script>
</body>

</html>