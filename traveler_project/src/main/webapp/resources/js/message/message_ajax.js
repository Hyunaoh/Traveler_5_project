	
	message_total();
	
	/* 전체 이벤트 함수 */
	function message_total(){
		
		get_message_function();
		send_message_function();
		write_message_function();
		
	}
	
	function get_message_function(){
		$(document).ready(function(){
			$("#messageGet").click(function getMethod() {
	
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
							
							var result_size = Object.keys(result).length;
							var messageSend_total = $("#messageSend_total").val();
							
							$("#list_message").html(
									 "<ul><li class='active'><a href='#' id='messageGet'>받은메세지함 <input type='hidden' id='messageGet_total' value=" + result_size +" /><span>(" + result_size + ")</span></a></li>"
							        +"<li><a href='#' id='messageSend'>보낸메세지함 <input type='hidden' id='messageSend_total' value=" + messageSend_total +" /><span>(" + messageSend_total + ")</span></a></li>"
							        +"<li><a href='#' id='messageWrite'>메세지보내기</a></li>"
							        +"<li><a href='#'>쓰레기통</a></li></ul>");
	
							$("#messageView").html(
									 "<li class='unread'>"
									+"<div class='col col-1'>"
									+"<p class='title'> 보낸사람 </p></div>"
									+"<div class='col col-2'>"
									+"<div class='subject'>제목 </div>"
									+"<div class='date'>받은시간</div></div></li>");
							
									for(var i = 0; i < result_size; i++){
											
										$("#messageView").append(
												"<li class='unread'>"
												+"<div class='col col-1'><span class='dot'></span>"
												+"<div class='checkbox-wrapper'> "
												+"<input type='checkbox' id='chk" + (i+1) + "' class='chkBox'>"
												+"<label for='chk" + (i+1) + "' class='toggle'></label></div>"
												+"<p class='title'><input type='hidden' id='chk_seq" + (i+1) + "' value='"+ result[i].message_seq +"'/>" + result[i].message_send + "</p><span class='star-toggle glyphicon glyphicon-star-empty'></span></div>"
												+"<div class='col col-2'>"
												+"<div class='subject button' id='six'>" + result[i].message_message + "</div>"
												+"<div class='date'>" + result[i].message_date +"</div></div></li>"); 
										
										message_total();
										
									} // for end
									
									$(".unread").click(function() {
										
									});
									
									// 체크된 컬럼 삭제하기
									$("#deleteBtn").click(function() { 
										var j = 1;
										
										while(j <= result_size){
											
											var dataForm = {
												message_seq: $("#chk_seq"+ j).val()
											};
											
											if($("#chk"+ j).is(":checked")) {
												
												$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
													url : "messageGetDeleteAjax.go",
													method : 'POST',
													type : 'json',
													data : JSON.stringify(dataForm),
													contentType : "application/json",
													success : function(result) {
														if(result > 0){
															
															result = 0;
															
														} else {
															
														}
													},
													error : function(result, status, er) {
														$("#messageView").text(er);
													}
												});	// ajax end
												
											}	// 체크 end 
											
											j = j+1;
											
										}	// while end
										
										getMethod();
									}); 	// 해당 컬럼 삭제 괄호 닫기
									
							}, // success end
						error : function(result, status, er) {
							$("#messageView").text(er);
						} // error end
					}); // document event end
				}); // button click event end
			}); // document end
		} // end of get_message_function
	
	function send_message_function(){
		$(document).ready(function(){
		
		$("#messageSend").click(function sendMethod() {
			
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
					
					var result_size = Object.keys(result).length;
					var messageGet_total = $("#messageGet_total").val();
					
					$("#list_message").html(
							 "<ul><li><a href='#' id='messageGet'>받은메세지함 <input type='hidden' id='messageGet_total' value=" + messageGet_total +" /><span>(" + messageGet_total + ")</span></a></li>"
					        +"<li class='active'><a href='#' id='messageSend'>보낸메세지함 <input type='hidden' id='messageSend_total' value=" + result_size +" /><span>(" + result_size + ")</span></a></li>"
					        +"<li><a href='#' id='messageWrite'>메세지보내기</a></li>"
					        +"<li><a href='#'>쓰레기통</a></li></ul>");
					
					$("#messageView").html("<li class='unread'>"
							+"<div class='col col-1'>"
							+"<p class='title'> 받은사람 </p></div>"
							+"<div class='col col-2'>"
							+"<div class='subject'>제목 </div>"
							+"<div class='date'>보낸시간</div></div></li>");
					
							for(var i = 0; i < result_size; i++){
								
								$("#messageView").append(
										
										"<li class='unread'>"
										+"<div class='col col-1'><span class='dot'></span>"
										+"<div class='checkbox-wrapper'> "
										+"<input type='checkbox' id='chk" + (i+1) + "'>"
										+"<label for='chk" + (i+1) + "' class='toggle'></label></div>"
										+"<p class='title'><input type='hidden' id='chk_seq" + (i+1) + "' value='"+ result[i].message_seq +"'/>" + result[i].message_get + "</p><span class='star-toggle glyphicon glyphicon-star-empty'></span></div>"
										+"<div class='col col-2'>"
										+"<div class='subject'>" + result[i].message_message + "</div>"
										+"<div class='date'>" + result[i].message_date +"</div></div></li>"
									); 
								
								message_total();
							} // for end
					
							// 체크된 컬럼 삭제하기
							$("#deleteBtn").click(function() { 
								var j = 1;
								
								while(j <= result_size){
									
									var dataForm = {
										message_seq: $("#chk_seq"+ j).val()
									};
									
									if($("#chk"+ j).is(":checked")) {
										
										$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
											url : "messageSendDeleteAjax.go",
											method : 'POST',
											type : 'json',
											data : JSON.stringify(dataForm),
											contentType : "application/json",
											success : function(result) {
												if(result > 0){
													
													result = 0;
													
												} else {
													
												}
											},
											error : function(result, status, er) {
												$("#messageView").text(er);
											}
										});	// ajax end
										
									}	// 체크 end 
									
									j = j+1;
									
								}	// while end
								
								sendMethod();
							}); 	// 해당 컬럼 삭제 괄호 닫기		
							
				}, // success end
				error : function(result, status, er) {
					$("#messageView").text(er);
					}
				});
			}); // send end
		}); // document end
	} // end of send_message_function
	
	function write_message_function(){
		$(document).ready(function(){
			/* 메세지 보내기  폼*/
			$("#messageWrite").click(function() {
				
				var messageGet_total = $("#messageGet_total").val();
				var messageSend_total = $("#messageSend_total").val();
				var user_name = $("#username").val();
				
				$("#list_message").html(
						 "<ul>"
						+"<li><a href='#' id='messageGet' >받은메세지함<span> (" + messageGet_total + ") <input type='hidden' id='messageGet_total' value=" + messageGet_total +"></span></a></li>"
				        +"<li><a href='#' id='messageSend'>보낸메세지함<span> (" + messageSend_total + ") <input type='hidden' id='messageSend_total' value=" + messageSend_total +"></span></a></li>"
				        +"<li class='active'><a href='#' id='messageWrite'>메세지보내기</a></li>"
				        +"<li><a href='#'>쓰레기통</a></li></ul>");
				
				$("#messageView").html(
								 "<div class='form-group'>"
								+"<div class='form-group' style='width: 300px'><label for='message_send' class='sr-only'>message_send</label>"				
								+"<input id='message_send' class='form-control' type='text' value='" + user_name + "' readonly /></div>"					
								+"<div class='form-group' style='width: 300px'><label for='message_get' class='sr-only'>message_get</label>"
								+"<input id='message_get' class='form-control' placeholder='받는 사람' type='text'></div>"
								+"<div class='form-group'><label for='message_message' class='sr-only'>Message</label>"
								+"<textarea name='message' id='message_message' cols='8' rows='8' class='form-control' placeholder='Message'></textarea></div>"
								+"<div class='form-group'>"
								+"<input class='btn btn-primary btn-lg' id='submitWriteForm' value='Send Message' type='submit'></div>");
						
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
							} else {
								$("#messageView").append("<br/><br/>쪽지 발송에 실패하였습니다. 다시 시도해주세요."); 
							}
							
						},
						error : function(result, status, er) {
							$("#messageView").text(er);
						}
					});
				}); // write button click end
				
				message_total();
				
			}); // write Form click end
		}); // document end
	} // function end
