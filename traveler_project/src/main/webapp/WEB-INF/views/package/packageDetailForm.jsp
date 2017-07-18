<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 패키지 상품 상세보기</title>
</head>
<body>
	PK : ${packageVO.package_pk}<br>
	제목 : ${packageVO.package_title}<br>
	작성날짜 : ${packageVO.package_regDate}<br>
	작성자 :  ${packageVO.member_id}<br>
	내용 : ${packageVO.package_content}<br>
	여행하는 곳 : ${packageVO.package_place1} ${packageVO.package_place2}<br>
	상세 내용: ${packageVO.package_place3}<br>
	소요시간 : ${packageVO.package_leadTime} <br>
	조회수 : ${packageVO.package_hit } <br>
	해시태그 : ${packageVO.package_tag }<br>
	<hr>
	<!-- 패키지 찾기에서 접근했을 때(이미 승인 된 상품) -->
	<c:if test="${packageVO.package_status eq 1 }">
		<a href="getAllPackage.go">목록보기</a>
		<a href="updatePackageForm.go?package_pk=${packageVO.package_pk}">수정</a>
		<a href="packageDeletePro.go?package_pk=${packageVO.package_pk}">삭제</a>
		
		<br><br><br>
		이런 상품은 어떠세염?(비슷한 상품들 띄워주기)<br>
		<c:forEach items="" var="list">
			<c:if test="${list.package_image ne null}">
				<a href="#" onclick="location='<c:url value="/package/packageDetailForm.go?package_pk=${list.package_pk}" />'"  class="fh5co-project-item image-popup to-animate">
					<img src="<c:url value="/resources/images/package_img/${list.package_image}" />" alt="Image" class="img-responsive" style="height: 270px; width: 359.98px;">
					<div class="fh5co-text">
						<h2>${list.package_title}</h2>
						<span> 작성자 : ${list.member_id} / 소요시간 : ${list.package_leadTime}</span>
					</div>
				</a>
			</c:if>
		</c:forEach>
		
		
	</c:if>
	<!-- 어드민에서 접근했을 때(미승인 상품) -->
	<c:if test="${packageVO.package_status eq 0 }">
		<a href="../admin/adminPackagePro.go?package_pk=${packageVO.package_pk}">상품 게시글 승인하기</a>
		<a href="packageDeletePro.go?package_pk=${packageVO.package_pk}">게시글 삭제</a>
	</c:if>
</body>
</html>