<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>여행을 더하다</title>
	
	<style type="text/css">
		.package-well {
			width: 100%;
			  min-height: 20px;
			  padding: 19px;
			  margin-bottom: 20px;
			  background-color: white;
			  border: 1px solid lightgrqy;
			  border-radius: 4px;
			  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
			  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.05);
			  font-size: 10px;
		}
		
		.list-unstyled{
			color:#64b5f6;
		
		}
		
		.mainImg{
			float: left;
			clear: left;
		}
		
		.package_button{
			float:left;
			display: inline;
			border-radius: 1px;
		    border: 0;
		    cursor: pointer;
		    font-size: 14px;
		    height: 36px;
		    line-height: 36px;
		    padding: 0;
		    text-align: center;
		    width: 130px;
		    background-color: #64b5f6;
		    color: #fff !important;
		    font-weight: 600;
		    margin:0.5rem;
		}
		
		.package_button:hover{
			background-color: #3e92d6;
		}
	
		.package-paging-content {
			margin-bottom: 5rem;
		}
		
		.profile_img {
	    	width: 10rem;
	    	height: 10rem;
	    	border-radius: 100%;
		}
		
		.contents_box{
			float: left;
			padding-top: 0rem;
			padding-left:0;
		    padding-bottom: 1rem;
		    border: 1px solid lightgray;
		    margin-bottom: 1.5rem;
		    display: inline-block;
		    height: 180px;
		    width: 430px;
		}
		
		.contents_box :hover{
			backgroud-color: #3e92d6;
		}
		
		.package-banner{
		    padding: 0;
		    margin: 0;
		    height: 400px;
		    background-size: cover;
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
			<div class = " col-md-3">
			
				<div class="package-well">
					<button class ="package_button" onclick="location='insertPackageForm.go '">상품 올리기</button>
					<button class ="package_button" onclick="location='/member/guideForm.go'">가이드 신청하기</button>
					<br/>
					<center>
					<h4><font color="red">가이드로 등록한 회원만 <br>상품게시가 가능합니다.</font></h4></center>
				</div>
				
				<!-- 검색 -->
				<div class="package-well">
		   			<form action="packageSearchListForm.go" method="post">
		   				<h4>해시태그로 검색해보세요!</h4>
		            	<div class="row">
		            		<!-- 나라 선택 -->
		            		<div class="col-md-6">            		
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
		            		</div>
		            		<!-- 검색하는 부분 -->
		            		<div class="col-md-6 input-group">
	            				<input type="text" name="search" class="form-control inline">
			    				<span class="input-group-btn inline" style="height:100%;">
									<button class="btn btn-default" type="submit" style="height:100%;">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
		            		</div>
		            	</div>
		
					</form>
				</div>
				
				<div class= "package-well">
					<h5>원하는 나라에서 찾아보세요!</h5>
					<form action="packageSearchListForm.go" method="post">
						<div class="row">
							<div class="col-md-6">
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
							<div class="col-md-6">
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
					</form>
				</div>
			</div>

			<!-- 리스트 띄우는 부분 -->
			<div class="col-md-9">
			
				<c:forEach items="${list}" var="list">
						<div class="mainImg">
							<img src="<c:url value="/resources/images/package_img/${list.package_image}" />"
								alt="Image" class="img-responsive" style="display: inline; height: 180px; width: 236px;">
						</div>
					 <a style="display: inline;" href="#"
							onclick="location='<c:url value="/package/packageDetailForm.go?package_pk=${list.package_pk}" />'">
						<div style="padding-left: 1.5rem;display: inline;" class="contents_box">
							<%-- <span>
								<img  class="profile_img" alt="" src="<c:url value='resources/images/profiles/${list.member_profile}'/>">  </span> --%>
							<h4>${list.package_title}</h4><br>
							작성자 : ${list.member_id}<br>
								 소요시간 : ${list.package_leadTime}</span><br>
							<span class="star-view">
									<span class="view">
							    	<input type="radio" name="review_score" value="1" id="p1">
							    	<label for="pv1" style="width:${list.review_avg * 10}px"></label>
							 		</span>
							 		${list.review_avg } 점				
							</span>
					
					</div>
					</a>
					</c:forEach>
				</div>
				
				<!-- </a> -->
				<hr>
				
			</div>
			
			<div class="row package-paging-content">
					<div class="col-md-9 col-md-offset-3">
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
						<!-- 검색 게시판일때... -->
						<c:if test="${pagingVO.state eq 'listSearchAll'}">
							<c:if test="${pagingVO.currentPageNum ne 1 && pagingVO.currentPageNum ne '' && pagingVO.currentPageNum ne null}">
								<a href="findSearchListForm.go?currentPageNum=${pagingVO.currentPageNum-1}&find_place1=${findVO.find_place1}&search=${findVO.search}">[이전] </a>
							</c:if>
							<c:forEach begin="${pageNum}" end="${pagingVO.totalPageCount}" var="i">
								<a href="findSearchListForm.go?currentPageNum=${i}&find_place1=${findVO.find_place1}&search=${findVO.search}">${i} </a>
							</c:forEach>
							<c:if test="${spagingVO.totalPageCount ne 1 && pagingVO.currentPageNum eq '' && pagingVO.currentPageNum eq null}">
								<a href="findSearchListForm.go?currentPageNum=2&find_place1=${findVO.find_place1}&search=${findVO.search}">[다음]</a>
							</c:if>
							<c:if test="${pagingVO.currentPageNum ne pagingVO.totalPageCount && pagingVO.currentPageNum >= '1'}">
								<a href="findSearchListForm.go?currentPageNum=${pagingVO.currentPageNum+1}&find_place1=${findVO.find_place1}&search=${findVO.search}">[다음]</a>
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

