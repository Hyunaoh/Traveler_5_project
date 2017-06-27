<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function insertRes(){
		
		var insert_res = document.getElementByName('insert_res').value;
		
		if( insert_res != null && insert_res != 0){
			alert('등록이 완료되었습니다.');
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>messageWrite</title>
</head>
<body>
	<form action="messageWritePro.go" method="get">
	
		보내는 사람 :  
		<input type="text" name="message_send" />
		받는 사람 :  
		<input type="text" name="message_get" />
		메세지 내용 :
		<textarea rows="10" cols="10" name="message_message">
		</textarea>
		
		<input type="submit" value="보내기" />
		<input type="hidden" name="insert_res" value="${insert_res}"/>
		
	</form>
</body>
</html>