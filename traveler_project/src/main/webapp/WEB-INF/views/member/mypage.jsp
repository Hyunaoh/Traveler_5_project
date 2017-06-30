<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<h2>마이페이지</h2><br>
	 <c:if test="${ list.member_profile == null || list.member_nickName == null || list.member_nationality == null || list.member_language == null  }">
	추가정보를 등록하여 가이드가 되어보세요!
	</c:if><br>
	<hr>
	<c:if test="${ list.member_profile == null }">
	<img style="width: 208px; height: 208px;" src="${pageContext.request.contextPath}/images/profile.jsp" />
	</c:if>

	<c:if test="${ list.member_profile != null }">
	<img style="width: 208px; height: 208px;" src="<c:url value="/resources/images/profiles/${list.member_profile}" />" alt="">
	</c:if>
	닉네임: ${ list.member_nickName }<br>
	국가	: ${ list.member_nationality }<br>
	구사언어: ${ list.member_language }<br>
	주소: ( ${ list.member_post} )${ list.member_adrr }<br>
	${list.member_addrDetail }
	<input type="button" value="추가정보수정" onclick="location='memberInsertDetail.go'">
	</div>
</body>
</html>