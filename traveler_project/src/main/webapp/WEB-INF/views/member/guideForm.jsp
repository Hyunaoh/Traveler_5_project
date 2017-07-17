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
	 <c:if test="${ list.member_nationality == null || list.member_language == null || list.member_post == null || list.member_addrDetail == null }">
 		<script type="text/javascript">
			alert("상세 정보를 등록 한 후 가이드가 되어보세여~");
			document.location.href = "/home.go";
			</script>
	</c:if>

	
	
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
	
</body>
</html>