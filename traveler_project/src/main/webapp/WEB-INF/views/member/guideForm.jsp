<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
</script>
</head>
<body>

	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<div>
	<img style="width:100%;" src="<c:url value='/resources/images/guideForm.jpg' />" alt="">
	
	
	<hr>
	
	<img style="margin-left: 140px; width: 80%"src="<c:url value='/resources/images/explaination.jpg' />" alt="">

	
	<button type="button" id="button" class="btn btn-default">가이드 신청하기</button>

	
	
	<div id="form">
	<h3>가이드 신청 폼</h3>
	${ list.member_id } <br>
	${ list.member_name }<br>
	${ list.member_nickName }<br>
	${ list.member_tel }<br>
	${ list.member_email }<br>
	${ list.member_post }
	${ list.member_adrr}
	${ list.member_addrDetail}<br>
	${ list.member_gender }<br>
	${ list.member_nationality }<br>
	${ list.member_language }<br>
	${ list.member_certification }<br>
	

	위의 내용과 일치하십니까?<br>
	<button onclick="msg()">YES</button>
	<button onclick="location='memberInsertDetail.go'">NO</button>
	
	<script>
	function msg(){
			alert("가이드 신청이 완료되었습니다");
			location.href="/member/memberGuideUp.go";
	}
	</script>
	</div>
	
	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
	
</body>
</html>