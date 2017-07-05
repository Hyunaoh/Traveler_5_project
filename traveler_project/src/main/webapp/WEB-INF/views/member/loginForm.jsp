<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 로그인</title>
	<!-- Include the API client and Google+ client. -->
	<script src="https://plus.google.com/js/client:platform.js" async defer></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<c:if test="${err == true}">
		<script type="text/javascript">
			alert("ID 또는 비밀번호 확인 바랍니다.");
		</script>
	</c:if>
	
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<br><br><br><br><br><br>
	<!-- contents -->
	<form action="<c:url value="/j_spring_security_check" />" method="post" name="loginForm">
		<c:if test="${memberVO.member_id eq null }">
			ID : <input type = "text" name="id" class="form-control"/><br>
			password : <input type = "password" name="pwd" class="form-control"/><br>
		</c:if>
		<c:if test="${memberVO.member_id ne null }">
			ID : <input type = "text" name="id" value ="${memberVO.member_id}" class="form-control"/><br>
			password : <input type = "password" name="pwd" value ="${memberVO.member_pwd}" class="form-control"/><br>
			<input type="hidden" id="howToLogin" value="1"/>
			<script type="text/javascript">
				$(function(){
					if($("#howToLogin").val() == 1){
						document.loginForm.submit();
					}
				})
			</script>
		</c:if>
		<input type = "submit" value="login" class="btn btn-default"/> 
	</form>
	<br>
	
 	<!-- Container with the Sign-In button. -->
	<div id="gConnect" class="button">
		<button class="g-signin"
			data-scope="email"
			data-clientid="341469578879-3gtopv1fjej2s0vhvh4k8igk8igmckgs.apps.googleusercontent.com"
			data-callback="onSignInCallback"
			data-theme="light"
			data-cookiepolicy="single_host_origin"></button>
	</div>
	<!-- 회원정보 보내줌 -->
	<form action="googleLogin.go" name="googleInfo" method="post">
		<input type="hidden" name="email" value="">
		<input type="hidden" name="name" value="">
		<input type="hidden" name="gender" value="">
		<input type="hidden" name="pictureUrl" value="">
		<input type="hidden" name="linkUrl" value="">
	</form>
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
</body>
</html>