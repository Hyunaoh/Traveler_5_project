<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>여행가 - 예약 취소</title>
</head>
<body style="background-image: url('<c:url value="/resources/images/m_group_bg.jpg" />');">
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="container" style="padding-top:23rem;">
		<div class="row">
			<div class="col-md-6">
				<c:forEach items="${m_groupList}" var="list">
					<div class="row">
						<div class="col-md-12 bg-color">
							<c:set value="${list.group_mem_package_pk}" var="group_mem_package_pk"/>
							<!-- 예약자 대표 ID -->
							<c:if test="${list.group_mem_id != '없음'}">
								<h3>회원</h3>
								<label>ID</label>
								${list.group_mem_id}
							</c:if>
							<c:if test="${list.group_mem_id == '없음'}">
								<h3>비회원</h3>
							</c:if>
							
							<!-- 이름 -->
							<label>이름</label>
							${list.group_mem_name} 님 
							
							<!-- 연령 -->
							<label>연령</label>
							${list.group_mem_age}
							<input type="hidden" name="member_age" value="${list.group_mem_age}" />
							
							<!-- 성별 -->
							<label>성별</label>
							${list.group_mem_gender}
						</div>
					</div>
				</c:forEach>
				<c:if test="${m_groupList eq '[]'}">
					예약 내역 없음
				</c:if>
			</div>
			<!-- side chart -->
			<div class="col-md-6">
				<div class="side-fix">
					<c:if test="${m_groupList ne '[]'}">
					<button onclick="location='m_groupDeletePro.go?group_mem_package_pk=${group_mem_package_pk}'" class="btn btn-primary btn-md">
					예약취소
					</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>