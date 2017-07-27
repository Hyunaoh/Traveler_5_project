<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>여행가 - 여행을 더하다</title>
	
	<!-- jQuery -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.min.js"/>"></script>
	
	<!-- Home page CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/home.css" />" />
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp" />
	
	<!-- 배너 이미지 -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="" data-slide-to="0" class="active"></li>
			<li data-target="" data-slide-to="1"></li>
			<li data-target="" data-slide-to="2"></li>
		</ol>
		
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<a href="<c:url value="/package/getAllPackage.go" />">
					<img src="<c:url value='/resources/images/home_img/home_bg_1.jpg' />" alt="...">
				</a>
				<div class="carousel-caption">
				</div>
			</div>
			<div class="item">
				<a href="<c:url value="/find/findListForm.go" />">
					<img src="<c:url value='/resources/images/home_img/home_bg_2.jpg' />" alt="...">
				</a>
				<div class="carousel-caption">
				</div>
			</div>
			<div class="item">
				<a href="<c:url value="/group/groupListForm.go" />">
					<img src="<c:url value='/resources/images/home_img/home_bg_3.jpg' />" alt="...">
				</a>
				<div class="carousel-caption">
				</div>
			</div>
		</div>
	
		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			<span class="sr-only">이전</span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			<span class="sr-only">다음</span>
		</a>
	</div>
	
	<!-- 배너 밑 content -->
	<div class="container menu-content">
		<div class="row">
		
			<!-- 가이드 찾기 -->
			<div class="col-md-6 col-sm-12 home-menu-img">
				<div class="home-menu-img-size">
					<img alt="..." src="<c:url value='/resources/images/home_img/home_menu_3.jpg' />" class="home-menu-img-size">
					<a href="<c:url value="/find/findListForm.go" />">
						<span class="home-menu-img-text">
							<h3>친구 같은<br>가이드</h3>
							<hr>
							<h4>원하는 가이드를 찾고 여행하자!</h4>
						</span>
					</a>
				</div>		
			</div>
			
			<!-- 싱글 상품 -->
			<div class="col-md-6 col-sm-12 home-menu-img">
				<div class="home-menu-img-size">
					<img alt="..." src="<c:url value='/resources/images/home_img/home_menu_4.jpg' />" class="home-menu-img-size">
					<a href="<c:url value="/package/getAllPackage.go" />">
						<span class="home-menu-img-text">
							<h3>개인 상품</h3>
							<hr>
							<h4>다양한 개인 상품이 있습니다!</h4>
						</span>
					</a>
				</div>			
			</div>
			
		</div>
		
		<div class="row">
		
			<!-- 단체 상품 -->
			<div class="col-md-6 col-sm-12 home-menu-img">
				<div class="home-menu-img-size">
					<img alt="..." src="<c:url value='/resources/images/home_img/home_menu_1.jpg' />" class="home-menu-img-size">
					<a href="<c:url value="/group/groupListForm.go" />">
						<span class="home-menu-img-text">
							<h3>단체 상품</h3>
							<hr>
							<h4>다양한 단체 상품이 있습니다!</h4>
						</span>
					</a>
				</div>		
			</div>
			
			<!-- 여행 계획 -->
			<div class="col-md-6 col-sm-12 home-menu-img">
				<div class="home-menu-img-size">
					<img alt="..." src="<c:url value='/resources/images/home_img/home_menu_2.jpg' />" class="home-menu-img-size">
					<a href="<c:url value="/plan/myPlanList.go" />">
						<span class="home-menu-img-text">
							<h3>여행 계획</h3>
							<hr>
							<h4>편하게 여행 계획 짜고 떠나자!</h4>
						</span>
					</a>
				</div>			
			</div>
		</div>
	</div>
	
	
	<div class="container dev-story-content">
		<div class="row">
			<div class="col-md-4 col-sm-12">
				<div class="dev-story-bg">
					<div class="dev-story-header">
						<h1>개발자 이야기</h1>
					</div>
				</div>
			</div>
			
			<div class="col-md-4 col-sm-6">
				<div class="dev-story-content-bg">
					<div class="row">
						<!-- 사진 -->
						<div class="col-md-3 dev-story-img-border">
							<img class="dev-story-img" alt="" src="<c:url value='/resources/images/home_img/taehong.jpg' />">
						</div>
						<!-- 개발자 소견 -->
						<div class="col-md-6">
							<div class="dev-story-comment">
								<h4>김태홍</h4>
								<p>
									평소에 여행을 좋아해서 그런지 만들때 지겨
								</p>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
			<div class="col-md-4 col-sm-6">
				<div class="dev-story-content-bg">
					<div class="row">
						<!-- 사진 -->
						<div class="col-md-3 dev-story-img-border">
							<img class="dev-story-img" alt="" src="<c:url value='/resources/images/home_img/puremang.jpg' />">
						</div>
						<!-- 개발자 소견 -->
						<div class="col-md-6">
							<div class="dev-story-comment">
								<h4>김희망</h4>
								<p>힘들었지만 재미있었닿ㅎㅎㅎㅎㅎㅎ</p>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-sm-6">
				<div class="dev-story-content-bg">
					<div class="row">
						<!-- 사진 -->
						<div class="col-md-3 dev-story-img-border">
							<img class="dev-story-img" alt="" src="<c:url value='/resources/images/home_img/jiho.jpg' />">
						</div>
						<!-- 개발자 소견 -->
						<div class="col-md-6">
							<div class="dev-story-comment">
								<h4>김지호</h4>
								<p>힘들었지만 재미있었닿ㅎㅎㅎㅎㅎㅎ</p>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
			<div class="col-md-4 col-sm-6">
				<div class="dev-story-content-bg">
					<div class="row">
						<!-- 사진 -->
						<div class="col-md-3 dev-story-img-border">
							<img class="dev-story-img" alt="" src="<c:url value='/resources/images/home_img/hyuna.jpg' />">
						</div>
						<!-- 개발자 소견 -->
						<div class="col-md-6">
							<div class="dev-story-comment">
								<h4>오현아</h4>
								<p>힘들었지만 재미있었닿ㅎㅎㅎㅎㅎㅎ</p>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			
			<div class="col-md-4 col-sm-6">
				<div class="dev-story-content-bg">
					<div class="row">
						<!-- 사진 -->
						<div class="col-md-3 dev-story-img-border">
							<img class="dev-story-img" alt="" src="<c:url value='/resources/images/home_img/jihoon.jpg' />">
						</div>
						<!-- 개발자 소견 -->
						<div class="col-md-6">
							<div class="dev-story-comment">
								<h4>류지훈</h4>
								<p>힘들었지만 재미있었닿ㅎㅎㅎㅎㅎㅎ</p>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="footer.jsp" />
</body>
</html>
