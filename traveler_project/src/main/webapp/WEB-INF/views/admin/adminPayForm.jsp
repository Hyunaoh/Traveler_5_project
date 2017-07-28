<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 결제 여부 확인 (관리자)</title>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
	<!-- Admin CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/admin/admin.css" />" />

</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="admin-banner" style="background-image:url('<c:url value='/resources/images/admin_img/admin-banner.jpg' />');"></div>
	
	<div class="container admin-container">
		<div class="row">
			<!-- 싱글 패키지 -->
			<div class="col-md-6">
			
			
			</div>
			
			<!-- 단체 패키지 -->
			<div class="col-md-6">
				<h1>단체 패키지</h1><hr>
				<c:forEach items="${m_groupList}" var="list">
					<div class="group_package_container">
						
						<label>상품 PK</label>
						<p><a href="../group/groupDetailForm.go?group_pak_pk=${list.group_mem_package_pk}">${list.group_mem_package_pk}</a></p>
						
						<label>예약자 ID</label>
						<p>${list.group_mem_reserve_id}</p>
						
						<label>예약자 이름</label>
						<p>${list.group_mem_name}</p>
						
						<label>인원</label>
						<p>${list.group_mem_count}</p>
						
						<label>총 가격</label>
						<p>${list.group_mem_count}명 (두당 : ${list.group_pak_cost} 원 )
						= ${list.group_mem_count * list.group_pak_cost} 원</p>
						
						<!-- 입금 완료 버튼 -->
						<form action="adminPayPro.go" method="post">
							<input type="hidden" name="group_mem_reserve_id" value="${list.group_mem_reserve_id}">
							<input type="hidden" name="group_mem_status" value="1"/>
							<input type="submit" class="btn-custom" value="입금완료"/>
						</form>
					</div>
					
					<hr>
				</c:forEach>
			</div>
			
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>