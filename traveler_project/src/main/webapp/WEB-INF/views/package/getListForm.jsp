<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>여행을 더하다</title>
</head>
<body>
	<h4>여행상품 목록</h4><br>
	<c:forEach items="${listAll}" var="list">
	
	상품 번호 : ${list.package_pk }
	<br>
	</c:forEach>
	
	<br>
</body>
</html>