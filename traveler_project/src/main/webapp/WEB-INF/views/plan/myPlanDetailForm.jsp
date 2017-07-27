<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 여행계획</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- Plan CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/plan/plan.css" />" />
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="plan-banner" style="background-image:url('<c:url value='/resources/images/plan_img/plan_list_banner.jpg' />');"></div>
	
	<!-- content -->
	<div class="container plan-container">
	
		<div class="row">
			<div class="col-md-12">
				<h2>${planVO.plan_title}</h2>
				<div class="row">
					<div class="col-md-8">
						<label>
							작성자 : ${planVO.plan_writer} (여행지 수 : ${planVO.plan_count})
							<br>작성일 : ${planVO.plan_regDate}
						</label>
					</div>
				</div>
			</div>
		</div>
		<hr>
		
		<c:set value="1" var="count" />
		<c:forEach items="${planList}" var="list">
			<div class="row">
				<c:if test="${ count % 2 == 1 }">
					<div class="col-md-6">
						<h3>${count} 번</h3>
						<img src="<c:url value='/resources/images/plan_img/${list.plan_img}' />" style="weight: 230px; height:230px;">
					</div>
				</c:if>
				<div class="col-md-6">
					<h3>내용</h3>
					<div class="form-group">
						<label for="name">소제목</label>
						${list.plan_subTitle}
					</div>
					<div class="form-group">
						<label for="phone">장소</label>
						${list.plan_place}
					</div>
					<div class="form-group">
						<label for="message">기간</label>
						${list.plan_date}
					</div>
					<div class="form-group">
						<label for="email">내용</label>
						${list.plan_content}
					</div>
				</div>
				<c:if test="${ count % 2 == 0 }">
					<div class="col-md-6">
						<h3>${count} 번</h3>
						<img src="<c:url value='/resources/images/plan_img/${list.plan_img}' />" style="weight: 230px; height:230px;">
					</div>
				</c:if>
				<c:set value="${count+1}" var="count" />
			</div>
			<br><hr><br>
		</c:forEach>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>