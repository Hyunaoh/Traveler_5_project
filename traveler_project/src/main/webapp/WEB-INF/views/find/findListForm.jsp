<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>여행을 더하다</title>
	<style type="text/css">
		.pointer{
			cursor: pointer;
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			mostViewAjax();
			window.setInterval(function(){
				mostViewAjax();
			}, 10000); // 10초마다 업데이트
		})
		function mostViewAjax(){
			$.ajax({
				url : "findMostViewAjax.go",
				method : 'POST',
				type : 'json',
				contentType : "application/json",
				success : function(data) {
					var text = '';
					$("#mostViewList").html(text);
					for(var i = 0; data.length; i++){
						text = "<a href='findDetailForm.go?find_pk="
								+ data[i].find_pk
								+ "'>"
								+ data[i].find_title
								+ " (view : "
								+ data[i].find_hit
								+ ")</a><br>";
						$("#mostViewList").append(text);
					}
				},
				error : function(result, status, er) {
					$("#mostViewList").html("error");
				}
			});
		}
	</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />

 <section id="fh5co-counters" style="background-image: url(<c:url value='/resources/images/full_image_1.jpg' />);" data-stellar-background-ratio="0.5">
	<div class="fh5co-overlay"></div> 
	
	<!-- Page Content -->
    <div class="container">
        <div class="row">
        	<!-- Title -->
        	<div class="col-md-12 section-heading text-center to-animate">
				<h2 onclick="location='findListForm.go'" class="pointer">가이드 찾기</h2>
			</div>
            <div class="fh5co-counter col-lg-8">
                <!-- Banner Image -->
                <img class="img-responsive to-animate" src="<c:url value='/resources/images/banner-find.jpg' />" alt="">
                <hr>
                <!-- Post Content -->
                <div class="row">
					<div class="col-md-12 col-sm-6 col-xs-12">
						<div class="fh5co-counter to-animate">
							<div class="row">
		      					<div class="col-md-3">
								Title/Country
		      					</div>
		      					<div class="col-md-2">
								Writer
		      					</div>
		      					<div class="col-md-4">
								Date
		      					</div>
		      					<div class="col-md-1">
								View
		     					</div>
		     					<div class="col-md-1">
		      					</div>
							</div>
							<c:forEach items="${findList}" var="list">
	              				<div class="well row">
	              					<div class="col-md-3">
										<a href="findDetailForm.go?find_pk=${list.find_pk}">${list.find_title}<br>${list.find_place1}</a>
	              					</div>
	              					<div class="col-md-2">
										${list.member_id}
	              					</div>
	              					<div class="col-md-4">
										${list.find_startDate} ~ ${list.find_endDate}
	              					</div>
	              					<div class="col-md-1">
										${list.find_hit}
	              					</div>
	              					<div class="col-md-2">
	              						<se:authorize access="isAuthenticated()">
		              					<se:authentication property="principal.username" var="sessionID"/>
		              					<c:if test="${list.member_id == sessionID}">
		              						<a class="btn btn-default btn-sm" href="findUpdateForm.go?find_pk=${list.find_pk}">수정</a>
											<a class="btn btn-default btn-sm" href="findDeletePro.go?find_pk=${list.find_pk}">삭제</a>
		              					</c:if>
		              					</se:authorize>
	              					</div>
								</div>
							</c:forEach>
							<hr>
							<div class="row">
								<div class="fh5co-counter col-lg-12">
									<c:set value="1" var="pageNum" />
									<!-- 전체 게시판일때... -->
									<c:if test="${pagingVO.state eq 'listAll'}">
										<c:if test="${pagingVO.currentPageNum ne 1 && pagingVO.currentPageNum ne '' && pagingVO.currentPageNum ne null}">
											<a href="findListForm.go?currentPageNum=${pagingVO.currentPageNum-1}">[이전] </a>
										</c:if>
										<c:forEach begin="${pageNum}" end="${pagingVO.totalPageCount}" var="i">
											<a href="findListForm.go?currentPageNum=${i}">${i} </a>
										</c:forEach>
										<c:if test="${spagingVO.totalPageCount ne 1 && pagingVO.currentPageNum eq '' && pagingVO.currentPageNum eq null}">
											<a href="findListForm.go?currentPageNum=2">[다음]</a>
										</c:if>
										<c:if test="${pagingVO.currentPageNum ne pagingVO.totalPageCount && pagingVO.currentPageNum >= '1'}">
											<a href="findListForm.go?currentPageNum=${pagingVO.currentPageNum+1}">[다음]</a>
										</c:if>
									</c:if>
									<!-- 나라 게시판일때... -->
									<c:if test="${pagingVO.state eq 'listCountryAll'}">
										<c:if test="${pagingVO.currentPageNum ne 1 && pagingVO.currentPageNum ne '' && pagingVO.currentPageNum ne null}">
											<a href="findCountryListForm.go?currentPageNum=${pagingVO.currentPageNum-1}&find_place1=${findVO.find_place1}">[이전] </a>
										</c:if>
										<c:forEach begin="${pageNum}" end="${pagingVO.totalPageCount}" var="i">
											<a href="findCountryListForm.go?currentPageNum=${i}&find_place1=${findVO.find_place1}">${i} </a>
										</c:forEach>
										<c:if test="${spagingVO.totalPageCount ne 1 && pagingVO.currentPageNum eq '' && pagingVO.currentPageNum eq null}">
											<a href="findCountryListForm.go?currentPageNum=2&find_place1=${findVO.find_place1}">[다음]</a>
										</c:if>
										<c:if test="${pagingVO.currentPageNum ne pagingVO.totalPageCount && pagingVO.currentPageNum >= '1'}">
											<a href="findCountryListForm.go?currentPageNum=${pagingVO.currentPageNum+1}&find_place1=${findVO.find_place1}">[다음]</a>
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
							<hr>
							<i class="fh5co-counter-icon icon-briefcase to-animate-2"></i>
							<span class="fh5co-counter-number js-counter" data-from="0" data-to="${totalCount}" data-speed="2000" data-refresh-interval="50">${totalCount}</span>
							<span class="fh5co-counter-label">게시물 개수</span>
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
                	<se:authorize access="isAnonymous()">
                		<a href="findInsertForm.go">글 작성</a>
                		<h4><font color="red">회원만 글을 작성 할 수 있습니다.</font></h4>
                	</se:authorize>
                	<se:authorize access="hasRole('ROLE_MEMBER')">
                		<a href="<c:url value="../member/mypageForm.go" />">추가정보 입력하기</a>
                		<h4><font color="red">추가 정보 입력 후 글을 작성 할 수 있습니다.</font></h4>
                	</se:authorize>
                	<se:authorize access="hasAnyRole('ROLE_VIP', 'ROLE_GUIDE', 'ROLE_ADMIN')">
              			<a href="findInsertForm.go">글 작성</a>
              		</se:authorize>
                </div>
                <!-- Search Well -->
                <div class="well">
                   	<form action="findSearchListForm.go" method="post">
                   		<h4>검색해서 찾아보세요!</h4>
                   		<!-- 보안상 CSRF 값 넘겨줌 -->
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                   		<select name="find_place1" class="form-control">
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
	                        <span class="input-group-btn" style="height:100%;">
								<button class="btn btn-default" type="submit" style="height:100%;">
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
                                <li><a href="findListForm.go">전체</a>
                                </li>
                                <li><a href="findCountryListForm.go?find_place1=대한민국">대한민국</a>
                                </li>
                                <li><a href="findCountryListForm.go?find_place1=미국">미국</a>
                                </li>
                                <li><a href="findCountryListForm.go?find_place1=영국">영국</a>
                                </li>
                                <li><a href="findCountryListForm.go?find_place1=프랑스">프랑스</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="findCountryListForm.go?find_place1=이탈리아">이탈리아</a>
                                </li>
                                <li><a href="findCountryListForm.go?find_place1=체코">체코</a>
                                </li>
                                <li><a href="findCountryListForm.go?find_place1=일본">일본</a>
                                </li>
                                <li><a href="findCountryListForm.go?find_place1=중국">중국</a>
                                </li>
                                <li><a href="findCountryListForm.go?find_place1=캐나다">캐나다</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>

                <!-- Side Widget Well -->
                <div class="well">
                    <h4>가장 많이 본 글 TOP 5</h4>
					<div id="mostViewList"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.container -->
</section>
</body>
</html>