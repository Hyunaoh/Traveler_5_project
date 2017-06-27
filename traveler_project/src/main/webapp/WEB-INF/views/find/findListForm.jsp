<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>여행을 더하다</title>
</head>
<body>
	<a href="findInsertForm.go">글 올리기</a>
	<hr>
	<c:forEach items="${findList}" var="list">
		제목 : <a href="findDetailForm.go?find_pk=${list.find_pk}">${list.find_title}</a><br>
		작성자 :  ${list.member_id}<br>
		작성시간 : ${list.find_regDate}<br>
		<a href="findUpdateForm.go?find_pk=${list.find_pk}">수정</a>
		<a href="findDeletePro.go?find_pk=${list.find_pk}">삭제</a>
		<hr>
	</c:forEach>
</body>
</html>