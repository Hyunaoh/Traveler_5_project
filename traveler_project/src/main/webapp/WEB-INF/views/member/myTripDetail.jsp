<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>여행가 - 여행을 더하다</title>
</head>
<style>
#container {
	height: 400px
}
</style>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<div id="container">
	<!-- 개인 패키지  -->
		<c:forEach items="${ list }" var="list">
			<img style="width: 180px; height: 180px;"
				 src="<c:url value="/resources/images/group_img/${list.group_pak_photo}" />" alt="">
		</c:forEach>
		</div>


	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>