<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 로그인</title>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<!-- Include the API client and Google+ client. -->
	<script src="https://plus.google.com/js/client:platform.js" async defer></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style type="text/css">
		.login-container{
			margin-top : 5rem;
			margin-bottom: 10rem;
			padding: 5rem;
			border-top : 1px solid lightgray;
			border-left : 1px solid lightgray;
			border-right : 2.5px solid lightgray;
			border-bottom : 2.5px solid lightgray;
		}
		.login-img{
			height:400px;
		}
		.login-form{
			padding-left: 3rem;
		}
		.login-header{
			margin-bottom: 5rem;
			border-bottom : 1px solid lightgray;
		}
		.login-header h3{
			color: rgba(0, 0, 0, 0.5);
		}
		.login-header h2{
			font-style: italic;
		}
		.inline {
			display:inline-block;
		}
	</style>
</head>
<body>
	<c:if test="${err == true}">
		<script type="text/javascript">
			alert("ID 또는 비밀번호 확인 바랍니다.");
		</script>
	</c:if>
	
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<div class="container">
		<div class="login-container">
			<!-- login header -->
			<div class="row login-header">
				<div class="col-md-12">
					<h2>LOGIN</h2>
					<h3>로그인하고 원하는 여행을 하세요!</h3>
				</div>
			</div>
			
			<!-- login contents -->
			<div class="row">
				<div class="col-md-6 login-img" style="background-image:url('<c:url value="/resources/images/login-bg.jpg" />');"></div>
				<div class="col-md-6">
					<div class="login-form">
						<h3>Login</h3>
						<form action="<c:url value="/j_spring_security_check" />" method="post" name="loginForm">
							<c:if test="${memberVO.member_id eq null }">
								<div class="form-group ">
									<label for="name">ID</label>
									<input type = "text" name="id" class="form-control"/>
								</div>
								<div class="form-group ">
									<label for="email">Password</label>
									<input type = "password" name="pwd" class="form-control"/>
								</div>
							</c:if>
							<c:if test="${memberVO.member_id ne null }">
								<div class="form-group ">
									<label for="name">ID</label>
									<input type = "text" name="id" value ="${memberVO.member_id}" class="form-control"/>
								</div>
								<div class="form-group ">
									<label for="email">Password</label>
									<input type = "password" name="pwd" value ="${memberVO.member_pwd}" class="form-control"/>
								</div>
								<input type="hidden" id="howToLogin" value="1"/>
								<script type="text/javascript">
									$(function(){
										if($("#howToLogin").val() == 1){
											document.loginForm.submit();
										}
									})
								</script>
							</c:if>
							<div class="form-group ">
								<input class="btn btn-default btn-md" value="login" type="submit">
								<input class="btn btn-default btn-md" value="Sign-up" type="button" onclick="location='memberInsertForm.go'">
							</div>
							<hr>
							<div class="form-group">
								<div class="row">
									
									<div class="col-md-3">
										<!-- Goolgle the Sign-In button. -->
										<div id="gConnect" class="button">
											<button
												class="g-signin"
												data-scope="email"
												data-clientid="341469578879-3gtopv1fjej2s0vhvh4k8igk8igmckgs.apps.googleusercontent.com"
												data-callback="onSignInCallback"
												data-theme="light"
												data-cookiepolicy="single_host_origin"></button>
										</div>
									</div>
									
									 <!-- 네이버아이디로로그인 버튼 노출 영역 -->
									<div class="col-md-3">
										<div id="naver_id_login"></div>
									</div>
								
									<!-- facebook 로그인 버튼 -->
									<div class="col-md-3">
										<div scope="public_profile, email" onlogin="checkLoginState();" class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false"></div>
									</div>
									
								</div>
							</div>
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<!-- header -->
	<jsp:include page="../footer.jsp" />
	
	
	<!-- facebook 회원정보 보내줌 -->
	<form action="facebookLogin.go" name="facebookInfo" method="post">
		<input type="hidden" name="f_email" value="">
		<input type="hidden" name="f_name" value="">
		<input type="hidden" name="f_gender" value="">
	</form>
	<script type="text/javascript">
  	var naver_id_login = new naver_id_login("DqftzUBEom_HWFvpmKTh", "http://localhost:8080/member/navercallback.go");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8080/");
  	naver_id_login.setState(state);
  	/* naver_id_login.setPopup(); */
  	naver_id_login.init_naver_id_login();
  </script>
	<script>
		// 로그인 상태
		function statusChangeCallback(response) {
			if (response.status === 'connected') {
				// Logged into your app and Facebook.
				loginProcess();
				FB.logout();
				window.setInterval(function(){
					if($("[name=f_name]").val() != null && $("[name=f_gender]").val() != null &&$("[name=f_email]").val() != null){
						document.facebookInfo.submit();
					}
				}, 1000)
			}
		}
		
		function loginProcess() {
			FB.api('/me', function(response) {
				$("[name=f_name]").val(response.name);
			});
			FB.api('/me', {fields: 'gender'}, function(response) {
				$("[name=f_gender]").val(response.gender);
			});
			FB.api('/me', {fields: 'email'}, function(response) {
				$("[name=f_email]").val(response.email);
			});
		}
		
		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}
	</script>
	<!-- google 회원정보 보내줌 -->
	<form action="googleLogin.go" name="googleInfo" method="post">
		<input type="hidden" name="email" value="">
		<input type="hidden" name="name" value="">
		<input type="hidden" name="gender" value="">
		<input type="hidden" name="pictureUrl" value="">
		<input type="hidden" name="linkUrl" value="">
	</form>
	<!-- Google login -->
	<script>
		var google_access_token = "";
		var state ="";
		function onSignInCallback(resp) {
			if (resp['access_token']) {
				// 승인 성공
				google_access_token = resp['access_token'];
				var idToken = resp['id_token'];
				gapi.auth.setToken(resp); // 반환된 토큰을 저장합니다.
				if (window.sessionStorage) {
	                sessionStorage.setItem('access_token', google_access_token);
	            }
				
				$("#gConnect").hide(); // 사용자가 승인되었으므로 로그인 버튼을 숨김
				state="google";
				getEmail();
			} else if (resp['error']) {
				// 오류가 발생했습니다.
				// 가능한 오류 코드:
				//   "access_denied" - 사용자가 앱에 대한 액세스 거부
				//   "immediate_failed" - 사용자가 자동으로 로그인할 수 없음
				/*  alert('오류 발생: ' + authResult['error']); */
			}
		}
	
		function getEmail() {
			// userinfo 메소드를 사용할 수 있도록 oauth2 라이브러리를 로드합니다.
			gapi.client.load('oauth2', 'v2', function() {
				var request = gapi.client.oauth2.userinfo.get();
				request.execute(getEmailCallback);
			});
		}
		function getEmailCallback(obj) {
			if(state =='google'){
				document.googleInfo.email.value = obj['email'];
				document.googleInfo.name.value = obj['name'];
				document.googleInfo.gender.value = obj['gender'];
				document.googleInfo.pictureUrl.value = obj['picture'];
				document.googleInfo.linkUrl.value = obj['link'];
				document.googleInfo.submit();
			}
		}
	</script>
	<!-- Facebook SDK -->
	<script>
		// facbook SDK
		window.fbAsyncInit = function() {
			FB.init({
				appId : '480328379027117', // 내꺼
				cookie : true,
				xfbml : true,
				version : 'v2.8'
			});
			FB.AppEvents.logPageView();
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
</body>
</html>