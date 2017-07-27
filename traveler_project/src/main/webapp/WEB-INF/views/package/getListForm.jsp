<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>여행을 더하다</title>
	
	<style type="text/css">
		.package_button{
			background-color: white;
			color: #4da6ff;
			border: 1px solid #4da6ff;
			padding-top: 0.7rem;
			padding-bottom: 0.7rem;
			padding-right: 2rem;
			padding-left: 2rem;
		}
		
		.package_button:hover{
			background-color: #4da6ff;
			color: #fff;
		}
	
		.package-paging-content {
			margin-bottom: 5rem;
		}
		
		#searchTable{
			border: "1px solid black";
			background-color: "white";
		}
		
		.profile_img {
    	width: 10rem;
    	height: 10rem;
    	border-radius: 100%;
		}
		
		.contents_box{
			padding-top: 1rem;
		    padding-bottom: 1rem;
		    color: gray;
		    border: 1px solid lightgray;
		    margin-bottom: 1.5rem;
		}
		
		.contents_box:hover{
			backgroud-color: rgba(0, 0, 0, 0.7);
		
		}
	
	</style>
	<link rel="stylesheet" href="<c:url value="/resources/css/find/find.css" />" />
	<link rel="stylesheet" href="../../../resources/css/review/star.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="../../../resources/js/review/jquery-1.11.3.min.js"></script>
</head>


<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="package-banner" style="background-image:url('<c:url value='/resources/images/ban.jpg' />');"></div>
	
	
	<!-- contents -->
	<div class="container">
		<div class="row">
			<div class="col-md-12 section-heading text-center">
				<h2 class="to-animate">상품목록</h2>
				<div class="row">
					<div class="col-md-8 col-md-offset-2 subtext to-animate">
						<h3>Find perfect guide here for your wonderful trip :)</h3>
						<hr>
						<span class="fh5co-overlay-number js-counter" data-from="0"
							data-to="${count}" data-speed="2000" data-refresh-interval="50">${count}</span>
						<span class="fh5co-overlay-label">전체 게시물 개수</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<!-- side well -->
			<div class = " col-lg-4">
			
				<div class="well">
					<center><h4>직접 상품을 기획해 올려보세요!</h4>
					<button class ="package_button" onclick="location='insertPackageForm.go '">상품 올리기</button>
					<button class ="package_button" onclick="location='/member/guideForm.go'">가이드 신청하기</button></center>
				</div>
				
				<div class= "well">
					<h4>원하는 나라에서 찾아보세요!</h4>
					<form action="packageSearchListForm.go" method="post">
						<div class="row">
							<div class="col-md-6">
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
							<div class="col-md-6">
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
						</div>
					</form>
				</div>
			</div>

			<!-- 리스트 띄우는 부분 -->
			<div class="col-lg-8">
			
			<c:forEach items="${list}" var="list">
				<div class="col-md-12 contents_box">
				<a href="#"
							onclick="location='<c:url value="/package/packageDetailForm.go?package_pk=${list.package_pk}" />'">
						
				
					<div class="col-md-4">
						<img src="<c:url value="/resources/images/package_img/${list.package_image}" />"
						alt="Image" class="img-responsive" style="height: 200px; width: 200px;">
					</div>
				
					<div class = "col-md-8">
						
							<%-- <span>
								<img  class="profile_img" alt="" src="<c:url value='resources/images/profiles/${list.member_profile}'/>">  </span> --%>
							<span><h3>${list.package_title}</h3></span><br>
							<span>작성자 : ${list.member_id}<br>
								 소요시간 : ${list.package_leadTime}</span><br>
							<span class="star-view">
									<span class="view">
							    	<input type="radio" name="review_score" value="1" id="p1">
							    	<label for="pv1" style="width:${list.review_avg * 10}px"></label>
							 		</span>
							 		${list.review_avg } 점				
							</span>
					
					</div>
				<hr>
						</a>
			</div>
			</c:forEach>
			</div>
			
			<div class="row package-paging-content">
					<div class="col-lg-12">
						<c:set value="1" var="pageNum" />
						<!-- 전체 게시판일때... -->
						<c:if test="${pagingVO.state eq 'listAll'}">
							<c:if
								test="${pagingVO.currentPageNum ne 1 && pagingVO.currentPageNum ne '' && pagingVO.currentPageNum ne null}">
								<a href="getAllPackage.go?currentPageNum=${pagingVO.currentPageNum-1}">[이전]
								</a>
							</c:if>
							<c:forEach begin="${pageNum}" end="${pagingVO.totalPageCount}"
								var="i">
								<a href="getAllPackage.go?currentPageNum=${i}">${i} </a>
							</c:forEach>
							<c:if
								test="${pagingVO.totalPageCount ne 1 && pagingVO.currentPageNum eq '' && pagingVO.currentPageNum eq null}">
								<a href="getAllPackage.go?currentPageNum=2">[다음]</a>
							</c:if>
							<c:if
								test="${pagingVO.currentPageNum ne pagingVO.totalPageCount && pagingVO.currentPageNum >= '1'}">
								<a
									href="getAllPackage.go?currentPageNum=${pagingVO.currentPageNum+1}">[다음]</a>
							</c:if>
						</c:if>
						
						<!-- 나라 게시판일때... -->
						<c:if test="${pagingVO.state eq 'listCountryAll'}">
							<c:if test="${pagingVO.currentPageNum ne 1 && pagingVO.currentPageNum ne '' && pagingVO.currentPageNum ne null}">
								<a href="packageCountryListForm.go?currentPageNum=${pagingVO.currentPageNum-1}&package_place1=${packageVO.package_place1}">[이전] </a>
							</c:if>
							<c:forEach begin="${pageNum}" end="${pagingVO.totalPageCount}" var="i">
								<a href="packageCountryListForm.go?currentPageNum=${i}&package_place1=${packageVO.package_place1}">${i} </a>
							</c:forEach>
							<c:if test="${spagingVO.totalPageCount ne 1 && pagingVO.currentPageNum eq '' && pagingVO.currentPageNum eq null}">
								<a href="packageCountryListForm.go?currentPageNum=2&package_place1=${packageVO.package_place1}">[다음]</a>
							</c:if>
							<c:if test="${pagingVO.currentPageNum ne pagingVO.totalPageCount && pagingVO.currentPageNum >= '1'}">
								<a href="packageCountryListForm.go?currentPageNum=${pagingVO.currentPageNum+1}&package_place1=${packageVO.package_place1}">[다음]</a>
							</c:if>
						</c:if>
					</div>
				</div>
				<!-- paging -->
		</div>
		<!-- row -->
	
	
	</div>
	<!-- container -->
	
	
</body>
</html>

