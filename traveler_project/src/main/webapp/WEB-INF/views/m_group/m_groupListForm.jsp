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
		.col-md-6 form{
			display: inline;
		}
		.custom-header{
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
		<h1 class="custom-header">예약한 손님</h1>
		<c:forEach items="${m_groupList}" var="list">
			<div class="row">
				<div class="col-md-6">
					<!-- 예약자 대표 ID -->
					<label>예약자 ID</label>
					${list.group_mem_reserve_id}
					
					<!-- 상세정보 보기 -->
					<form action="m_groupDetailForm.go" method="post">
						<input type="hidden" value="${list.group_mem_package_pk}" name="group_mem_package_pk" />
						<input type="hidden" value="${list.group_mem_reserve_id}" name="group_mem_reserve_id" />
						<input type="submit" value="자세한 내용 보기" class="btn btn-default btn-md"/>
					</form>
					
					<!-- 이름 -->
					<label>이름</label>
					<c:if test="${list.group_mem_count == 1}">
						${list.group_mem_name} 님 (${list.group_mem_count}명)
					</c:if>
					<c:if test="${list.group_mem_count != 1}">
						${list.group_mem_name} 님 외 ${list.group_mem_count-1} 명 (총: ${list.group_mem_count}명)
					</c:if>
					
					<!-- 연령 -->
					<c:if test="${list.group_mem_count == 1}">
						<label>연령</label>
					</c:if>
					<c:if test="${list.group_mem_count != 1}">
						<label>평균 연령</label>
					</c:if>
					${list.avg_age}
					
					<!-- 입급 여부 -->
					<label>입급 여부</label>
					<c:if test="${list.group_mem_status == 0}">
						미입금
					</c:if>
					<c:if test="${list.group_mem_status == 1}">
						입금
					</c:if>
					<c:if test="${list.group_mem_status != 1 and list.group_mem_status != 0 }">
						Error!
					</c:if>
					<hr>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>