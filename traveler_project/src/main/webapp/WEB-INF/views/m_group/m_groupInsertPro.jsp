<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 결제</title>
	<!-- Group CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/group/group.css" />" />
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />

	<!-- banner -->
	<div class="group-banner" style="background-image:url('<c:url value='/resources/images/group_img/group-package-banner.jpg' />');"></div>
	
	<div class="container group-container">
		<div class="row">
			<div class="col-md-6">
				<label>우리 은행</label>
				<br>123-124112-1251151
				
				<hr>
				<label>신한 은행</label>
				<br>2343-548702-879121
				
				<hr>
				<label>국민 은행</label>
				<br>698-126122-12536941
				
				<hr>
				<label>제일 은행</label>
				<br>4653-14565432-57429
			</div>
			<div class="col-md-6">
				<ul class="m_group-ul">
					<li>
						옆에 4개의 은행 중 <font color="green">한 곳의 은행</font>을 골라 넣어주시면 됩니다.<br>
						관리자가 입금 여부를 확인해드립니다.
					</li>
					<li>
						입금시 <font color="green">자신의 ID에 해당하는 이름</font>으로 입금해주시고,
						<br>만약 다른 이름으로 입금했을 경우 <font color="green">고객센터</font>로 질문 또는 전화를 주시면 감사하겠습니다.
					</li>
					<li>확인 하는데 <font color="green">2~3일</font> 정도의 시간이 걸릴 수 있습니다.</li>
					<li>
						궁금한 사항이 있으면 <font color="green">전화 '031) 123-4567'</font><br>
						또는 <font color="green">카카오 '7538518'</font> 로 연락 주시길 바랍니다.
					</li>
				</ul>
			</div>
		</div>
		<br><br><br>
		<div class="row">
			<div class="col-md-12">
				<button onclick="location='../group/groupDetailForm.go?group_pak_pk=${group_pak_pk}'"
				class="btn-custom">돌아가기</button>
			</div>
		</div>
	</div>
    <!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>