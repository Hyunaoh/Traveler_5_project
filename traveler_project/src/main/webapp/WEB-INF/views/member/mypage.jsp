<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>마이페이지</title>
<!-- Latest compiled and minified CSS -->
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
<style>

#jb-container {
	width: 940px;
	margin: 0px auto;
	padding: 20px;
}
#jb-header {
	padding: 20px;
	margin-bottom: 10px;
}
#jb-content1 {
	width: 33%;
	height: 300px;
	padding: 10px;
	margin-top: -10px;
	margin-right: 13px;
	float: left;
	background-color: white;
}

#profile_photo{
	margin-left: 30%;
	margin-top: 10px;
}

#jb-content2 {
	width: 64%;
	height: 450px;
	padding: 10px;
	margin-top: -10px;
	float: left;
	padding: 10px;
	background-color: white;
}

}
#jb-footer {
	float: none;
	height: 270px;
	margin-top: 375px;
	padding: 10px;
	
}

#jb-footer1 {
	float: left;
    width: 180px;
    margin-top: 15px;
    margin-left: 560px;
}

#jb-paging {
	margin-top: -150px;
	margin-left: 150px;
}
a {
    color: #424242;
    -webkit-transition: 0.5s;
    -o-transition: 0.5s;
    transition: 0.5s;
}

#A tr{
	height: 50px;
}

#B{
	margin-left: 40px;
    padding-top: 10px;
}

</style>
</head>

<body style="background-color: #E6E6E6;">
	
	<!-- header -->
	<jsp:include page="../header.jsp" />

		<div id="jb-container" >
		<font color="#151515;" size="3">
			<div id="jb-header">
			<h2>&nbsp;&nbsp;프로필관리</h2>
			</div>
				
				<!-- 프로필 사진  -->
				<div id="jb-content1">
				
					<div id="profile_photo">
					<c:if test="${ list.member_profile == null }">
						<img class="img-circle"  style="width: 120px; height: 120px;" src="<c:url value='/resources/images/profile.jpg' />" alt="Cinque Terre">
					</c:if>
					<c:if test="${ list.member_profile != null }">
						<img src="<c:url value='/resources/images/profiles/${list.member_profile}' />" 
						class="img-circle" alt="Cinque Terre" 	style="width: 120px; height: 120px;">
					</c:if>
					</div>
					
					<strong ><div style="margin-left: 44%; margin-top: 10px;">${ list.member_nickName }</div></strong>
					<hr>
					<div id="B">
					♥나의 가이드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="">${ num_guide }개</a><br>
					♥나의 여  &nbsp;&nbsp;&nbsp; 행&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="">${ num_trip }개</a><br>
					</div>
					
				</div>	<!-- <div role="profile_photo"> -->



				<div id="jb-content2">
				<div style="margin-left: 480px; margin-bottom:-40px;">
				<input type="button" value="편집" class="btn btn-default"
												onclick="location='memberInsertDetail.go'"
												>
				</div>
					<div id="profile_photo" style="margin-left: 200px;">
					<c:if test="${ list.member_profile == null }">
						<img class="img-circle"  style="width: 120px; height: 120px;" src="<c:url value='/resources/images/profile.jpg' />" alt="Cinque Terre">
					</c:if>
					<c:if test="${ list.member_profile != null }">
						<img src="<c:url value='/resources/images/profiles/${list.member_profile}' />" 
						class="img-circle" alt="Cinque Terre"  style="width: 120px; height: 120px;">
					</c:if>
					</div>
					<strong ><div style="margin-left: 44%; margin-top: 10px;">${ list.member_nickName }</div></strong>
					<div style="margin-left: 50px; margin-top:30px; padding: 10px; ">
					<table id="A">
					<tr>
					<td><strong>이름</strong></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>${ list.member_name }</td>
					</tr>
					<tr>
					<td><strong>이메일</strong></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>${ list.member_email }</td>
					</tr>
					<tr>
					<td><strong>연락처</strong></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>${ list.member_tel }</td>
					</tr>
					<tr>
					<td><strong>SNS연동</strong></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td></td>
					</tr>
					</table>
					</div>
				</div>		
				
				
			<div id="jb-footer">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div id="jb-footer1">
				<a href="/member/memberDeleteForm.go">회원탈퇴</a>	
				</div>
			</div>
		
		</font>
		</div>
		
		<!-- <div id="jb-container"> -->
</body>
</html>