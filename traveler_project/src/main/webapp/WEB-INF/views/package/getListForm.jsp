<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>여행을 더하다</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<section id="fh5co-work" data-section="work">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">상품목록</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>Find perfect guide here for your wonderful trip :)</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row row-bottom-padded-sm">
				<div class="col-md-4 col-sm-6 col-xxs-12">
				<c:forEach items="${listAll}" var="list"></c:forEach>
					<a href="<c:url value="/resources/images/work_1.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_1.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 1</h2>
							<span>Branding</span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_2.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_2.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 2</h2>
							<span>Web</span>
						</div>
					</a>
				</div>

				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_3.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_3.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 3</h2>
							<span>Web</span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_4.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_4.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 4</h2>
							<span>UI/UX</span>
						</div>
					</a>
				</div>
				
				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_5.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_5.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 1</h2>
							<span>Photography</span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_6.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_6.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 2</h2>
							<span>Illustration</span>
						</div>
					</a>
				</div>
				
				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_7.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_7.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 3</h2>
							<span>Web</span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_8.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_8.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 4</h2>
							<span>Sketch</span>
						</div>
					</a>
				</div>

				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="<c:url value="/resources/images/work_1.jpg" />" class="fh5co-project-item image-popup to-animate">
						<img src="<c:url value="/resources/images/work_1.jpg" />" alt="Image" class="img-responsive">
						<div class="fh5co-text">
							<h2>Project 2</h2>
							<span>Illustration</span>
						</div>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center to-animate">
					<p>* Demo images from <a href="http://plmd.me/" target="_blank">plmd.me</a></p>
				</div>
			</div>
		</div>
	</section>
	
	

	<section id="fh5co-counters"
		style="background-image: url(<c:url value='/resources/images/jiho.jpg' />);"
		data-stellar-background-ratio="0.5">
	<div class="fh5co-overlay"></div>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<!-- Title -->
			<div class="col-md-12 section-heading text-center to-animate">
				<h2 onclick="location='getAllPackage.go'">상품목록</h2>
			</div>
			<div class="fh5co-counter col-lg-8">
				<!-- Banner Image -->
				<img class="img-responsive to-animate"
					src="<c:url value='/resources/images/guide.png' />" alt="">
				<hr>
				<!-- Post Content -->
				<div class="row">
					<div class="col-md-12 col-sm-6 col-xs-12">
						<div class="fh5co-counter to-animate">
							<div class="row">
								<div class="col-md-3">Title/Country</div>
								<div class="col-md-2">Writer</div>
								<div class="col-md-4">Lead Time</div>
								<div class="col-md-1">View</div>
								<div class="col-md-1"></div>
							</div>
							<c:forEach items="${listAll}" var="list">
								<div class="well row">
									<div class="col-md-3">
										<a href="packageDetailForm.go?package_pk=${list.package_pk}">${list.package_title}/${list.package_place1}</a>
									</div>
									<div class="col-md-2">${list.member_id}</div>
									<div class="col-md-4">${list.package_leadTime}</div>
									<div class="col-md-1">${list.package_hit}</div>
									<div class="col-md-2">
										<a class="btn btn-default btn-sm"
											href="packageUpdateForm.go?package_pk=${list.package_pk}">수정</a>
										<a class="btn btn-default btn-sm"
											href="packageDeletePro.go?package_pk=${list.package_pk}">삭제</a>
									</div>
								</div>
							</c:forEach>
							<hr>
							<i class="fh5co-counter-icon icon-briefcase to-animate-2"></i> <span
								class="fh5co-counter-number js-counter" data-from="0"
								data-to="${count}" data-speed="2000" data-refresh-interval="50">${count}</span>
							<span class="fh5co-counter-label">전체 게시물 개수</span>
						</div>
					</div>
				</div>
				<hr>
			</div>

			<!-- Sidebar Widgets Column -->
			<div class="fh5co-counter to-animate col-md-4">
				<!-- Write Well -->
				<div class="well">
					<h4>글을 올려 찾으세요!</h4>
					<a href="insertPackageForm.go">글 작성</a>
				</div>
				<!-- Search Well -->
				<div class="well">
					<form action="packageSearchListForm.go" method="post">
						<h4>검색해서 찾아보세요!</h4>
						<!-- 보안상 CSRF 값 넘겨줌 -->
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<select name="package_place1" class="form-control">
							<option value="전체">전체</option>
							<option value="대한민국">대한민국</option>
							<option value="미국">미국</option>
							<option value="영국">영국</option>
							<option value="프랑스">프랑스</option>
							<option value="이탈리아">이탈리아</option>
							<option value="체코">체코</option>
							<option value="캐나다">캐나다</option>
							<option value="중국">중국</option>
							<option value="일본">일본</option>
						</select>
						<div class="input-group">
							<input type="text" name="search" class="form-control">
							<span class="input-group-btn" style="height: 100%;">
								<button class="btn btn-default" type="submit" style="height: 100%;">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</form>
				</div>

				<!-- Blog Categories Well -->
				<div class="well">
					<h4>원하는 나라에서 찾아보세요!</h4>
					<div class="row">
						<div class="col-lg-6">
							<ul class="list-unstyled">
								<li><a href="getAllPackage.go">전체</a></li>
								<li><a href="packageCountryListForm.go?package_place1=대한민국">대한민국</a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=미국">미국</a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=영국">영국</a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=프랑스">프랑스</a>
								</li>
							</ul>
						</div>
						<div class="col-lg-6">
							<ul class="list-unstyled">
								<li><a href="packageCountryListForm.go?package_place1=이탈리아">이탈리아</a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=체코">체코</a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=일본">일본</a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=중국">중국</a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=캐나다">캐나다</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- /.row -->
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
	</section>
</body>
</html>

