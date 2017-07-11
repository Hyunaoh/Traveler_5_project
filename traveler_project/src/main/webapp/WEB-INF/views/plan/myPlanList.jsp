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
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<section id="fh5co-work" style="background-image: url(<c:url value='/resources/images/plan-bg.jpg' />);" data-stellar-background-ratio="0.5" data-section="work">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">여행계획</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>간단하게 여행을 계획하세요! 편안하고 즐거운 여행을 보낼 수 습니다!<br><a href="myPlanInsertForm.go" class="pointer" style="color:#b3ffb3;">계획 세우기</a>를 눌러주세요</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row row-bottom-padded-sm">
				<c:set value="1" var="count" />
				<c:forEach items="${planListAll}" var="list">
					<div class="col-md-4 col-sm-6 col-xxs-12">
					<div style="background-color:#fff; margin:15px 2px 15px 2px; padding:10px 10px 15px 10px;" class="to-animate">
						<a href="<c:url value='/resources/images/plan_img/${list.plan_img}' />" style="weight: 200px; height:200px;" class="fh5co-project-item image-popup to-animate">
							<img src="<c:url value='/resources/images/plan_img/${list.plan_img}' />" alt="이미지 오류" class="img-responsive" >
						</a>
						<div class="fh5co-text">
							<h2 class="pointer" onclick="location='myPlanDetailForm.go?plan_pk=${list.plan_pk}'">${list.plan_title}</h2>
							<span class="col-md-12" style="color:rgba(0,0,0,0.5);">${list.plan_regDate}</span>
							<hr>
							<span class="col-md-6"></span>
							<form action="myPlanUpdateForm.go" method="post" class="col-md-3">
								<input type="hidden" value="${list.plan_pk}" name="plan_pk"/>
								<input type="submit" class="btn btn-default btn-sm" value="수정"/>
							</form>
							<form action="myPlanDeletePro.go" method="post" class="col-md-3">
								<input type="hidden" value="${list.plan_pk}" name="plan_pk"/>
								<input type="submit" class="btn btn-default btn-sm" value="삭제"/>
							</form>
							<br>
						</div>
					</div>
					</div>
					<c:set value="${count+1}" var="count" />
					<c:if test="${count > 2}">
						<c:set value="1" var="count" />
						<div class="clearfix visible-sm-block"></div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</section>
	
</body>
</html>