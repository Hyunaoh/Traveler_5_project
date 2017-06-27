<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가</title>
</head>
<body>
	<c:if test="${check == true}">
		<script type="text/javascript">
			alert("완료");
		</script>
	</c:if>
	<c:if test="${check == false}">
		<script type="text/javascript">
			alert("Error");
		</script>
	</c:if>
	<meta http-equiv="Refresh" content="0; url='findListForm.go'"/>
</body>
</html>