<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 패키지 상품 상세보기</title>
	<script type="text/javascript">
	function updateEnd(){
		var revPk = document.getElementById("review_pk").value;
		var revComment = document.getElementById("review_comment").value;
		var packPK = document.getElementById("package_pk").value;
		var sendRoute = "/review/updatePro.go?review_comment=" + revComment
				+ "&review_pk=" + revPk + "&package_pk=" + packPK;
		location.href=sendRoute;
	}
	</script>
	<link rel="stylesheet" href="../../../resources/css/review/star.css">
	<script src="../../../resources/js/review/jquery-1.11.3.min.js"></script>
</head>
<body>
	PK : ${packageVO.package_pk}<br>
	제목 : ${packageVO.package_title}<br>
	작성날짜 : ${packageVO.package_regDate}<br>
	작성자 :  ${packageVO.member_id}<br>
	내용 : ${packageVO.package_content}<br>
	여행하는 곳 : ${packageVO.package_place1} ${packageVO.package_place2}<br>
	상세 내용: ${packageVO.package_place3}<br>
	소요시간 : ${packageVO.package_leadTime} <br>
	조회수 : ${packageVO.package_hit } <br>
	해시태그 : ${packageVO.package_tag }<br>
	<hr>
	<!-- 평균 별점 -->
	<span class="star-view">
			<span class="view">
		    	<input type="radio" name="review_score" value="1" id="p1">
		    	<label for="pv1" style="width:${packageVO.review_avg * 10}px"></label>
		 	</span>
		 	${packageVO.review_avg } 점				
	</span>
	<!-- 패키지 찾기에서 접근했을 때(이미 승인 된 상품) -->
	<c:if test="${packageVO.package_status eq 1 }">
		<a href="getAllPackage.go">목록보기</a>
		<a href="updatePackageForm.go?package_pk=${packageVO.package_pk}">수정</a>
		<a href="packageDeletePro.go?package_pk=${packageVO.package_pk}">삭제</a>
		<br>
		<h4><a href="/review/reviewWriteForm.go?package_pk=${packageVO.package_pk }">후기작성</a></h4>
		<br><br><br>
		<!-- 리뷰 보여주기 -->
		<c:forEach items="${rlist}" var="r">
		<span class="star-view">
			<span class="view">
		    	<input type="radio" name="review_score" value="1" id="p1">
		    	<label for="pv1" style="width:${r.review_score * 10}px"></label>
		 	</span>						
		</span>
		<c:if test="${r.update_check eq 0 }">
			<strong>글쓴이 : ${r.member_id }</strong> &nbsp;&nbsp; ${r.review_date }<br>
			<textarea rows="10" cols="30" readonly="readonly">${r.review_comment }</textarea>
			<c:if test="${r.member_id eq user}">
			<button onclick="location='/review/updateReady.go?package_pk=${r.package_pk}&review_pk=${r.review_pk }'">수정</button>
			<button onclick="location='/review/deleteReview.go?package_pk=${r.package_pk }&review_pk=${r.review_pk}'">삭제</button>
			</c:if>
			<hr>
		</c:if>
		<c:if test="${r.update_check eq 1 }">
			<strong>글쓴이 : ${r.member_id }</strong> &nbsp;&nbsp; ${r.review_date }<br>
			<textarea rows="10" cols="30" id="review_comment">${r.review_comment }</textarea>
			<input type="hidden" value="${r.review_pk }" id="review_pk">
			<input type="hidden" value="${r.package_pk }" id="package_pk">
			<c:if test="${r.member_id eq user}">
			<button onclick="updateEnd()">완료</button>
			<button onclick="location='/package/packageDetailForm.go?package_pk=${r.package_pk}'">취소</button>
			</c:if>
			<hr>
		</c:if>
	</c:forEach>
		<br>
		이런 상품은 어떠세염?(비슷한 상품들 띄워주기)<br>
		<c:forEach items="" var="list">
			<c:if test="${list.package_image ne null}">
				<a href="#" onclick="location='<c:url value="/package/packageDetailForm.go?package_pk=${list.package_pk}" />'"  class="fh5co-project-item image-popup to-animate">
					<img src="<c:url value="/resources/images/package_img/${list.package_image}" />" alt="Image" class="img-responsive" style="height: 270px; width: 359.98px;">
					<div class="fh5co-text">
						<h2>${list.package_title}</h2>
						<span> 작성자 : ${list.member_id} / 소요시간 : ${list.package_leadTime}</span>
					</div>
				</a>
			</c:if>
		</c:forEach>
		
		
	</c:if>
	<!-- 어드민에서 접근했을 때(미승인 상품) -->
	<c:if test="${packageVO.package_status eq 0 }">
		<a href="../admin/adminPackagePro.go?package_pk=${packageVO.package_pk}">상품 게시글 승인하기</a>
		<a href="packageDeletePro.go?package_pk=${packageVO.package_pk}">게시글 삭제</a>
	</c:if>
</body>
</html>