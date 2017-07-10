<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 여행 계획 수정</title>
	<style type="text/css">
		.pointer{
			color: skyblue;
			font-style: italic;
		}
		.pointer:hover{
			cursor: pointer;
			color: rgba(0,0,0,0.5);
		}
	</style>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		var count;
		var totalcount;
		$(function(){
			totalcount = Number($("[name=plan_count]").val());
		})
		function addContent(){
			count = Number($("[name=plan_count]").val());
			totalcount = totalcount + 1;
			$("#addInfo").append(
				"<div id='deleteContent" + totalcount + "'><div class='col-md-6'>"
					+ "<h3>내용 <span class='pointer' onclick='deleteInfo(" + totalcount + ")'> 삭제 </span></h3>"
					+ "<div class='form-group'>"
						+ "<label>소제목</label>"
						+ "<input type='text' name='plan_subTitle' class='form-control'>"
					+ "</div>"
					+ "<div class='form-group'>"
						+ "<label>장소</label>"
						+ "<input type='text' name='plan_place' class='form-control'>"
					+ "</div>"
					+ "<div class='form-group'>"
						+ "<label>사진</label>"
						+ "<input type='file' name='imgFile'>"
					+ "</div>"
					+ "<div class='form-group'>"
						+ "<label>기간</label>"
						+ "<input type='date' name='plan_date' class='form-control'>"
					+ "</div>"
					+ "<div class='form-group'>"
						+ "<label for='email'>내용</label>"
						+ "<input type='text' name='plan_content' class='form-control'>"
					+ "</div>"
				+ "</div></div>");
			$("[name=plan_count]").val(count + 1);
		};
	
		function deleteInfo(data){
			$("[name=plan_count]").val($("[name=plan_count]").val() - 1);
			$("#deleteContent"+data+"").html("");
		}
	</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- content -->
	<section id="fh5co-contact" data-section="contact">
		<form action="myPlanUpdatePro.go" method="post" enctype="multipart/form-data">
			<div class="container">
				<div class="row">
					<div class="col-md-12 section-heading text-center">
						<h2 class="to-animate">
							<input type="text" value="${planVO.plan_title}" name="plan_title" class="form-control" placeholder="제목을 써주세요!"/>
							</h2>
						<div class="row">
							<div class="col-md-8 col-md-offset-2 subtext to-animate">
								<h3>
									작성자 : ${planVO.plan_writer}
									<br>작성일 : ${planVO.plan_regDate}
								</h3>
							</div>
						</div>
					</div>
				</div>
				<c:set value="1" var="count" />
				<c:forEach items="${planList}" var="list">
					<c:if test="${ count % 2 == 1 }">
						<div class="row row-bottom-padded-md">
							<div id="deleteContent${count}">
								<div class="col-md-6 to-animate">
									<h3>${count} 번 <span class='pointer' onclick='deleteInfo(${count})'> 삭제 </span></h3>
									<ul class="fh5co-contact-info">
										<li class="fh5co-contact-address ">
											<img src="<c:url value='/resources/images/plan_img/${list.plan_img}' />" style="weight: 230px; height:230px;">
										</li>
									</ul>
								</div>
								<div class="col-md-6 to-animate">
									<h3>내용</h3>
									<div class="form-group ">
										<label for="name">소제목</label>
										<input type="text" value="${list.plan_subTitle}" name="plan_subTitle" class="form-control"/>
									</div>
									<div class="form-group ">
										<label for="phone">장소</label>
										<input type="text" value="${list.plan_place}" name="plan_place" class="form-control"/>
									</div>
									<div class="form-group ">
										<label for="message">기간</label>
										<input type="date" value="${list.plan_date}" name="plan_date" class="form-control"/>
									</div>
									<div class="form-group ">
										<label for="email">내용</label>
										<input type="text" value="${list.plan_content}" name="plan_content" class="form-control"/>
									</div>
										<input type="text" value="${list.plan_img}" name="plan_img" class="form-control"/>
								</div>
							</div>
						<br><hr><br><br>
						</div>
					</c:if>
					<c:if test="${ count % 2 == 0 }">
						<div class="row row-bottom-padded-md">
							<div id="deleteContent${count}">
								<div class="col-md-6 to-animate">
									<h3>내용</h3>
									<div class="form-group ">
										<label for="name">소제목</label>
										<input type="text" value="${list.plan_subTitle}" name="plan_subTitle" class="form-control"/>
									</div>
									<div class="form-group ">
										<label for="phone">장소</label>
										<input type="text" value="${list.plan_place}" name="plan_place" class="form-control"/>
									</div>
									<div class="form-group ">
										<label for="message">기간</label>
										<input type="date" value="${list.plan_date}" name="plan_date" class="form-control"/>
									</div>
									<div class="form-group ">
										<label for="email">내용</label>
										<input type="text" value="${list.plan_content}" name="plan_content" class="form-control"/>
									</div>
										<input type="hidden" value="${list.plan_img}" name="plan_img" class="form-control"/>
								</div>
								<div class="col-md-6 to-animate">
									<h3>${count} 번 <span class='pointer' onclick='deleteInfo(${count})'> 삭제 </span></h3>
									<ul class="fh5co-contact-info">
										<li class="fh5co-contact-address ">
											<img src="<c:url value='/resources/images/plan_img/${list.plan_img}' />" style="weight: 230px; height:230px;">
										</li>
									</ul>
								</div>
							</div>
						<br><hr><br><br>
						</div>
					</c:if>
					<c:set value="${count+1}" var="count" />
				</c:forEach>
				<div id="addInfo"></div><input type="hidden" value="${planVO.plan_count}" name="plan_count"/>
				<input type="hidden" value="${planVO.plan_pk}" name="plan_pk"/>
				<button type="button" id="add" class="btn btn-default btn-md" onclick="addContent()">내용추가</button>
				<input type="submit" value="수정" class="btn btn-default btn-md"/>
			</form>
		</div>
	</section>
</body>
</html>