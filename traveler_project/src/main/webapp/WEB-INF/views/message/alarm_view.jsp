<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>알람 View</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function exit(){
		 window.close();
		 self.close();
	}
	
	function goMessage(){
		exit();
		window.opener.location.href="/message/messageListView.go";
	}

</script>
</head>
<body>
	<div class="modal-body">${ msg }</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal" onclick="return goMessage()">쪽지함 이동</button>
		<button type="button" class="btn btn-default" data-dismiss="modal" onclick="return exit()">창닫기</button>
	</div>

</body>
</html>
