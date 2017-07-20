<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>여행을 더하다</title>
	<!-- Find  CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/find/find.css" />" />
	
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

	<!-- banner -->
	<div class="find-banner" style="background-image:url('<c:url value='/resources/images/find_img/find_list_banner.jpg' />');"></div>
	
	<!-- content -->
	<div class="container find-content">
	
		<!-- side menu -->
		<div class="col-md-3">
			
			<!-- 글쓰기 -->
			<div class="side-menu-bg">
				<se:authorize access="isAnonymous()">
					<button onclick="location='findInsertForm.go'" class="btn-custom">글 작성</button>
					<h4><font color="red">회원만 글 작성 가능</font></h4>
				</se:authorize>
				<se:authorize access="hasRole('ROLE_MEMBER')">
					<button onclick="location='<c:url value="../member/mypageForm.go" />'" class="btn-custom">추가정보 입력하기</button>
					<h4><font color="red">추가 정보 입력 후<br>글을 작성 할 수 있습니다.</font></h4>
				</se:authorize>
				<se:authorize access="hasAnyRole('ROLE_VIP', 'ROLE_GUIDE', 'ROLE_ADMIN')">
					<button onclick="location='findInsertForm.go'" class="btn-custom">글 작성</button>
				</se:authorize>
			</div>
			
			<!-- 검색 -->
			<div class="side-menu-bg">
	   			<form action="findSearchListForm.go" method="post">
	   				<h4>검색해서 찾아보세요!</h4>
	            	<div class="row">
	            		<!-- 나라 선택 -->
	            		<div class="col-md-6">            		
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
			
			<!-- 나라 검색 -->
			<div class="side-menu-bg">
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
			</div>
			
			<!-- 가장 많이 본 글 -->
			<div class="side-menu-bg">
				<h4>가장 많이 본 글 TOP 5</h4>
				<div id="mostViewList"></div>
			</div>
		</div>
		
		<!-- List -->
		<div class="col-md-9">
		
			<!-- Post Content -->
			<div class="row">
				<div class="col-md-12 col-sm-6 col-xs-12">
				
					<!-- 전체 게시물 개수 -->
					<div class="row">
						<label>게시물 개수</label> ${totalCount}
					</div>
					
					<!-- 게시물 -->
					<c:forEach items="${findList}" var="list">
						<div class="row">
							<div class="col-md-12 find-list-content">
								<label>제목</label> <a href="findDetailForm.go?find_pk=${list.find_pk}">${list.find_title}</a><br>
								<label>여행장소</label> ${list.find_place1} - ${list.find_place2} - ${list.find_place3}<br>
								<label>작성자</label> ${list.member_id}<br>
								<label>여행기간</label> ${list.find_startDate} ~ ${list.find_endDate}<br>
								조회수 ${list.find_hit}
								<se:authorize access="isAuthenticated()">
									<br>
	              					<se:authentication property="principal.username" var="sessionID"/>
	              					<c:if test="${list.member_id == sessionID}">
	              						<button class="btn-custom" onclick="location='findUpdateForm.go?find_pk=${list.find_pk}'">수정</button>
										<button class="btn-custom" onclick="location='findDeletePro.go?find_pk=${list.find_pk}'">삭제</button>
	              					</c:if>
	              				</se:authorize>
	              				<br>
							</div>
              				
						</div>
					</c:forEach>
					
					<!-- 페이지이이이잉... -->
					<hr>
					<div class="row find-paging-content">
						<div class="col-lg-12">
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
					<!-- 페이징 끝 -->
				</div>
			</div>
			
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>