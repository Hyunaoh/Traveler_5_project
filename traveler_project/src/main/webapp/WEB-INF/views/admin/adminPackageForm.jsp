<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행가 - 관리자 (가이드 상품)</title>

<style type="text/css">
		.cursor-point:hover{
			cursor: pointer;
			background-color: rgba(0,0,0,0.3);
		}
		#adminPackage-home {
		  background-color: transparent;
		  background-size: cover;
		  background-attachment: fixed;
		  background-image: url(/resources/images/bg.jpg);
		  position: relative;
		  width: 100%;
		 /*  background-color: #52d3aa; */
		  color: #fff;
		  overflow: hidden;
		}
		#adminPackage-home .gradient {
	 	 position: absolute;
		  top: 0;
		  bottom: 0;
		  left: 0;
		  right: 0;
		  z-index: 2;
		  opacity: .9;
		  -webkit-backface-visibility: hidden;
		}
</style>

</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- contents -->
	<section id="fh5co-home" style="background-image: url(<c:url value='/resources/images/JIHO (1).jpg' />);">
		<div class="container">
			 <div class="text-wrap">
				<div class="text-inner"> 
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<h1 class="to-animate">상품 게시글 확인 후 승인 바랍니다.</h1>
						</div>
					</div>
				</div>
			</div>
		</div> 
		<div class="slant"></div>
	</section>
	
	<section id="fh5co-intro" style="background-image: url(<c:url value='/resources/images/img_7.jpg' />);">
		<div class="container">
			<div class="row row-bottom-padded-lg">
				<c:forEach items="${upapprovedlist}" var="list">
					<div class="fh5co-blockJIHO">
						<div class="overlay-darker"></div>
						<div class="overlay"></div>
						<div class="fh5co-text text-left" >
							<h3>${list.package_title}</h3>
							<div class="col-xs-4">
							작성자 : ${list.member_id}
							</div>
							<div class="col-xs-4">
							대상 국가 : ${list.package_place1}
							</div>
							<div class="col-xs-4 text-right">
								<p><a href="#" onclick="location='<c:url value="/package/packageDetailForm.go?package_pk=${list.package_pk}" />'" class="btn btn-primary">상세보기</a></p>
							</div>
							
							
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
						
	
</body>
</html>