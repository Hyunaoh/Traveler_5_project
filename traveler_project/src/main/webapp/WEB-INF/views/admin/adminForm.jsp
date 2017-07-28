<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 여행을 더하다 (관리자)</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<!-- Admin CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/admin.css" />" />
	
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="admin-banner" style="background-image:url('<c:url value='/resources/images/admin_img/admin-banner.jpg' />');"></div>
	
	<!-- container -->
	<div class="container admin-container">
	
		<!--  header -->
		<div class="row">
			<div class="col-md-12 section-heading text-left">
				<h2 class="admin-header">관리자 페이지</h2>
			</div>
		</div>
		
		<!-- contents -->
		<div class="row">
			<div class="col-md-6 col-sm-6 " onclick="location='adminMemberForm.go'">
				<div class="cursor-point">
					<h3>회원관리</h3>
					<p>회원정보수정, 블랙리스트</p>
				</div>
			</div>
		
			<div class="col-md-6 col-sm-6" onclick="location='adminPayForm.go'">
				<div class="cursor-point">
					<h3>결제 확인</h3>
					<p>싱글 패키지, 단체 패키지 결제 여부 확인</p>
				</div>
			</div>
			
			<div class="col-md-6 col-sm-6" onclick="location='adminGuideForm.go'">
				<div class="cursor-point">
					<h3>가이드 권한 승인</h3>
					<p>가이드 신청에 대한 검증 및 승인</p>
				</div>
			</div>
		</div>
		
		<hr>
		<div class="row">
			<div class="col-md-6 col-sm-6" onclick="location='adminBoardForm.go'">
				<div class="cursor-point">
					<h3>게시글 관리</h3>
					<p>가이드 찾기 게시판</p>
				</div>
			</div>
			
			<div class="col-md-6 col-sm-6" onclick="location='adminPackageForm.go'">
				<div class="cursor-point">
					<h3>가이드 상품 검증</h3>
					<p>올바른 가이드 상품에 대한 검증</p>
				</div>
			</div>
			
			<div class="col-md-6 col-sm-6" onclick="location='adminGroupPackageForm.go'">
				<div class="cursor-point">
					<h3>가이드 단체 상품 검증</h3>
					<p>올바른 가이드 단체 상품에 대한 검증</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
	
</body>
</html>