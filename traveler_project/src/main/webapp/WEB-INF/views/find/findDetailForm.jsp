<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 가이드 찾기 글</title>
	<!-- Find  CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/find/find.css" />" />
	
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="find-banner" style="background-image:url('<c:url value='/resources/images/find_img/find_detail_banner.jpg' />');"></div>
	
	<!-- contents -->
	<div class="container find-detail-content">
		
		<div class="row">
			<div class="col-md-6 col-sm-12">
				<div class="form-group ">
					<label>제목</label> ${findVO.find_title}<br>
					${findVO.find_regDate}
				</div>

				<hr>
				<div class="form-group">
					<label>여행하는 곳</label><br>
					${findVO.find_place1} ${findVO.find_place2}
				</div>
				<div class="form-group">
					${findVO.find_place3}
				</div>
				
				<hr>
				<div class="form-group">
					<label>기간</label><br>
					${findVO.find_startDate} ~ ${findVO.find_endDate}							
				</div>
				
				<hr>
				<div class="form-group">
					<label>본문</label><br>
					${findVO.find_content}
				</div>
				
				<div class="form-group">
					<button onclick="location='findListForm.go'" class="btn-custom">목록보기</button>
					<se:authentication property="principal.username" var="username"/>
					<c:if test="${findVO.member_id == username}">
						<button onclick="location='findUpdateForm.go?find_pk=${findVO.find_pk}'" class="btn-custom">수정</button>
						<button onclick="location='findDeletePro.go?find_pk=${findVO.find_pk}'"class="btn-custom">삭제</button>
					</c:if>
					<button onclick="location='findDeclarePro.go?find_pk=${findVO.find_pk}'" class="btn-custom">신고</button>
				</div>
			</div>
			<div class="col-md-6 to-animate">
				<div class="form-group">
					<label>작성자</label><br>
					${findVO.member_id}
				</div>
				<button onclick="location='#'" class="btn-custom">작성자 정보 보기</button>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>