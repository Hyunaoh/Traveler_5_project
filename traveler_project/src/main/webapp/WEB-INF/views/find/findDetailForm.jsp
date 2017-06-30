<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 가이드 찾기 글</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- contents -->
	<section id="fh5co-counters" style="background-image: url(<c:url value='/resources/images/full_image_1.jpg' />);" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center to-animate">
					<h2>가이드 찾기</h2>
				</div>
			</div>
			<div class="row row-bottom-padded-md well">
				<div class="col-md-6 to-animate">
					<div class="form-group ">
						<label>제목</label><br>
						${findVO.find_title}
					<br>
					</div>
					<div class="form-group">
						<label>본문</label><br>
						${findVO.find_content}
					</div>
					<div class="form-group">
						<label>여행하는 곳</label><br>
						${findVO.find_place1} ${findVO.find_place2}
					</div>
					<div class="form-group">
						${findVO.find_place3}
					</div>
					<div class="form-group">
						<label>기간</label><br>
						${findVO.find_startDate} ~ ${findVO.find_endDate}							
					</div>
					<div class="form-group ">
						<a href="findListForm.go" class="btn btn-primary btn-lg">목록보기</a>
						<se:authentication property="principal.username" var="username"/>
						<c:if test="${findVO.member_id == username}">
							<a href="findUpdateForm.go?find_pk=${findVO.find_pk}" class="btn btn-primary btn-lg">수정</a>
							<a href="findDeletePro.go?find_pk=${findVO.find_pk}"class="btn btn-primary btn-lg">삭제</a>
						</c:if>
						<a href="findDeclarePro.go?find_pk=${findVO.find_pk}" class="btn btn-primary btn-lg">신고</a>
					</div>
				</div>
				<div class="col-md-6 to-animate">
					<div class="form-group">
						<label>작성시간</label><br>
						${findVO.find_regDate}
					</div>
					<div class="form-group">
						<label>작성자</label><br>
						${findVO.member_id}
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>