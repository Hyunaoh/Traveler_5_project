<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 여행 계획 세우기</title>
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
		var count = Number(1);
		var totalcount = Number(1);
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
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">여행 계획</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>
								사진과 계획 내용을 작성해서 편하게 여행하세요!
							</h3>
						</div>
					</div>
				</div>
			</div>
			<form action="myPlanInsertPro.go" method="post" enctype="multipart/form-data" id="form">
				<div class="row row-bottom-padded-md">
					<div class="col-md-6 to-animate">
						<h3>내용</h3>
						<div class="form-group ">
							<label for="name">제목</label>
							<input type="text" name="plan_title" class="form-control">
						</div>
					</div>
					<div class="col-md-6 to-animate">
						<h3>내용</h3>
						<div class="form-group ">
							<label for="name">소제목</label>
							<input type="text" name="plan_subTitle" class="form-control">
						</div>
						<div class="form-group ">
							<label for="name">장소</label>
							<input type="text" name="plan_place" class="form-control">
						</div>
						<div class="form-group ">
							<label for="phone">사진</label>
							<input type="file" name="imgFile">
						</div>
						<div class="form-group ">
							<label for="message">기간</label>
							<input type="date" name="plan_date" class="form-control">
						</div>
						<div class="form-group ">
							<label for="email">내용</label>
							<input type="text" name="plan_content" class="form-control">
						</div>
					</div>
					<div id="addInfo"></div>
					<input type="hidden" value="1" name="plan_count">
					<button type="button" id="add" class="btn btn-default btn-md" onclick="addContent()">내용추가</button>
					<input type="submit" class="btn btn-default btn-md" value="등록"/>
				</div>
			</form>
		</div>
	</section>
</body>
</html>