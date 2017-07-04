<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 로그인</title>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="341469578879-3gtopv1fjej2s0vhvh4k8igk8igmckgs.apps.googleusercontent.com">
    
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
	<form action="<c:url value="/j_spring_security_check" />" method="post">
		ID : <input type = "text" name="id" class="form-control"/><br>
		password : <input type = "password" name="pwd" class="form-control"/><br>
		<input type = "submit" value="login" class="btn btn-default"/> 
	</form>
	<br>
	<a class="btn btn-default btn-lg"
	href="https://accounts.google.com/o/oauth2/v2/auth?scope=https%3a%2f%2fwww.googleapis.com%2fauth%2fuserinfo.email&access_type=offline&include_granted_scopes=true&state=state_parameter_passthrough_value&redirect_uri=http%3a%2f%2flocalhost%3a8080%2fmember%2fgoogleLoginForm.go&response_type=code&client_id=341469578879-3gtopv1fjej2s0vhvh4k8igk8igmckgs.apps.googleusercontent.com">Google 로그인</a>

</body>
</html>