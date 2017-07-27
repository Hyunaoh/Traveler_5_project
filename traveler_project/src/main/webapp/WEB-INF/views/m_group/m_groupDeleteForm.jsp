<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!-- Group CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/group/group.css" />" />
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<title>여행가 - 예약 취소</title>
</head>
<body>
	
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="group-banner" style="background-image:url('<c:url value='/resources/images/group_img/group-package-banner.jpg' />');"></div>
	
	<!-- content -->
	<div class="container m_gorup-container">
	
		<div class="row">
			<div class="col-md-6">
				<c:forEach items="${m_groupList}" var="list">
					<div class="row">
						<div class="col-md-12 bg-color">
							<c:set value="${list.group_mem_package_pk}" var="group_mem_package_pk"/>
							
							<!-- 예약자 대표 ID -->
							<c:if test="${list.group_mem_id != '없음'}">
								<h3>회원</h3>
								<label>ID</label><br>
								${list.group_mem_id}
							</c:if>
							<c:if test="${list.group_mem_id == '없음'}">
								<h3>비회원</h3>
							</c:if>
							
							<!-- 이름 -->
							<hr>
							<label>이름</label><br>
							${list.group_mem_name} 님 
							
							<!-- 연령 -->
							<hr>
							<label>연령</label><br>
							${list.group_mem_age}
							<input type="hidden" name="member_age" value="${list.group_mem_age}" />
							
							<!-- 성별 -->
							<hr>
							<label>성별</label><br>
							${list.group_mem_gender}
						</div>
					</div>
				</c:forEach>
				<c:if test="${m_groupList eq '[]'}">
					<label class="m_group-delete-form-header">예약 내역 없음</label>
				</c:if>
			</div>
			
			<!-- side -->
			<div class="col-md-2">
				<div class="side-fix">
					<c:if test="${m_groupList ne '[]'}">
					<button onclick="location='m_groupDeletePro.go?group_mem_package_pk=${group_mem_package_pk}'"
					class="btn-custom">
					예약취소
					</button>
					</c:if>
				</div>
			</div>
			
			<!-- 안내사항 -->
			<div class="col-md-4">
				<ul class="m_group-ul">
					<li>
						예약을 취소하시면, 입력했던 정보는 없어지며<br>
						다시 신청 하실때는 <font color="green">재입력</font> 해야됩니다.
					</li>
				</ul>
			</div>
			
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
	
</body>
</html>