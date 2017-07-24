<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 단체상품 목록</title>

	<!-- Group CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/group/group.css" />" />
</head>
<body style="background-color: #f0f0f5">
	
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="group-banner" style="background-image:url('<c:url value='/resources/images/group_img/group-package-banner.jpg' />');"></div>
	
    <!-- Page Content -->
    <div class="container group-container">
        <!-- Page Header -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">단체 패키지 상품
                    <small> <a href="groupInsertForm.go">상품 등록</a></small>
                </h1>
            </div>
        </div>
        <!-- /.row -->

        <!-- Projects Row -->
        <c:forEach items="${groupList}" var="list">
            <div class="col-md-3 portfolio-item">
	            <div style="padding-bottom: 3px; margin: 12px 0.5px;">
				    <div onclick="location='groupDetailForm.go?group_pak_pk=${list.group_pak_pk}'">
				    	<img class="img-responsive group-list-img" style="width:600px; height:250px;" src="<c:url value="/resources/images/group_img/${list.group_pak_photo}" />" alt="">
				    	<div class="carousel-caption">
							<h3>
								<a class="group-title-font" href="groupDetailForm.go?group_pak_pk=${list.group_pak_pk}">
									${list.group_pak_title}
								</a>
							</h3>
							<span class="group-content-font">인원 : ${list.group_pak_min} / ${list.group_pak_max}</span>
				    	</div>
				    </div>
	            </div>
            </div>
        </c:forEach>
        <!-- /.row -->
    </div>
    <!-- /.container -->
    
    <!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>