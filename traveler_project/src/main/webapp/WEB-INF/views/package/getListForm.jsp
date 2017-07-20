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
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<section id="fh5co-work" data-section="work" >
	
	<!-- 기능 테스트용...나중에 지울것 -->
	
		<form name="test3" action="countTest.go" method="post">
		<input type="submit" value="테스트용!">
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
					<a href="#"
						onclick="location='<c:url value="/package/packageDetailForm.go?package_pk=${list.package_pk}" />'"
						class="fh5co-project-item image-popup to-animate"> <img
						src="<c:url value="/resources/images/package_img/${list.package_image}" />"
						alt="Image" class="img-responsive"
						style="height: 270px; width: 359.98px;">
						<div class="fh5co-text">
							<h2>${list.package_title}</h2>
							<span>작성자 : ${list.member_id}/ 소요시간 :
								${list.package_leadTime}</span>
						</div>
					</a>

				</div>
				<c:forEach items="${listAll}" step="2">
					<div class="clearfix visible-sm-block"></div>
				</c:forEach>
			</c:forEach>
		</div>
	</div>


	<div class="row">
					<div class="fh5co-counter col-lg-12">
						<c:set value="1" var="pageNum" />
						<!-- 전체 게시판일때... -->
						<c:if test="${pagingVO.state eq 'listAll'}">
							<c:if
								test="${pagingVO.currentPageNum ne 1 && pagingVO.currentPageNum ne '' && pagingVO.currentPageNum ne null}">
								<a
									href="getAllPackage.go?currentPageNum=${pagingVO.currentPageNum-1}">[이전]
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



			
			<!-- Sidebar Widgets Column -->
			<div class="fh5co-counter to-animate col-md-4">
				<!-- Write Well -->
				<div class="row">
					<h4>직접 상품을 기획해 올려보세요!</h4>
					<a href="insertPackageForm.go"><font color="#55d9ad">상품 올리기 </font></a>
				</div>
				

				<!-- Blog Categories Well -->
				<div class="row">
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
	
</body>
</html>

