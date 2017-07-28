<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 관리자 (게시판 관리)</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<!-- Admin CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/admin.css" />" />
</head>
<body>
	<c:if test="${check == true}">
		<script type="text/javascript">
			alert("완료");
		</script>
	</c:if>
	<c:if test="${check == false}">
		<script type="text/javascript">
			alert("Error");
		</script>
	</c:if>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="admin-banner" style="background-image:url('<c:url value='/resources/images/admin_img/admin-banner.jpg' />');"></div>
	
	<!-- contents -->
	<div class="container admin-container">
		<div class="row">
			<div class="col-md-12 section-heading text-left">
				<h2 class="admin-header">게시물 관리</h2>
				<div class="row">
					<div class="col-md-12">
						<h3>관리자분들은 부적절한 컨텐츠를 가진 게시물을 발견하면 즉시 삭제 부탁드립니다.</h3>
					</div>
				</div>
			</div>
		</div>
		<!-- Contents -->
		<div class="row">
			<div class="col-lg-8">
				<!-- Title -->
				<div class="col-md-12">
					<h3>전체 게시물</h3>
					<hr>
				</div>
				<!-- Left Contents -->
				<c:forEach items="${findList}" var="list">
					<div class="col-md-6 col-sm-6">
					
						<div class="cursor-point">
							<img src="" alt="이미지 없음">
							<h3>Title : ${list.find_title}</h3>
							<p>내부코드 : ${list.find_pk}</p>
							<p>여행위치 : ${list.find_place1}-${list.find_place2}-${list.find_place3}</p>
							<p>기간 : ${list.find_startDate} ~ ${list.find_endDate}</p>
							<p>조회수 : ${list.find_hit}</p>
							<p>작성자 : ${list.member_id}</p>
							<p>작성날짜 : ${list.find_regDate}</p>
							<p><a class="btn-custom" href="<c:url value='adminBoardDeletePro.go?find_pk=${list.find_pk}' />">삭제</a></p>
						</div>
					</div>
				</c:forEach>
				
			</div>
			<!-- Side Contents -->
			<div class="col-lg-4">
				<!-- Title -->
				<div class="col-md-12 subtext">
					<h3>의심되는 게시물</h3>
					<hr>
				</div>
				<c:forEach items="${badFindList}" var="badList">
					<div class="col-md-12 col-sm-12 cursor-point">
						<img src="" alt="이미지 없음">
						<h3>Title : ${badList.find_title}</h3>
						<p>내부코드 : ${badList.find_pk}</p>
						<p>여행위치 : ${badList.find_place1}-${badList.find_place2}-${badList.find_place3}</p>
						<p>기간 : ${badList.find_startDate} ~ ${badList.find_endDate}</p>
						<p>조회수 : ${badList.find_hit}</p>
						<p>작성자 : ${badList.member_id}</p>
						<p>작성날짜 : ${badList.find_regDate}</p>
						<p><a class="btn-custom" href="<c:url value='adminBoardDeletePro.go?find_pk=${badList.find_pk}' />">삭제</a>
						<a class="btn-custom" href="<c:url value='adminBoardDeclarePro.go?find_pk=${badList.find_pk}' />">정상으로 표시</a></p>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<hr>
		<div class="row">
			<div class="fh5co-counter col-lg-7">
				<c:set value="1" var="pageNum" />
				<c:if test="${pagingVO.currentPageNum ne 1 && pagingVO.currentPageNum ne '' && pagingVO.currentPageNum ne null}">
					<a href="adminBoardForm.go?currentPageNum=${pagingVO.currentPageNum-1}">[이전] </a>
				</c:if>
				<c:forEach begin="${pageNum}" end="${pagingVO.totalPageCount}" var="i">
					<a href="adminBoardForm.go?currentPageNum=${i}">${i} </a>
				</c:forEach>
				<c:if test="${spagingVO.totalPageCount ne 1 && pagingVO.currentPageNum eq ''}">
					<a href="adminBoardForm.go?currentPageNum=2">[다음]</a>
				</c:if>
				<c:if test="${pagingVO.currentPageNum ne pagingVO.totalPageCount && pagingVO.currentPageNum >= 1}">
					<a href="adminBoardForm.go?currentPageNum=${pagingVO.currentPageNum+1}">[다음]</a>
				</c:if>
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-4">
				<c:set value="1" var="badPageNum" />
				<c:if test="${pagingVO_bad.currentPageNum ne 1 && pagingVO_bad.currentPageNum ne '' && pagingVO_bad.currentPageNum ne null}">
					<a href="adminBoardForm.go?currentPageNum=${pagingVO_bad.currentPageNum-1}">[이전] </a>
				</c:if>
				<c:forEach begin="${badPageNum}" end="${pagingVO_bad.totalPageCount}" var="i">
					<a href="adminBoardForm.go?currentPageNum=${i}">${i} </a>
				</c:forEach>
				<c:if test="${pagingVO_bad.totalPageCount ne 1 && pagingVO_bad.currentPageNum eq ''}">
					<a href="adminBoardForm.go?currentPageNum=2">[다음]</a>
				</c:if>
				<c:if test="${pagingVO_bad.currentPageNum ne pagingVO_bad.totalPageCount && pagingVO_bad.currentPageNum >= 1}">
					<a href="adminBoardForm.go?currentPageNum=${pagingVO.currentPageNum+1}">[다음]</a>
				</c:if>
			</div>
		</div>
	</div>
		
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>