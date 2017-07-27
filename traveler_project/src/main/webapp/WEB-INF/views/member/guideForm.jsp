<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<body>

	<!-- header -->
	<jsp:include page="../header.jsp" />

	<div>
		<img style="width: 100%;"
			src="<c:url value='/resources/images/guideForm.jpg' />" alt="">
		<hr>

		<img style="width: 100%"
			src="<c:url value='/resources/images/explaination.jpg' />" alt="">


		<button data-toggle="modal" data-target="#myModal" type="button"
			class="btn btn-default btn-lg" style="margin-left: 43%;">가이드 신청하기</button>
			<br>
			<br>
			<br>

		<!-- Modal -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<h3>가이드 신청</h3>
						</h4>
					</div>
					<div class="modal-body">

						<div id="form">
							<table>
								<tr>
									<td>· 아이디&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>${ list.member_id }</td>
								</tr>
								<tr>
									<td>· 이름&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>${ list.member_name }</td>
								</tr>
								<tr>
									<td>· 닉네임&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>${ list.member_nickName }</td>
								</tr>
								<tr>
									<td>· 전화번호&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>${ list.member_tel }</td>
								</tr>
								<tr>
									<td>· 이메일&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>${ list.member_email }</td>
								</tr>
								<tr>
									<td>· 주소&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>(${ list.member_post })&nbsp;&nbsp; ${ list.member_adrr}&nbsp;&nbsp;
										${ list.member_addrDetail}</td>
								</tr>
								<tr>
									<td>· 성별&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>${ list.member_gender }</td>
								</tr>
								<tr>
									<td>· 국적&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>${ list.member_nationality }</td>
								</tr>
								<tr>
									<td>· 구사언어&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>${ list.member_language }</td>
								</tr>
								<tr>
									<td>· 자격증&nbsp;&nbsp;&nbsp;&nbsp;</td>
									<td>${ list.member_certification }</td>
								</tr>


							</table>
							<br>
							<br>
							<font color="#0064FF" style="margin-left: 33%;">위의 내용과 일치하십니까?</font><br>
							

							<script>
								function msg() {
									alert("가이드 신청이 완료되었습니다");
									location.href = "/member/memberGuideUp.go";
								}
							</script>
						</div>


					</div>
					<div class="modal-footer">
						<button onclick="msg()" class="btn btn-default">신청완료</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>

			</div>
		</div>

	<hr>

	</div>
	<!-- footer -->
	<jsp:include page="../footer.jsp" />

</body>
</html>