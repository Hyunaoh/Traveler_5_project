<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	<center>
	<div style="width: 70%;">
	<div class="panel panel-default">
	<div class="panel-heading"><h3>마이페이지</h3></div>
	<div class="panel-body">
	 <c:if test="${ list.member_profile == null || list.member_nickName == null || list.member_nationality == null || list.member_language == null  }">
	추가정보를 등록하여 가이드가 되어보세요!
	</c:if><br>
	<c:if test="${ list.member_profile == null }">
	<img style="width: 208px; height: 208px;" src="<c:url value='/resources/images/profile.jpg' />" alt="">
	</c:if>
	<c:if test="${ list.member_profile != null }">
	<img src="<c:url value='/resources/images/profiles/${list.member_profile}' />" class="img-rounded" alt="Cinque Terre" width="280" height="300">
	<br>
	</c:if>

	<font style="color: navy;">닉네임</font> 
	${ list.member_nickName }<br>
	국가<br>
	${ list.member_nationality }<br>
	구사언어: ${ list.member_language }<br>
	
	<font size="3">주소</font> 
	 ( ${ list.member_post} )<br>
	${ list.member_adrr }
	${	list.member_addrDetail }<br>
	<input type="button" value="추가정보수정" class="btn btn-default" onclick="location='memberInsertDetail.go'">
	<input type="button" value="회원탈퇴" class="btn btn-default" onclick="location='memberDeleteForm.go'">
	</div>
	</div>
	</div>
</body>

</html>