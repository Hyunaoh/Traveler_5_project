<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>여행가 - 구글 로그인</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			mostViewAjax();
		})
		function mostViewAjax(){
			var dataForm = {
					code: $("[name=code]").val(),
					client_id: $("[name=client_id]").val(),
					client_secret: $("[name=client_secret]").val(),
					redirect_uri: $("[name=redirect_uri]").val(),
					grant_type: $("[name=grant_type]").val()
			};
			$.ajax({
				url : "https://www.googleapis.com/oauth2/v4/token",
				method : 'POST',
				data : dataForm,
				contentType : "application/x-www-form-urlencoded",
				success : function(data) {
					alert(JSON.stringify(data));
					alert(JSON.stringify(data).email)
				},
				error : function(result, status, er) {
					alert("error"+result+status+er);
				}
			});
		}
	</script>
</head>
<body>
	<input type = "hidden" name="code" value="${googleVO.code}">
	<input type ="hidden" name="client_id" value="${googleVO.client_id}"/>
	<input type ="hidden" name="client_secret" value="${googleVO.client_secret}"/>
	<input type ="hidden" name="redirect_uri" value="${googleVO.redirect_uri}"/>
	<input type ="hidden" name="grant_type" value="${googleVO.grant_type}"/>
	
</body>
</html>