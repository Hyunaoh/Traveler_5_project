<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 나의 여행 계획</title>
	<style type="text/css">
		.pointer:hover{
			cursor: pointer;
			color: rgba(0,0,0,0.5);
		}
	</style>
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
			<div class="col-md-12 section-heading text-center">
				<h2 class="to-animate">여행계획</h2>
				<div class="row">
					<div class="col-md-8 col-md-offset-2 subtext to-animate">
						<h3>간단하게 여행을 계획하세요! 편안하고 즐거운 여행을 보낼 수 있습니다!<br><a href="myPlanInsertForm.go" class="pointer" style="color:blue;">계획 세우기</a>를 눌러주세요</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<c:set value="1" var="count" />
			<c:forEach items="${planListAll}" var="list">
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<div class="plan-list-container">
						<!-- 썸네일 -->
						<img style="width: 200px; height:200px;" src="<c:url value='/resources/images/plan_img/${list.plan_img}' />" alt="이미지 오류" class="img-responsive" >
						
						<h2 class="pointer" onclick="location='myPlanDetailForm.go?plan_pk=${list.plan_pk}'">${list.plan_title}</h2>
						<span class="col-md-12" style="color:rgba(0,0,0,0.5);">${list.plan_regDate}</span>
						<hr>
						<span class="col-md-6"></span>
						<form action="myPlanUpdateForm.go" method="post" class="col-md-3">
							<input type="hidden" value="${list.plan_pk}" name="plan_pk"/>
							<input type="submit" class="btn-custom" value="수정"/>
						</form>
						<form action="myPlanDeletePro.go" method="post" class="col-md-3">
							<input type="hidden" value="${list.plan_pk}" name="plan_pk"/>
							<input type="submit" class="btn-custom" value="삭제"/>
						</form>
						<br>
					</div>
					
				</div>
				<c:set value="${count+1}" var="count" />
				<c:if test="${count > 2}">
					<c:set value="1" var="count" />
				</c:if>
			</c:forEach>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>