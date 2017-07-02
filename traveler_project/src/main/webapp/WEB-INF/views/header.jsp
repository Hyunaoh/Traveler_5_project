<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>여행가 - 여행을 더하다</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />
	
 	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	<!-- Animate.css -->
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/animate.css"/>">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/icomoon.css"/>">
	<!-- Simple Line Icons -->
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/simple-line-icons.css"/>">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/magnific-popup.css"/>">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/bootstrap.css"/>">
	<!-- 
	Default Theme Style 
	You can change the style.css (default color purple) to one of these styles
	
	1. pink.css
	2. blue.css
	3. turquoise.css
	4. orange.css
	5. lightblue.css
	6. brown.css
	7. green.css

	-->
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap/style.css"/>">
	<!-- Styleswitcher ( This style is for demo purposes only, you may delete this anytime. ) -->
	<link rel="stylesheet" id="theme-switch" href="<c:url value="/resources/css/bootstrap/style.css"/>">
	<!-- End demo purposes only -->
	
	<!-- Modernizr JS -->
	<script src="<c:url value="/resources/js/bootstrap/modernizr-2.6.2.min.js"/>"></script>
	
	<!-- 06.30 오현아 알람 쪽지 js -->
	<script src="<c:url value= "/resources/js/msg_alarm/msg_alarm.js"/>"></script>
	
</head>
<body>
	<header role="banner" id="fh5co-header">
		<div class="container">
			<!-- <div class="row"> -->
		    <nav class="navbar navbar-default">
	        <div class="navbar-header">
	        	<!-- Mobile Toggle Menu Button -->
				<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
	        	<a class="navbar-brand" href="<c:url value="/home.go" />">여행가</a>
	        </div>
	        <div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="#" data-nav-section="home"><span>Home</span></a></li>
					<li><a href="#" onclick="location='<c:url value="/find/findListForm.go" />'"><span>가이드 찾기</span></a></li>
					<li><a href="#" data-nav-section="testimonials"><span>Testimonials</span></a></li>
					<li><a href="#" data-nav-section="services"><span>Services</span></a></li>
					<li><a href="#" id="messageBtn" onclick="location='<c:url value="/message/messageListView.go" />'"><span>쪽지</span></a></li>
					<se:authorize access="isAnonymous()">
						<li><a href="#" onclick="location='<c:url value="/member/loginForm.go" />'"><span>로그인</span></a></li>
						<li><a href="#" onclick="location='<c:url value="/member/memberInsertForm.go" />'"><span>회원가입</span></a></li>
					</se:authorize>
					<se:authorize access="isAuthenticated()">
						<li><a href="#" onclick="location='<c:url value="/j_spring_security_logout" />'"><span>로그아웃(<se:authentication property='principal.username' />)</span></a></li>
					</se:authorize>
				</ul>
	        </div>
		    </nav>
		  <!-- </div> -->
	  </div>
	</header>
	
	<!-- jQuery -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.min.js"/>"></script>
	<!-- jQuery Easing -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.easing.1.3.js"/>"></script>
	<!-- Bootstrap -->
	<script src="<c:url value="/resources/js/bootstrap/bootstrap.min.js"/>"></script>
	<!-- Waypoints -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.waypoints.min.js"/>"></script>
	<!-- Stellar Parallax -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.stellar.min.js"/>"></script>
	<!-- Counter -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.countTo.js"/>"></script>
	<!-- Magnific Popup -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.magnific-popup.min.js"/>"></script>
	<script src="<c:url value="/resources/js/bootstrap/magnific-popup-options.js"/>"></script>

	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="<c:url value="/resources/js/bootstrap/google_map.js"/>"></script>

	<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.style.switcher.js"/>"></script>
	
	<!-- Main JS (Do not remove) -->
	<script src="<c:url value="/resources/js/bootstrap/main.js"/>"></script>
</body>
</html>