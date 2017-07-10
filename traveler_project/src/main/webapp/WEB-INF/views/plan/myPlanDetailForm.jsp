<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행가 - 여행계획</title>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<section id="fh5co-contact" data-section="contact">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">${planVO.plan_title}</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>
								작성자 : ${planVO.plan_writer} (여행지 수 : ${planVO.plan_count})
								<br>작성일 : ${planVO.plan_regDate}
							</h3>
						</div>
					</div>
				</div>
			</div>
			<c:set value="1" var="count" />
			<c:forEach items="${planList}" var="list">
				<div class="row row-bottom-padded-md">
					<c:if test="${ count % 2 == 1 }">
						<div class="col-md-6 to-animate">
							<h3>${count} 번</h3>
							<ul class="fh5co-contact-info">
								<li class="fh5co-contact-address ">
									<img src="<c:url value='/resources/images/plan_img/${list.plan_img}' />" style="weight: 230px; height:230px;">
								</li>
							</ul>
						</div>
					</c:if>
					<div class="col-md-6 to-animate">
						<h3>내용</h3>
						<div class="form-group ">
							<label for="name">소제목</label>
							${list.plan_subTitle}
						</div>
						<div class="form-group ">
							<label for="phone">장소</label>
							${list.plan_place}
						</div>
						<div class="form-group ">
							<label for="message">기간</label>
							${list.plan_date}
						</div>
						<div class="form-group ">
							<label for="email">내용</label>
							${list.plan_content}
						</div>
					</div>
					<c:if test="${ count % 2 == 0 }">
						<div class="col-md-6 to-animate">
							<h3>${count} 번</h3>
							<ul class="fh5co-contact-info">
								<li class="fh5co-contact-address ">
									<img src="<c:url value='/resources/images/plan_img/${list.plan_img}' />" style="weight: 230px; height:230px;">
								</li>
							</ul>
						</div>
					</c:if>
					<c:set value="${count+1}" var="count" />
				</div>
				<br><hr><br><br>
			</c:forEach>
		</div>
	</section>
</body>
</html>