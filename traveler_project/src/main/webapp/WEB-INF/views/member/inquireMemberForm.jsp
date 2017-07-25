<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<div>
		<form action="/member/inquireMemberPro.go" method="post">
			제목<input type="text" name="counsel_title"><br>
			<textarea rows="10" cols="30" name="counsel_content"></textarea><br>
			<input type="submit" value="확인">
			<input type="button" value="취소" >			
		</form>
		</div>
</body>
</html>