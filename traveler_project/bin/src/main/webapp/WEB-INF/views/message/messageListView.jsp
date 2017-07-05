<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 쪽지함 view </title>

<style type="text/css">
	#message_tb {display: table; width: 100%;}
	.message_row {display: table-row;}
	.cell {display: table-cell; border-bottom: 1px solid #DDD;}
	.col1 {width: 5%;}
	.col2 {width: 5%;}
	.col3 {width: 5%;}
	.col4 {width: 55%;}
	.col5 {width: 30%;}
</style>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

	/* 쪽지함 Ajax */
	$(document).ready(function(){
	
	/* 받은 메세지함 */
	$("#messageGet").click(function() { 

				var dataForm = {
					message_get: $("#username").val()
				};
				
				$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
					url : "messageViewAjax.go",
					method : 'POST',
					type : 'json',
					data : JSON.stringify(dataForm),
					contentType : "application/json",
					success : function(result) {
						
						var arr = jQuery.makeArray( result );
						
						$("#messageView").html("<font color = 'green'>받은 메세지함</font><br/>"
								+"<div id='message_tb'><div class='message_row'><span class='cell col1'>번호 </span>"
								+"<span class='cell col2'>보낸 아이디</span> "
								+"<span class='cell col3'>받은 아이디</span>"
								+"<span class='cell col4'>메세지</span>"
								+"<span class='cell col5'>날짜</span></div>");
						
								for(var i = 0; i<=arr.length; i++){
									
									$("#messageView").append(
											+"<div class='message_row'>"
											+"<span class='cell col1'>"
											+arr[i].message_seq  
											+"</span>"
											+"<span class='cell col2'>"
											+arr[i].message_send 
											+"</span>"
											+"<span class='cell col3'>"
											+arr[i].message_get
											+"</span>"
											+"<span class='cell col4'>"
											+arr[i].message_message
											+"</span>"
											+"<span class='cell col5'>"
											+arr[i].message_date
											+"</span></div></div>"); 
								}
								
						},
					error : function(result, status, er) {
						$("#messageView").text(er);
					}
				});
			});
	
		/* 보낸메세지함 */
		$("#messageSend").click(function() { 
			
				var dataForm = {
					message_send: $("#username").val()
				};
				
				$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
					url : "messageViewAjax.go",
					method : 'POST',
					type : 'json',
					data : JSON.stringify(dataForm),
					contentType : "application/json",
					success : function(result) {
						
						var arr = jQuery.makeArray( result );
						
						$("#messageView").html("<font color = 'green'>보낸 메세지함</font><br/>"
						+"<div id='message_tb'><div class='message_row'><span class='cell col1'>번호 </span>"
						+"<span class='cell col2'>보낸 아이디</span> "
						+"<span class='cell col3'>받은 아이디</span>"
						+"<span class='cell col4'>메세지</span>"
						+"<span class='cell col5'>날짜</span></div>");
						
						for(var i = 0; i<=arr.length; i++){
							
							$("#messageView").append(
									+"<div class='message_row'>"
									+"<span class='cell col1'>"
									+arr[i].message_seq 
									+"</span>"
									+"<span class='cell col2'>"
									+arr[i].message_send 
									+"</span>"
									+"<span class='cell col3'>"
									+arr[i].message_get
									+"</span>"
									+"<span class='cell col4'>"
									+arr[i].message_message
									+"</span>"
									+"<span class='cell col5'>"
									+arr[i].message_date
									+"</span></div></div>"); 
						}
						
					},
					error : function(result, status, er) {
						$("#messageView").text(er);
					}
				});
			});
	
			/* 메세지 보내기  폼*/
			$("#messageWrite").click(function() { 
				
				$("#messageView").html(
						 "보내는 사람 : <input type='text' id='message_send' name='message_send' value='<se:authentication property='principal.username' />' readonly/>"
						+"<br/>받는 사람    : <input type='text' id='message_get' name='message_get' />"
						+"<br/>메세지 내용 : <br/><textarea rows='10' cols='40' id='message_message' name='message_message' ></textarea>"
						+"<br/><input type='button' id='submitWriteForm' value='보내기' />");
				
				/* 메세지 보내기 */
				$("#submitWriteForm").click(function() { 
					
					var dataForm = {
						message_send: $("#message_send").val(),
						message_get: $("#message_get").val(),
						message_message: $("#message_message").val()
					};
					
					$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
						url : "messageWriteAjax.go",
						method : 'POST',
						type : 'json',
						data : JSON.stringify(dataForm),
						contentType : "application/json",
						success : function(result) {
							if(result > 0){
								$("#messageView").append("<br/><br/>쪽지 발송에 성공하였습니다."); 
									if($("#message_get").val() == $("#username").val()){
										
									}
							} else {
								$("#messageView").append("<br/><br/>쪽지 발송에 실패하였습니다. 다시 시도해주세요."); 
							}
						},
						error : function(result, status, er) {
							$("#messageView").text(er);
						}
					});
				});
			});
		
			
			
		});
</script>
</head>
<body>
	<div style="margin-top: 0px">
	<jsp:include page="../header.jsp" />
	</div>
	
	<section id="fh5co-counters" style="background-image: url(<c:url value='/resources/images/full_image_1.jpg' />);" data-stellar-background-ratio="0.5">
		<div class="fh5co-overlay"></div>
	
	 	<div class="container">
     		
     			<div class="col-md-12 section-heading text-center to-animate">
     				쪽지함
				</div>
				
				<div class="fh5co-counter col-lg-8">
					<p>현재 접속자 아이디 : <se:authentication property='principal.username' /></p>
					<span class="input-group-btn" style="height:100%;">
						<input class="btn btn-default"  type="button" id="messageGet" name="messageGet" value="받은쪽지함">
						<input class="btn btn-default"  type="button" id="messageSend" name="messageSend" value="보낸쪽지함">
						<input class="btn btn-default"  type="button" id="messageWrite" name="messageWrite" value="쪽지작성화면">
					</span>
				</div>

				 <div class="fh5co-counter col-lg-10">
					<input type="hidden" id="username" name="username" value="<se:authentication property='principal.username' />" />
					<p id="messageView">상단의 메뉴를 선택해주세요.</p>
				</div>
			
		</div>
	</section>
	
</body>
</html>