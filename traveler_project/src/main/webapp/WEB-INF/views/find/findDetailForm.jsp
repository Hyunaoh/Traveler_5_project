<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 가이드 찾기 글</title>
</head>
<body>
	제목 : ${findVO.find_title}<br>
	작성날짜 : ${findVO.find_regDate}<br>
	작성자 :  ${findVO.member_id}<br>
	내용 : ${findVO.find_content}<br>
	여행하는 곳 : ${findVO.find_place1} ${findVO.find_place2} ${findVO.find_place3}<br>
	기간 : ${findVO.find_startDate} ~ ${findVO.find_endDate}<br>
	<hr>
	<a href="findListForm.go">목록보기</a>
	<a href="findUpdateForm.go?find_pk=${findVO.find_pk}">수정</a>
	<a href="findDeletePro.go?find_pk=${findVO.find_pk}">삭제</a>
	<a href="findDeclarePro.go?find_pk=${findVO.find_pk}">신고</a>
</body>
</html>