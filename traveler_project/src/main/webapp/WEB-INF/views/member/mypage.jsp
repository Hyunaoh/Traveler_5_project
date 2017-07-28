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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

#jb-container {
	width: 940px;
	margin: 0px auto;
	padding: 20px;
	height: 670px;
}
#jb-header {
	padding: 10px;
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
	margin-top: 20px;
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
	height: 400px;
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
    margin-left: 20px;
    padding-top: 5px;
}

</style>
</head>

<body style="background-color: #DEEEF4;">
	
	<!-- header -->
	<jsp:include page="../header.jsp" />

		<div id="jb-container" >
		<font size="3">
			<div id="jb-header">
			<h2>프로필관리</h2>
			</div>
				
				<!-- 프로필 사진  -->
				<div id="jb-content1">
				
					<div id="profile_photo">
					<c:if test="${ list.member_profile == null }">
						<img class="img-rounded"  style="width: 120px; height: 120px;" src="<c:url value='/resources/images/profile.jpg' />" alt="Cinque Terre">
					</c:if>
					<c:if test="${ list.member_profile != null }">
						<img src="<c:url value='/resources/images/profiles/${list.member_profile}' />" 
						class="img-rounded" alt="Cinque Terre" 	style="width: 120px; height: 120px;">
					</c:if>
					</div>
					
					<strong ><div style="margin-left: 44%; margin-top: 10px;">${ list.member_nickName }</div></strong>
					<hr>
					<div id="B">
					<i class="fa fa-plane" style="font-size:18px"></i>&nbsp;&nbsp;나의 가이드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="myGuideDetail.go">${ num_guide }개</a><br>
					<i class="fa fa-plane" style="font-size:18px"></i>&nbsp;&nbsp;나의 여  &nbsp;&nbsp; 행&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="myTripDetail.go">${ num_trip }개</a><br>
					</div>
					
				</div>	<!-- <div role="profile_photo"> -->



				<div id="jb-content2">
				<div style="margin-left: 520px; margin-bottom:-23px;">
				
				<a href="#" onclick="location='memberInsertDetail.go'">편집</a>
				</div>
					<div id="profile_photo" style="margin-left: 210px;">
					<c:if test="${ list.member_profile == null }">
						<img class="img-rounded" style="width: 120px; height: 120px;" src="<c:url value='/resources/images/profile.jpg' />" alt="Cinque Terre">
					</c:if>
					<c:if test="${ list.member_profile != null }">
						<img src="<c:url value='/resources/images/profiles/${list.member_profile}' />" 
						 class="img-rounded" border="1px solid black;" style="width: 120px; height: 120px;">
					</c:if>
					</div>
					<strong ><div style="margin-left: 44%; margin-top: 10px;">${ list.member_nickName }</div></strong>
					<div style="margin-left: 50px; margin-top:30px; padding: 10px; ">
					<table id="A">
					<tr>
					<td><i class="fa fa-plane" style="font-size:18px"></i>&nbsp;&nbsp;<strong>이름</strong></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>${ list.member_name }</td>
					</tr>
					<tr>
					<td><i class="fa fa-plane" style="font-size:18px"></i>&nbsp;&nbsp;<strong>이메일</strong></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>${ list.member_email }</td>
					</tr>
					<tr>
					<td><i class="fa fa-plane" style="font-size:18px"></i>&nbsp;&nbsp;<strong>연락처</strong></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td>${ list.member_tel }</td>
					</tr>
					<tr>
					<td><i class="fa fa-plane" style="font-size:18px"></i>&nbsp;&nbsp;<strong>SNS연동</strong></td>
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
		<!-- footer -->
		<jsp:include page="../footer.jsp" />
</body>
</html>