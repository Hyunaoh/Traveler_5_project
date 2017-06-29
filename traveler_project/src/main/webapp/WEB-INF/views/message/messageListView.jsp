<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	/* 쪽지함 Ajax */
	$(document).ready(function(){
		
	$("#messageGet").click(function() { 
				alert('버튼클릭');
				var dataForm = {
					message_get: $("#username").val()
				};
				
				$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
					url : "messageGetViewAjax.go",
					method : 'POST',
					type : 'json',
					data : JSON.stringify(dataForm),
					contentType : "application/json",
					success : function(result) {
						if (result == true) {
							$(".messageView").html(
									"<font color = 'green'>받은메세지함</font><br/>"
									+"보낸 메세지  &nbsp;&nbsp;&nbsp;받은 메세지 &nbsp;&nbsp;메세지 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;날짜"
									+"<br/>"
									+ mList.message_send
									+ mList.message_get
									+"<br/>");
							check = true;
						} else {
							$(".messageView").html(
									"<font color = 'red'>받은메세지함 로딩실패</font>");
							check = false;
						}
					},
					error : function(result, status, er) {
						$(".messageView").text(er);
					}
				});
			});
		});
</script>
</head>
<body>
	
	<div style="margin-top : 20px" >
		<input type="button" id="messageGet" name="messageGet" value="받은쪽지함">
		<input type="button" id="messageSend" name="messageSend" value="보낸쪽지함">
		<input type="button" id="messageWrite" name="messageWrite" value="쪽지작성화면">
		<p>
		현재 접속자 아이디 : <se:authentication property='principal.username' />
		</p>
		<input type="hidden" id="username" name="username" value="<se:authentication property='principal.username' />" />
		<div class="messageView">[ 쪽지함 뷰 ]</div>
	</div>
	
</body>
</html>