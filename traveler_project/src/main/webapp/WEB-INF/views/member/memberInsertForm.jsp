<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 Form</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var idCheck;
		window.setInterval(function() {
			if ($("#member_pwd").val() != '' && $("#pwd_check").val() != '') {
				if ($("#member_pwd").val() == $("#pwd_check").val()) {
					$("#pwd_check_display").html(
							"<font color = 'blue'>사용가능합니다</font>");
				} else if ($("#member_pwd").val() != $("#pwd_check").val()) {
					$("#pwd_check_display").html(
							"<font color = 'red'>비밀번호가 일치하지 않습니다</font>");
				}

			} else {
				$("#pwd_check_display").text("");
			}
		}, 100);

		$("#id_check").click(
		function() {
			var dataForm = {
				member_id : $("#member_id").val()
			};
			$
					.ajax({
						url : 'idConfirmAjax.go',
						method : 'post',
						type : 'json',
						data : JSON.stringify(dataForm),
						contentType : "application/json",
						success : function(result) {
							if (result == true
									&& $("#member_id").val() != "") {
								$("#id_check_display")
										.html(
												"<font color = 'blue'>사용가능합니다</font>");
								idCheck = true;
							} else {
								$("#id_check_display")
										.html(
												"<font color = 'red'>사용 불가능합니다.</font>");
								idCheck = false;
							}
						},
						error : function(result, status, er) {
							$("#id_check_display").text(er);
						}
					});
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>
				회원가입 <small>폼</small>
			</h1>
		</div>
		<div class="col-md-6 col-md-offset-3">
			<form action="memberInsertPro.go" method="post" role="form">
				<div class="form-group">
					<label for="id">ID</label>
					<div class="input-group">
						<c:if test="${googleVO.email eq null}">
							<input type="text" class="form-control" name="member_id" id="member_id">
							<span class="input-group-btn">
								<button class="btn btn-success" id="id_check" type="button">
									중복확인<i class="fa fa-edit spaceLeft"></i>
								</button>
							</span>
						</c:if>
						<c:if test="${googleVO.email ne null }">
							<input type="text" class="form-control" name="member_id" id="member_id" value="${googleVO.email}" readonly>
							<span class="input-group-btn">
								<button class="btn btn-success" type="button" disabled="disabled">
									확인완료<i class="fa fa-edit spaceLeft"></i>
								</button>
							</span>
						</c:if>
					</div>
					<p id="id_check_display"></p>
				</div>
	
				<div class="form-group">
					<label for="pwd">비밀번호</label>
					<input type="password" name="member_pwd" id="member_pwd" class="form-control" required><br>
					<label for="pwd_confirm">비밀번호 확인</label>
					<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
					<input type="password" id="pwd_check" class="form-control" required>
					<p id="pwd_check_display"></p>
				</div>
				<div class="form-group">
					<label for="name">이름</label>
					<c:if test="${googleVO.name eq null }">
						<input type="text" name="member_name" class="form-control" required>
					</c:if>
					<c:if test="${googleVO.name ne null }">
						<input type="text" name="member_name" class="form-control" value="${googleVO.name}" readonly required>
					</c:if>
				</div>
				<div class="form-group">
					<label for="nickname">닉네임</label> <input type="text" name="member_nickName" class="form-control" required>
				</div>
				<div class="form-group">
					<label for="gender">성별</label> <br>
					<c:if test="${googleVO.gender eq null }">
						<input type="radio" name="member_gender" value="man" required> man 
						<input type="radio" name="member_gender" value="woman" required> woman
					</c:if>
					<c:if test="${googleVO.gender ne null }">
						<c:if test="${googleVO.gender eq 'male' }">
							<input type="hidden" name="member_gender" value="man" readonly> man
						</c:if>
						<c:if test="${googleVO.gender eq 'female' }">
							<input type="hidden" name="member_gender" value="woman" readonly>
							woman
						</c:if>
					</c:if>
				</div>
				<div class="form-group">
					<label for="tel">전화번호</label> <input type="tel" name="member_tel" class="form-control" placeholder="'-' 없이 입력해주세요" required>
				</div>
				<div class="form-group">
					<label for="tel">이메일</label>
					<input type="email" name="member_email" value="${googleVO.email}" class="form-control" required>
					<br>
					<c:if test="${googleVO.email ne null }">
						<font color="green">원하시면 이메일을 바꾸실 수 있습니다.</font>
					</c:if>
				</div>
				<div class="form-group text-center">
					<button type="reset" class="btn btn-warning">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
					<button type="submit" class="btn btn-info" id="btn_join">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>