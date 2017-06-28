<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<head>
<title>Insert title here</title>
</head>
<body>
	<h4>상품 등록하기</h4>
	<form action="insertPackagePro.go" method="post">
		<input type="text" name="package_title" placeholder="제목을 입력해주세요">
		<input type="text" name="package_title" placeholder="제목을 입력해주세요">
		<input type="text" name="package_title" placeholder="제목을 입력해주세요">
		<input type="text" name="package_title" placeholder="제목을 입력해주세요">
		<input type="text" name="package_title" placeholder="제목을 입력해주세요">
		<input type="text" name="package_title" placeholder="제목을 입력해주세요">
		
		package_title, package_content, package_place1,
    		package_place2, package_place3, package_leadTime,
    		member_id, package_regDate
		
		
		<input type = "submit" value="등록">
	
	</form>

</body>
</html>