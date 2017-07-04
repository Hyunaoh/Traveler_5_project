<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 로그인</title>
</head>
<body>
	<c:if test="${err == true}">
		<script type="text/javascript">
			alert("ID 또는 비밀번호 확인 바랍니다.");
		</script>
	</c:if>
	<form action="<c:url value="/j_spring_security_check" />" method="post">
		ID : <input type = "text" name="id" class="form-control"/><br>
		password : <input type = "password" name="pwd" class="form-control"/><br>
		<input type = "submit" value="login" class="btn btn-default"/> 
	</form>
</body>
</html>