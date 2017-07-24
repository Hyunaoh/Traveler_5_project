<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>여행을 더하다</title>
	
	<style type="text/css">
		#searchTable{
			border: "1px solid black";
			background-color: "white";
		}
	
	</style>
	<link rel="stylesheet" href="../../../resources/css/review/star.css">
	<script src="../../../resources/js/review/jquery-1.11.3.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<section id="fh5co-work" data-section="work" >
		<form name="test3" action="countTest.go" method="post">
		<input type="text" name = "hashTag_tag">
		<input type="submit">
	
		</form>
		<div class="fh5co-overlay"></div>
		
		<!-- Page Content -->
		<div class="searchTable">
				<!-- Write Well -->
				<table id=searchTable>
					<tr>
					여행 국가 : <a href="insertPackageForm.go"><font color="#55d9ad">상품 올리기 </font></a>
							<a href="insertPackageForm.go"><font color="#55d9ad">대한민국 </font></a>
							<a href="insertPackageForm.go"><font color="#55d9ad">미국 </font></a>
							<a href="insertPackageForm.go"><font color="#55d9ad">영국</font></a>
							<a href="insertPackageForm.go"><font color="#55d9ad">프랑스</font></a>
							<a href="insertPackageForm.go"><font color="#55d9ad">이탈리아 </font></a>
							<a href="insertPackageForm.go"><font color="#55d9ad">체코 </font></a><br>
							<a href="insertPackageForm.go"><font color="#55d9ad">캐나다 </font></a><br>
							<a href="insertPackageForm.go"><font color="#55d9ad"> </font></a><br>
							<a href="insertPackageForm.go"><font color="#55d9ad"> </font></a><br>
							
					</tr>
					<tr>
					여행 기간 : <input type="radio" name="package_leadTime" value="">하루  ||
							<input type="radio" name="package_leadTime" value="">1박 이상  ||
							<input type="radio" name="package_leadTime" value="">기간 무관
					</tr>
					<tr>
					<a href="insertPackageForm.go"><font color="#55d9ad">상품 올리기 </font></a>
					</tr>
			</table>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">상품목록</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>Find perfect guide here for your wonderful trip :)</h3>
							<hr>
							<i class="fh5co-overlay-icon icon-briefcase to-animate-2"></i> <span
								class="fh5co-overlay-number js-counter" data-from="0"
								data-to="${count}" data-speed="2000" data-refresh-interval="50">${count}</span>
							<span class="fh5co-overlay-label">전체 게시물 개수</span>
						</div>
					</div>
				</div>
			</div>
			
				<div class="row row-bottom-padded-sm">
					<c:forEach items="${list}" var="list">
						
						<div class="col-md-4 col-sm-6 col-xxs-12">
							<c:if test="${list.package_image eq null}">
								<a href="#" onclick="location='<c:url value="/package/packageDetailForm.go?package_pk=${list.package_pk}" />'"  class="fh5co-project-item image-popup to-animate">
									<img src="<c:url value="/resources/images/package_img/default_image.jpg" />" alt="Image" class="img-responsive" style="height: 270px; width: 359.98px;">
									<div class="fh5co-text">
										<h2>${list.package_title}</h2>
										<span>작성자 : ${list.member_id} / 소요시간 : ${list.package_leadTime}</span>
										<span class="star-view">
											<span class="view">
									    	<input type="radio" name="review_score" value="1" id="p1">
									    	<label for="pv1" style="width:${list.review_avg * 10}px"></label>
									 		</span>
									 		${list.review_avg } 점				
										</span>
									</div>
									
								</a>
							</c:if>
						
							<c:if test="${list.package_image ne null}">
								<a href="#" onclick="location='<c:url value="/package/packageDetailForm.go?package_pk=${list.package_pk}" />'"  class="fh5co-project-item image-popup to-animate">
									<img src="<c:url value="/resources/images/package_img/${list.package_image}" />" alt="Image" class="img-responsive" style="height: 270px; width: 359.98px;">
									<div class="fh5co-text">
										<h2>${list.package_title}</h2>
										<span>작성자 : ${list.member_id}/ 소요시간 : ${list.package_leadTime}</span>
										<span class="star-view">
											<span class="view">
									    	<input type="radio" name="review_score" value="1" id="p1">
									    	<label for="pv1" style="width:${list.review_avg * 10}px"></label>
									 		</span>
									 		${list.review_avg } 점				
										</span>
									</div>
								</a>
							</c:if>
						</div>
						<c:forEach items="${listAll}" step="2" >
						<div class="clearfix visible-sm-block"></div>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
			
			<!-- Sidebar Widgets Column -->
			<div class="fh5co-counter to-animate col-md-4">
				<!-- Write Well -->
				<div class="well">
					<h4>직접 상품을 기획해 올려보세요!</h4>
					<a href="insertPackageForm.go"><font color="#55d9ad">상품 올리기 </font></a>
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
					<form action="packageSearchListForm.go" method="post">
						<div class="col-lg-6">
							<ul class="list-unstyled">
									<li><a href="getAllPackage.go"><font color="#55d9ad">전체</font></a></li>
									<li><a href="packageCountryListForm.go?package_place1=대한민국"><font color="#55d9ad">대한민국</font></a>
									</li>
									<li><a href="packageCountryListForm.go?package_place1=미국"><font color="#55d9ad">미국</font></a>
									</li>
									<li><a href="packageCountryListForm.go?package_place1=영국"><font color="#55d9ad">영국</font></a>
									</li>
									<li><a href="packageCountryListForm.go?package_place1=프랑스"><font color="#55d9ad">프랑스</font></a>
									</li>
							</ul>
						</div>
						<div class="col-lg-6">
							<ul class="list-unstyled">
								<li><a href="packageCountryListForm.go?package_place1=이탈리아"><font color="#55d9ad">이탈리아</font></a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=체코"><font color="#55d9ad">체코</font></a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=일본"><font color="#55d9ad">일본</font></a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=중국"><font color="#55d9ad">중국</font></a>
								</li>
								<li><a href="packageCountryListForm.go?package_place1=캐나다"><font color="#55d9ad">캐나다</font></a>
								</li>
							</ul>
						</div>
						</form>
					</div>
					<!-- /.row -->
				</div>
			</div>
	</section>
	
	

	<%-- 
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
	</section> --%>
</body>
</html>

