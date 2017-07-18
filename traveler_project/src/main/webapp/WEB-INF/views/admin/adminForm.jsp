<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 여행을 더하다 (관리자)</title>
	<style type="text/css">
		.cursor-point:hover{
			cursor: pointer;
			background-color: rgba(0,0,0,0.3);
		}
	</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- contents -->
	<section id="fh5co-services" data-section="services">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-left">
					<h2 class=" left-border to-animate">관리자 페이지</h2>
					<div class="row">
						<div class="col-md-8 subtext to-animate">
							<h3>ADMIN PAGE</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 fh5co-service to-animate cursor-point" onclick="location='adminBoardForm.go'">
					<i class="icon to-animate-2 icon-monitor"></i>
					<h3>게시글 관리</h3>
					<p>가이드 찾기 게시판</p>
				</div>
				<div class="col-md-6 col-sm-6 fh5co-service to-animate cursor-point" onclick="location='adminMemberForm.go'">
					<i class="icon icon-people to-animate-2"></i>
					<h3>회원관리</h3>
					<p>회원정보수정, 블랙리스트</p>
				</div>

				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-6 col-sm-6 fh5co-service to-animate cursor-point" onclick="location='adminPackageForm.go'">
					<i class="icon to-animate-2 icon-video2"></i>
					<h3>가이드 상품 검증</h3>
					<p>올바른 가이드 상품에 대한 검증</p>
				</div>
				<div class="col-md-6 col-sm-6 fh5co-service to-animate cursor-point" onclick="location='adminGroupPackageForm.go'">
					<i class="icon to-animate-2 icon-video2"></i>
					<h3>가이드 단체 상품 검증</h3>
					<p>올바른 가이드 단체 상품에 대한 검증</p>
				</div>
				<div class="clearfix visible-sm-block"></div>
				
				<div class="col-md-6 col-sm-6 fh5co-service to-animate cursor-point" onclick="location='adminGuideForm.go'">
					<i class="icon icon-briefcase to-animate-2"></i>
					<h3>가이드 권한 승인</h3>
					<p>가이드 신청에 대한 검증 및 승인</p>
				</div>
			</div>
		</div>
	</section>
</body>
</html>