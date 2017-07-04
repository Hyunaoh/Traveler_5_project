<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>성별</th>
				<th>국적</th>
				<th>구사언어</th>
				<th>자격증</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>가입날짜</th>
				<th>가이드</th>			
	</tr>
	</table>
	
	<c:forEach items="${ list }" var="list">
	<td>${ list.member_id }</td>
	<td>${ list.member_pwd }</td>
	<td>${ list.member_name }</td>
	<td>${ list.member_nickName }</td>
	<td>${ list.member_gender }</td>
	<td>${ list.member_nationality }</td>
	<td>${ list.member_language }</td>
	<td>${ list.member_certification }</td>
	<td>${ list.member_tel }</td>
	<td>${ list.member_email }</td>
	<td>${ list.member_post }</td>
	<td>${ list.member_adrr }</td>
	<td>${ list.member_addrDetail }</td>
	<td>${ list.member_joinDate }</td>
	<td>${list.member_isGuide}</td>
	<td><button onclick="location='adminMemberIsguide.go?member_id=${list.member_id}&member_isGuide=${ list.member_isGuide }'">가이드</button></td>
	<hr>
	</c:forEach>
	
</body>
</html>