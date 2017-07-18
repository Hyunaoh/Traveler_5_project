<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 관리자 (가이드 단체 상품)</title>
	<style type="text/css">
		.col-md-6 h4 label{
			font-style: italic;
			display: block;
		}
		.col-md-6 form{
			display: inline-block;
		}
		.col-md-6 h1{
			color: rgba(255, 255, 255, 0.7);
		}
		.custom-well {
			background-color: rgba(255, 255, 255, 0.4);
			padding: 1rem;
			border: 0.5rem solid rgba(255, 255, 255, 0.2);
			border-radius: 20px;
		}
	</style>
</head>
<body style="background-image: url('<c:url value="/resources/images/m_group_bg.jpg" />');">
	<c:if test="${check == true}">
		<script type="text/javascript">
			alert("완료");
		</script>
	</c:if>
	<c:if test="${check == false}">
		<script type="text/javascript">
			alert("Error");
		</script>
	</c:if>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<div class="container" style="padding-top: 18rem;">
		<div class="row">
			<!-- 승인 안된 상품 -->
			<div class="col-md-6">
				<h1>승인 미완료</h1>
				<div class="custom-well">
				<c:forEach items="${groupList1}" var="list1">
					<!-- Preview Image -->
					<img src="<c:url value="/resources/images/group_img/${list1.group_pak_photo}" />" style="width: 100%;">
					<!-- 제목 -->
	                <h4><label>제목</label>
	                ${list1.group_pak_title}
					</h4>
					<!-- 가이드 ID -->
	                <h4><label>가이드 ID</label>
	                ${list1.group_pak_guide}
					</h4>
					<!-- 작성일 -->
	                <h4><label>가이드 ID</label>
	                ${list1.group_pak_regDate}
					</h4>
					<!-- 작성일 -->
	                <h4><label>가이드 ID</label>
	                ${list1.group_pak_regDate}
					</h4>
					<!-- 위치 -->
	                <h4><label>나라, 도시, 상세주소</label>
	                ${list1.group_pak_place1} - ${list1.group_pak_place2} - ${list1.group_pak_place3}
					</h4>
					<!-- 가격(인당) -->
	                <h4><label>가격(인당)</label>
	                ${list1.group_pak_cost}
					</h4>
					<!-- 총 인원 -->
	                <h4><label>총 인원</label>
	                ${list1.group_pak_min} ~ ${list1.group_pak_max} ( 최소 인원 ~ 최대 인원 )
					</h4>
					<!-- 현재 인원 -->
	                <h4><label>현재 인원</label>
	               	${list1.group_pak_current}
					</h4>
					<!-- 내용 -->
	                <h4><label>내용</label>
	                ${list1.group_pak_content}
					</h4>
					<form action="adminGroupPackageUpdate.go" method="post">
						<input type="hidden" name="group_pak_pk" value="${list1.group_pak_pk}"/>
						<input type="hidden" name="group_pak_status" value="1"/>
						<input type="submit" value="승인" class="btn btn-default btn-md"/>
					</form>
					<form action="adminGroupPackageDelete.go" method="post">
						<input type="hidden" name="group_pak_pk" value="${list1.group_pak_pk}"/>
						<input type="submit" value="삭제" class="btn btn-default btn-md"/>
					</form>
					<hr>
				</c:forEach>
				</div>
			</div>
			<!-- 승인 완료된 상품 -->
			<div class="col-md-6">
				<h1>승인 완료</h1>
				<div class="custom-well">
				<c:forEach items="${groupList2}" var="list2">
					<!-- Preview Image -->
					<img src="<c:url value="/resources/images/group_img/${list2.group_pak_photo}" />" style="width: 100%;">
					<!-- 제목 -->
	                <h4><label>제목</label>
	                ${list2.group_pak_title}
					</h4>
					<!-- 가이드 ID -->
	                <h4><label>가이드 ID</label>
	                ${list2.group_pak_guide}
					</h4>
					<!-- 작성일 -->
	                <h4><label>가이드 ID</label>
	                ${list2.group_pak_regDate}
					</h4>
					<!-- 작성일 -->
	                <h4><label>가이드 ID</label>
	                ${list2.group_pak_regDate}
					</h4>
					<!-- 위치 -->
	                <h4><label>나라, 도시, 상세주소</label>
	                ${list2.group_pak_place1} - ${list2.group_pak_place2} - ${list2.group_pak_place3}
					</h4>
					<!-- 가격(인당) -->
	                <h4><label>가격(인당)</label>
	                ${list2.group_pak_cost}
					</h4>
					<!-- 총 인원 -->
	                <h4><label>총 인원</label>
	                ${list2.group_pak_min} ~ ${list2.group_pak_max} ( 최소 인원 ~ 최대 인원 )
					</h4>
					<!-- 현재 인원 -->
	                <h4><label>현재 인원</label>
	               	${list2.group_pak_current}
					</h4>
					<!-- 내용 -->
	                <h4><label>내용</label>
	                ${list2.group_pak_content}
					</h4>
					<div class="inline">
						<form action="adminGroupPackageUpdate.go" method="post">
							<input type="hidden" name="group_pak_pk" value="${list2.group_pak_pk}"/>
							<input type="hidden" name="group_pak_status" value="0"/>
							<input type="submit" value="미승인" class="btn btn-default btn-md"/>
						</form>
						<form action="adminGroupPackageDelete.go" method="post">
							<input type="hidden" name="group_pak_pk" value="${list2.group_pak_pk}"/>
							<input type="submit" value="삭제" class="btn btn-default btn-md"/>
						</form>
					</div>
					<hr>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>

</body>
</html>