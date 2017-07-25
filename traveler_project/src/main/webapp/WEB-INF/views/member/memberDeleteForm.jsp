<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/earlyaccess/jejugothic.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
#jb-container {
	width: 940px;
	margin: 0px auto;
	padding: 20px;
}
#jb-content1 {
    margin-top: 170px;
    margin-left: 520px;
}

#frame{
    width: 300px;
    height: 200px;
    margin-left: -50px;
    background-color: #E6E6E6
}

#text{
	margin-left: 30px;
    padding-top: 65px;

}

</style>
</head>
<body>

	<div id="jb-content1">
		<div id="frame">
		<div id="text">
		<form method="post" action="memberDelete.go">
		탈퇴하시겠습니까?<br>
		비밀번호를 입력해주세요.<br>
		<input type="password" name="confirm_pwd">
		<input type="submit" value="확인" class="btn btn-default">
		</div>
		</form>
		</div>
	</div>
</body>
</html>