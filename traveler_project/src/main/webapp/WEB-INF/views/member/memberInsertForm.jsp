<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 Form</title>
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

		$("#id_check")
				.click(
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

	<form action="memberInsertPro.go" method="post">
		<div>
			ID <input type="text" name="member_id" id="member_id"> <input
				type="button" value="중복확인" id="id_check">
			<p id="id_check_display"></p>
			<hr>
		</div>
		<div>
			비밀번호 <input type="password" name="member_pwd" id="member_pwd"><br>
			비밀번호 확인 <input type="password" id="pwd_check">
			<p id="pwd_check_display"></p>
		</div>
		<hr>
		이름 <input type="text" name="member_name">
		<hr>
		닉네임 <input type="text" name="member_nickName">
		<hr>
		성별 <input type="radio" name="member_gender" value="man">man <input
			type="radio" name="member_gender" value="woman">woman
		<hr>
		전화번호 <input type="text" name="member_tel" placeholder="'-' 없이 입력해주세요">
		<hr>
		이메일 <input type="text" name="member_email">
		<hr>
		<input type="submit" value="확인">
	</form>
</body>
</html>