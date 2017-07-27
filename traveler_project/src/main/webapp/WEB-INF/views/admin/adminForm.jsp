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
	<div class="container">
	
		<div class="row">
			<div class="col-md-12 section-heading text-left">
				<h2>관리자 페이지</h2>
				<div class="row">
					<div class="col-md-8">
						<h3>ADMIN PAGE</h3>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6 col-sm-6 cursor-point" onclick="location='adminMemberForm.go'">
				<h3>회원관리</h3>
				<p>회원정보수정, 블랙리스트</p>
			</div>
		
			<div class="col-md-6 col-sm-6 cursor-point" onclick="location='adminPayForm.go'">
				<h3>결제 확인</h3>
				<p>싱글 패키지, 단체 패키지 결제 여부 확인</p>
			</div>
			
			<div class="col-md-6 col-sm-6 cursor-point" onclick="location='adminGuideForm.go'">
				<h3>가이드 권한 승인</h3>
				<p>가이드 신청에 대한 검증 및 승인</p>
			</div>
		</div>
		
		<hr>
		<div class="row">
			<div class="col-md-6 col-sm-6 cursor-point" onclick="location='adminBoardForm.go'">
				<h3>게시글 관리</h3>
				<p>가이드 찾기 게시판</p>
			</div>
			
			<div class="col-md-6 col-sm-6 cursor-point" onclick="location='adminPackageForm.go'">
				<h3>가이드 상품 검증</h3>
				<p>올바른 가이드 상품에 대한 검증</p>
			</div>
			
			<div class="col-md-6 col-sm-6 cursor-point" onclick="location='adminGroupPackageForm.go'">
				<h3>가이드 단체 상품 검증</h3>
				<p>올바른 가이드 단체 상품에 대한 검증</p>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
	
</body>
</html>