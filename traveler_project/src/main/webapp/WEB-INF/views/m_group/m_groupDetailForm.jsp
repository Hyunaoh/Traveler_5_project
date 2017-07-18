<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 예약 현황</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<style type="text/css">
		.container{
			color: rgba(255, 255, 255, 0.5);
		}
		.col-md-6 label{
			display: block;
			color: rgba(255, 255, 255, 0.7);
		}
		.col-md-6 h3{
			color: rgba(255, 255, 255, 0.8);
			font-style: italic;
		}
	</style>
</head>
<body style="background-image: url('<c:url value="/resources/images/m_group_bg.jpg" />');">
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="container" style="padding-top:23rem;">
		<c:forEach items="${m_groupList}" var="list">
			<div class="row">
				<div class="col-md-6">
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
					
					<!-- 성별 -->
					<label>성별</label>
					${list.group_mem_gender}

					<hr>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>