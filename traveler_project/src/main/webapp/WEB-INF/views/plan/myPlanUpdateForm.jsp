<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 여행 계획 수정</title>
	
	<!-- Plan CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/plan/plan.css" />" />
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
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
		
		$(function(){
			$("[name=plan_title]").hide();
			$("#plan_title_btn").click(function(){
				$("[name=plan_title]").toggle();
			});
		})
	</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	
	<!-- banner -->
	<div class="plan-banner" style="background-image:url('<c:url value='/resources/images/plan_img/plan_list_banner.jpg' />');"></div>
	
	<!-- content -->
	<form action="myPlanUpdatePro.go" method="post" enctype="multipart/form-data">
		<div class="container plan-container">
			
			<!-- 헤더 부분 -->
			<div class="row">
				<!-- 제목 -->
				<div class="col-md-12 ">
					<button class="btn-custom" type="button" id="plan_title_btn">제목 수정</button>
				</div>
				
				<br><br>
				<div class="col-md-12 ">
					<input type="text" value="${planVO.plan_title}" name="plan_title" class="form-control" placeholder="제목을 써주세요!"/>
				</div>
				
				<!-- 작성자 및 작성일(수정불가) -->
				<div class="row">
					<div class="col-md-8">
						<br>
						<label>
							${planVO.plan_writer} - ${planVO.plan_regDate}
						</label>
					</div>
				</div>
			</div>
			<hr>
			
			<!-- 수정 폼 -->
			<c:set value="1" var="count" />
			<c:forEach items="${planList}" var="list">
				<c:if test="${ count % 2 == 1 }">
					<div class="row row-bottom-padded-md">
						<div id="deleteContent${count}">
							<div class="col-md-6 to-animate">
								<h3>${count} 번 <span class='pointer' onclick='deleteInfo(${count})'> 삭제 </span></h3>
								<img src="<c:url value='/resources/images/plan_img/${list.plan_img}' />" style="height:230px;">
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
								<input type="hidden" value="${list.plan_img}" name="plan_img" class="form-control"/>
							</div>
						</div>
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
					<br><hr><br>
					</div>
				</c:if>
				<c:set value="${count+1}" var="count" />
			</c:forEach>
			<div id="addInfo"></div><input type="hidden" value="${planVO.plan_count}" name="plan_count"/>
			<input type="hidden" value="${planVO.plan_pk}" name="plan_pk"/>
			
			<!-- 버튼 -->
			<div class="row">
				<div class="col-md-12">
					<input type="submit" value="계획 수정" class="btn-custom"/>
					<button type="button" id="add" class="btn-custom" onclick="addContent()">내용추가</button>
				</div>
			</div>
		</div>
	</form>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>