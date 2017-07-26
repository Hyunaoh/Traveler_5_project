<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>여행가 - 여행을 더하다</title>
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- 06.30 오현아 알람 쪽지 및 user 정보 js -->
	<script src="<c:url value="/resources/js/message/alarm_conn.js"/>"></script>
	<script type="text/javascript">
		/* 구글 로그아웃 */
		function disconnectUser() {
			var token = sessionStorage.getItem("access_token");
			var revokeUrl = 'https://accounts.google.com/o/oauth2/revoke?token=' + token; // 로그아웃 위해 토큰값을 보내줌
			var nlogoutUrl = 'http://nid.naver.com/nidlogin.logout'; //네이버 로그아웃 url
			var dataForm={
					token : revokeUrl
			};
			$.ajax({
				type : 'GET',
				url : nlogoutUrl,
				async : false,
				data: JSON.stringify(dataForm),
				contentType : "application/json",
				dataType : 'jsonp',
				success : function(nullResponse) {
					//성공
					alert("네이버 로그아웃 성공 ");
				},
				error : function(e){
					
				}
			});
			if(token != null){
				$.ajax({
					type : 'GET',
					url : revokeUrl,
					async : false,
					data: JSON.stringify(dataForm),
					contentType : "application/json",
					dataType : 'jsonp',
					success : function(nullResponse) {
						// 성공
						location.href = $("#logout_uri").val();
					},
					error : function(e) {
					}
				});
			} else{
				location.href = $("#logout_uri").val(); // 로그아웃 한 페이지로 이동
			}
		}
	</script>
	
	<!-- Header page CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/header.css" />" />
</head>
<!-- 로그인 했을때 알람 -->
<se:authorize access="isAuthenticated()">
<body onload="alarm_access();">
</se:authorize>
<!-- 비회원인 경우 알람 없음 -->
<se:authorize access="isAnonymous()">
<body>
</se:authorize>

	<!-- logout 주소 -->
	<input type="hidden" id="logout_uri" value="<c:url value="/j_spring_security_logout"/>"/>

	<!-- Header -->
	<nav class="navbar navbar-default" id="header-init">
		<div class="container">
		
			<!-- 상단 Menu -->
			<div class="row">
			
				<!-- 사이트 로고 -->
				<div class="navbar-header">
					<a class="navbar-brand" href="<c:url value="/home.go" />">여행가</a>
				</div>
				
				<ul class="nav navbar-nav navbar-right">
					<!-- 로그인 안했을 경우 -->
					<se:authorize access="isAnonymous()">
						<li><a href="#" onclick="location='<c:url value="/member/loginForm.go" />'">로그인</a></li>
						<li><a href="#" onclick="location='<c:url value="/member/memberInsertForm.go" />'">회원가입</a></li>
						<!-- google 사이트 언어 번역 -->
						<li><div id="google_translate_element"></div></li>
						<script type="text/javascript">
							function googleTranslateElementInit() {
							  new google.translate.TranslateElement({pageLanguage: 'ko', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
							}
						</script>
						<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
					</se:authorize>
					
					<!-- 로그인 했을때만 보임 -->
					<se:authorize access="isAuthenticated()">
						<li><a href="#" onclick="location='<c:url value="/message/messageListView.go" />'">쪽지</a></li>
						<li><a href="#" onclick="location='<c:url value="/plan/myPlanList.go" />'">여행계획</a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">마이페이지<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<c:url value="/store/selectAll.pet" var = "storeSelectAll"></c:url>
								<li><a href="#" onclick="location='<c:url value="/member/mypageForm.go" />'">프로필 관리</a></li>
								<c:url value="/store/inputForm.pet" var = "storeInputForm"></c:url>
							 	<li><a href="#" onclick="location='/member/guideForm.go'">가이드 신청</a></li>
							</ul>
						</li>
						
						
						
						
						<se:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href="#" onclick="location='<c:url value="/admin/adminForm.go" />'">관리자</a></li>
						</se:authorize>
						<li><a href="#" onclick="disconnectUser()">로그아웃(<se:authentication property='principal.username' />)</a></li>
					</se:authorize>
				</ul>
			</div>
			
			<!-- 하단 Menu -->
			<div class="row">
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="#" onclick="location='<c:url value="/find/findListForm.go" />'">가이드 찾기</a></li>
						<li><a href="#" onclick="location='<c:url value="/package/getAllPackage.go" />'">싱글 패키지</a></li>
						<li><a href="#" onclick="location='<c:url value="/group/groupListForm.go" />'">단체 패키지</a></li>
					</ul>
				</div>
			</div>
			
		</div>
	</nav>
	<!-- Header 끝 -->
	
	<!-- jQuery -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.min.js"/>"></script>
	
	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
	<script src="<c:url value="/resources/js/bootstrap/google_map.js"/>"></script>

</body>
</html>