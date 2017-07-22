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
	
	<!-- jQuery -->
	<script src="<c:url value="/resources/js/bootstrap/jquery.min.js"/>"></script>
	
	<script type="text/javascript">
		$('#findDetailTap').click(function(e) {
			e.preventDefault()
			$(this).tab('show')
		})
	</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="find-banner" style="background-image:url('<c:url value='/resources/images/find_img/find_list_banner.jpg' />');"></div>
	
	<!-- contents -->
	<div class="container find-detail-content">

		<!-- 탭 메뉴 -->
		<div role="tabpanel">
		
			<!-- 네비 탭 -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active">
					<a href="#home" aria-controls="home" role="tab" data-toggle="tab">원하는 여행</a>
				</li>
				<li role="presentation">
					<a href="#place" aria-controls="place" role="tab" data-toggle="tab">원하는 여행 코스</a>
				</li>
				<li role="presentation">
					<a href="#writer" aria-controls="writer" role="tab" data-toggle="tab">작성자 안내</a>
				</li>
			</ul>

			<!-- 탭 내용 -->
			<div class="tab-content">
			
				<!-- 원하는 여행 -->
				<div role="tabpanel" class="tab-pane fade in active" id="home">
					<div class="row">
						<!-- 메인 내용 -->
						<div class="col-md-8">
							<label class="find-detail-header">${findVO.find_title}</label>
							<p class="find-detail-regDate-text">${findVO.find_regDate}</p>
							
							<hr>
							<label class="find-detail-header">상세 내용</label>
							<p>${findVO.find_content}</p>
						</div>
						<!-- 사이드 -->
						<div class="col-md-4">
						
						</div>
					</div>
				</div>
				
				<!-- 원하는 여행 코스 -->
				<div role="tabpanel" class="tab-pane fade" id="place">
					<div class="row">
						<!-- 메인 내용 -->
						<div class="col-md-8">
							<label class="find-detail-header">여행하는 곳</label>
							<p>${findVO.find_place1} - ${findVO.find_place2} - ${findVO.find_place3}</p>
								
							<hr>
							<label class="find-detail-header">기간</label>
							<p>${findVO.find_startDate} ~ ${findVO.find_endDate}</p>		
						</div>
						<!-- 사이드 -->
						<div class="col-md-4">
							<div class="find-detail-place-img-container">
								<!-- 미국 -->
								<c:if test="${findVO.find_place1 == '미국'}">
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-usa1.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-usa2.jpg" />">
								</c:if>
								<!-- 대한민국 -->
								<c:if test="${findVO.find_place1 == '대한민국'}">
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-korea1.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-korea2.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-korea3.jpg" />">
								</c:if>
								<!-- 캐나다 -->
								<c:if test="${findVO.find_place1 == '캐나다'}">
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-canada1.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-canada2.jpg" />">
								</c:if>
								<!-- 프랑스 -->
								<c:if test="${findVO.find_place1 == '프랑스'}">
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-france1.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-france2.jpg" />">
								</c:if>
								<!-- 이탈리아 -->
								<c:if test="${findVO.find_place1 == '이탈리아'}">
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-italy1.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-italy2.jpg" />">
								</c:if>
								<!-- 체코 -->
								<c:if test="${findVO.find_place1 == '체코'}">
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-czech1.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-czech2.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-czech3.jpg" />">
								</c:if>
								<!-- 중국 -->
								<c:if test="${findVO.find_place1 == '중국'}">
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-china1.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-china2.jpg" />">
								</c:if>
								<!-- 일본 -->
								<c:if test="${findVO.find_place1 == '일본'}">
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-japan1.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-japan2.jpg" />">
								</c:if>
								<!-- 영국 -->
								<c:if test="${findVO.find_place1 == '영국'}">
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-england1.jpg" />">
									<hr>
									<img class="find-detail-place-img" src="<c:url value="/resources/images/find_img/find-detail-england2.jpg" />">
								</c:if>
								
							</div>
						</div>
					</div>
				</div>
				
				<!-- 작성자 안내 -->
				<div role="tabpanel" class="tab-pane fade" id="writer">
					<div class="row">
						<!-- 메인 내용 -->
						<div class="col-md-8">
							<label class="find-detail-header">작성자 ID</label>
							<p>
								${findVO.member_id}
							</p>
							
						</div>
						<!-- 사이드 -->
						<div class="col-md-4">
						
						</div>
					</div>
				</div>
				
			</div>

		</div>
		
		<!-- 버튼 -->
		<div class="row find-detail-btn-container">
			<div class="col-md-12 col-sm-12">
				<button onclick="location='findListForm.go'" class="btn-custom">목록보기</button>
				<se:authentication property="principal.username" var="username"/>
				<c:if test="${findVO.member_id == username}">
					<button onclick="location='findUpdateForm.go?find_pk=${findVO.find_pk}'" class="btn-custom">수정</button>
					<button onclick="location='findDeletePro.go?find_pk=${findVO.find_pk}'"class="btn-custom">삭제</button>
				</c:if>
				<button onclick="location='findDeclarePro.go?find_pk=${findVO.find_pk}'" class="btn-custom">신고</button>
			</div>
		</div>

	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>