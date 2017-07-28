<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
#container {
	height: 400px
}
</style>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<div id="container">
	<!-- 개인 패키지  -->
	<div role="private">
	<h2>개인패키지</h2>
		<c:forEach items="${ list2 }" var="list2">
			<img style="width: 180px; height: 180px;"
				src="<c:url value='/resources/images/package_img/${ list2.package_image }' />"
				alt="">
		</c:forEach>

		<div class="row">
			<div class="col-lg-7"></div>
			<div class="form-inline col-lg-5">
				<ul class="pagination" id="jb-paging">
					<c:if test="${currentPageNum > '1'}">
						<li><a href="mypageForm.go?pageNum=${currentPageNum-1}"><span
								class="glyphicon glyphicon-chevron-left"></span></a></li>
					</c:if>
					<c:forEach begin="1" end="${page.pageTotalNum}" var="pageNum">
						<li><a href="mypageForm.go?pageNum=${pageNum}">${pageNum}</a></li>
					</c:forEach>
					<c:if test="${page.pageTotalNum > currentPageNum}">
						<li><a href="mypageForm.go?pageNum=${currentPageNum+1}"><span
								class="glyphicon glyphicon-chevron-right"></span></a></li>
					</c:if>
				</ul>
			</div>
		</div>
		</div>
		
		
		<!-- 단체 패키지  -->
	<div role="group">
	<h2>단체 패키지</h2>
		<c:forEach items="${ list3 }" var="list3">
			<img style="width: 180px; height: 180px;"
				src="<c:url value='/resources/images/package_img/${ list3.group_pak_photo }' />"
				alt="">
		</c:forEach>

		<div class="row">
			<div class="col-lg-7"></div>
			<div class="form-inline col-lg-5">
				<ul class="pagination" id="jb-paging">
					<c:if test="${currentPageNum > '1'}">
						<li><a href="mypageForm.go?pageNum=${currentPageNum-1}"><span
								class="glyphicon glyphicon-chevron-left"></span></a></li>
					</c:if>
					<c:forEach begin="1" end="${page.pageTotalNum}" var="pageNum">
						<li><a href="mypageForm.go?pageNum=${pageNum}">${pageNum}</a></li>
					</c:forEach>
					<c:if test="${page.pageTotalNum > currentPageNum}">
						<li><a href="mypageForm.go?pageNum=${currentPageNum+1}"><span
								class="glyphicon glyphicon-chevron-right"></span></a></li>
					</c:if>
				</ul>
			</div>
		</div>
		</div>
		
	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>