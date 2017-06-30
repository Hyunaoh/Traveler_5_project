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
	<c:if test="${check == true}">
		<script type="text/javascript">
			alert("신고 완료! 운영진이 검사 후 조치 들어가겠습니다.");
		</script>
	</c:if>
	<c:if test="${check == false}">
		<script type="text/javascript">
			alert("Error!");
		</script>
	</c:if>
	<meta http-equiv="Refresh" content="0; url='findListForm.go'"/>
</body>
</html>