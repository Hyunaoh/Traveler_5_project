
	message_total();
	
	/* 전체 이벤트 함수 */
	function message_total(){
	
		all_message_function();
		get_message_function();
		send_message_function();
		write_message_function(); 
		
	}
	
	// 새로고침 버튼 누르면 새로고침 됨.
	function refresh(){
		$(".glyphicon-refresh").click(function() {
			location.reload();    
		});
	}
	
	// 삭제 function true / false
	function delete_yes_or_no() {
		
	    var res = confirm("삭제하시겠습니까? (삭제 하여도 상대방 쪽지함에는 받은 쪽지가 그대로 남아있습니다.)");
	    return res;
	    
	}
	
	// 팝업메세지 delete function
	function deleteBtn_popup_function(seq_num, get_or_send){
		
		if(delete_yes_or_no() == false){
			return ;
		}
		
		var dataForm = {
				message_seq: seq_num
		};
		
		$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
			url : "message" + get_or_send + "DeleteAjax.go",
			method : 'POST',
			type : 'json',
			data : JSON.stringify(dataForm),
			contentType : "application/json",
			success : function(result) {
				if(result > 0){
					
					alert('삭제성공!');
					
				} else {
					
				}
			},
			error : function(result, status, er) {
				$(".message-list").text(er);
			}
		});	// ajax end
		
	}
	
	// Get or Send 메세지의 delete function
	function deleteBtn_function(result_size, get_or_send){
		// result_size : 보낸/받은 메세지함 size를 의미함
		// get_or_send : "Get" or "Send"을 이용하여 controller 로 보냄
		// 체크된 컬럼 삭제하기
					
			var j = 1;
			
			while(j <= result_size){
				
				var dataForm = {
					message_seq: $("#chk_seq"+ j).val()
				};

				if($("#chk"+ j).is(":checked")) {
					
					$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
						url : "message" + get_or_send + "DeleteAjax.go",
						method : 'POST',
						type : 'json',
						data : JSON.stringify(dataForm),
						contentType : "application/json",
						success : function(result) {
							if(result > 0){
								
								alert('삭제성공!');
								
							} else {
								
							}
						},
						error : function(result, status, er) {
							$(".message-list").text(er);
						}
					});	// ajax end
					
				}	// 체크 end 
				
				j = j+1;
				
			}	// while end

		}
	
	// 아이콘과 전체 메세지 크기를 화면에 출력하는 함수
	function show_icon_and_size(printMsg, result_size){
		
		var deleteBtn_yes_or_no = "";
		
		if(printMsg != "전체"){			
			deleteBtn_yes_or_no = "<li><a id='deleteBtn' class='icon circle-icon red glyphicon   glyphicon-remove'></a></li>";
		} 
		
		$("#icon_and_size").html(
				 "<li><a class='icon circle-icon glyphicon   glyphicon-refresh'></a></li>" 
				+ deleteBtn_yes_or_no
				+"<h4>"+ printMsg + " 메시지 개수 : " + result_size + "</h4>");
	}
	
	// 메세지 리스트 출력하기
	function message_list_function(result, result_size, who){
		
		if(result_size == 0){
			var title = (who == 0) ? "받은 메세지 " : "보낸 메세지 ";
			$(".message-list").append("<li align='center'>" + title + " 내용이 없습니다.</li>");
		}
		
		for(var i = 0; i < result_size; i++){
		
			var read = (result[i].message_read == "0") ? "unread" : "read";
			var message_who = (who == "0") ? result[i].message_send : result[i].message_get;
			var dot = (who == "0" && read == "unread") ? "green-dot" : 
					  (who == "1" && read == "unread") ? "blue-dot"  : "";
			
		
			$(".message-list").append(
					  "<li class='"+ dot + " " + read + " msg-list' onclick='messagePopup(" + result[i].message_seq + ")'>"
					+ "<div class='col col-1'><span class='dot'></span>"
					+ "<div class='checkbox-wrapper'> "
					+ "<input type='checkbox' id='chk" + (i+1) + "' class='chkBox'>"
					+ "<label for='chk" + (i+1) + "' class='toggle' style='margin-bottom: 0px'></label></div>"
					+ "<p class='title'>" 
					+ "<input type='hidden' name='message_seq' id='chk_seq" + (i+1) + "' value='"+ result[i].message_seq +"'/>" 
					+ message_who
					+ "</p>" 
					+ "<span class='star-toggle glyphicon glyphicon-star-empty'></span></div>"
					+ "<div class='col col-2' >"
					+ "<div class='subject'>" + result[i].message_message + "</div>"
					+ "<div class='date'>" + result[i].message_date +"</div></div></li>"); 
			
		}
	}
	
	// 전체 메세지함

	function all_message_function(){
		
		$(document).ready(function(){
	
					var dataForm = {
						 message_get: $("#username").val(),
						 message_send: $("#username").val()
					};
					
					$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
						url : "selectAllMessageById.go",
						method : 'POST',
						type : 'json',
						data : JSON.stringify(dataForm),
						contentType : "application/json",
						success : function(result) {
							
							var result_size = Object.keys(result).length;
							var messageGet_total = $("#messageGet_total").val();
							var messageSend_total = $("#messageSend_total").val();
							
							show_icon_and_size("전체", result_size);
							
							refresh();
														
							$("#list_message").html(
									 "<ul>" 
									 +"<li><a href='#' id='messageGet'>받은메세지함 <input type='hidden' id='messageGet_total' value=" + messageGet_total +" /><span>(" + messageGet_total + ")</span></a></li>"
									 +"<li><a href='#' id='messageSend'>보낸메세지함 <input type='hidden' id='messageSend_total' value=" + messageSend_total +" /><span>(" + messageSend_total + ")</span></a></li>"
									 +"<li><a href='#' id='messageWrite'>쪽지보내기</a></li>" 
							        +"</ul>");
							
							get_message_function();
							send_message_function();
							write_message_function();	
	
							$(".message-list").html(
									 "<li class='unread'>"
									+"<div class='col col-1'>"
									+"<p class='title'> 보낸사람&nbsp;&nbsp;&nbsp;받은사람 </p></div>"
									+"<div class='col col-2'>"
									+"<div class='subject'>제목 </div>"
									+"<div class='date'>받은시간</div></div></li>");
							
							var username = $("#username").val();
							
							for(var i = 0; i < result_size; i++){
								
								var send_msg = result[i].message_send;
								var get_msg = result[i].message_get;
								
								var read = (result[i].message_read == "0") ? "unread" : "read";
								
								var dot = (send_msg == get_msg && read == "unread") ? "orange-dot"   : 
									  	  (send_msg == username && read == "unread") ? "blue-dot"  : 
									  	  (get_msg == username && read == "unread") ? "green-dot" : "";
									
								$(".message-list").append(
										 "<li class='" + dot + " " + read + " msg-list' onclick='messagePopup(" + result[i].message_seq + ")'>"
										+"<div class='col col-1'><span class='dot'></span>"
										+"<p class='title'>"
										+"<input type='hidden' class='message_seq' id='chk_seq" + (i+1) + "' value='"+ result[i].message_seq +"'/>" 
										+ send_msg + "&nbsp;&nbsp;&nbsp;" + get_msg + "</p>"
										+"<span class='star-toggle glyphicon glyphicon-star-empty'></span></div>"
										+"<div class='col col-2'>"
										+"<div class='subject'>" + result[i].message_message + "</div>"
										+"<div class='date'>" + result[i].message_date +"</div></div></li>"); 
								
							} // for end
							
							// 클릭하면 팝업창이 뜸 (해당 메세지의 내용 + 보낸이 혹은 받은이)
							click_popup();
									
								}, // success end
								
						error : function(result, status, er) {
							$(".message-list").text(er);
						} // error end
					}); // document event end
					
			}); // document end
		} // end of get_message_function
	
	// 받은 메세지함
	
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
							
							show_icon_and_size("받은", result_size);
							refresh();
							
							$("#list_message").html(
									 "<ul><li class='active'><a href='#' id='messageGet'>받은메세지함 <input type='hidden' id='messageGet_total' value=" + result_size +" /><span>(" + result_size + ")</span></a></li>"
							        +"<li><a href='#' id='messageSend'>보낸메세지함 <input type='hidden' id='messageSend_total' value=" + messageSend_total +" /><span>(" + messageSend_total + ")</span></a></li>"
							        +"<li><a href='#' id='messageWrite'>쪽지보내기</a></li></ul>");
							
							send_message_function();
							write_message_function();
	
							$(".message-list").html(
									 "<li class='unread'>"
									+"<div class='col col-1'>"
									+"<p class='title'> 보낸사람 </p></div>"
									+"<div class='col col-2'>"
									+"<div class='subject'>제목 </div>"
									+"<div class='date'>받은시간</div></div></li>");
							
							var temp = 0;
							
							message_list_function(result, result_size, 0);
						
							// 클릭하면 팝업창이 뜸 (해당 메세지의 내용 + 보낸이 혹은 받은이)
							click_popup(); 

								// 체크된 컬럼 삭제하기
								$("#deleteBtn").click(function() {
									
									if(delete_yes_or_no()){										
										deleteBtn_function(result_size, "Get");
									} 
										
								}); 	// 해당 컬럼 삭제 괄호 닫기
								
							}, // success end
								
						error : function(result, status, er) {
							$(".message-list").text(er);
						} // error end
					}); // document event end
					
				}); // button click event end
			}); // document end
		} // end of get_message_function
	
	// 보낸 메세지함
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
					
					show_icon_and_size("보낸", result_size);
					refresh();
					
					$("#list_message").html(
							 "<ul><li><a href='#' id='messageGet'>받은메세지함 <input type='hidden' id='messageGet_total' value=" + messageGet_total +" /><span>(" + messageGet_total + ")</span></a></li>"
					        +"<li class='active'><a href='#' id='messageSend'>보낸메세지함 <input type='hidden' id='messageSend_total' value=" + result_size +" /><span>(" + result_size + ")</span></a></li>"
					        +"<li><a href='#' id='messageWrite'>쪽지보내기</a></li></ul>");
					
					get_message_function();
					write_message_function();
					
					$(".message-list").html(
							 "<li class='unread'>"
							+"<div class='col col-1'>"
							+"<p class='title'> 받은사람 </p></div>"
							+"<div class='col col-2'>"
							+"<div class='subject'>제목 </div>"
							+"<div class='date'>보낸시간</div></div></li>");
							
							message_list_function(result, result_size, 1);
							// 메세지 보는 창이 뜸
							click_popup();
								
							// 체크된 컬럼 삭제하기
							$("#deleteBtn").click(function() { 
								
								if(delete_yes_or_no()){									
									deleteBtn_function(result_size, "Send");
								}
								
							}); 	// 해당 컬럼 삭제 괄호 닫기		
							
				}, // success end
				error : function(result, status, er) {
					$(".message-list").text(er);
					}
				});
			}); // send end
		}); // document end
	} // end of send_message_function
	
	// 메세지 작성 ajax
	function write_message_function(){
		$(document).ready(function(){
			/* 메세지 보내기  폼*/
			$("#messageWrite").click(function writeForm() {
				
				var messageGet_total = $("#messageGet_total").val();
				var messageSend_total = $("#messageSend_total").val();
				var user_name = $("#username").val();
				
				$("#icon_and_size").html(
						 "<li><a class='icon circle-icon glyphicon   glyphicon-refresh'></a></li>" 
						+ "<span><h4>쪽지보내기</h4></span>");
				
				
				$("#list_message").html(
						 "<ul>"
						+"<li><a href='#' id='messageGet' >받은메세지함<span> (" + messageGet_total + ") <input type='hidden' id='messageGet_total' value=" + messageGet_total +"></span></a></li>"
				        +"<li><a href='#' id='messageSend'>보낸메세지함<span> (" + messageSend_total + ") <input type='hidden' id='messageSend_total' value=" + messageSend_total +"></span></a></li>"
				        +"<li class='active'><a href='#' id='messageWrite'>쪽지보내기</a></li></ul>");
				
				get_message_function();
				send_message_function();
				
				$(".message-list").html(
						 "<div class='form-group'>"
						+"<div class='form-group' style='width: 300px'><label for='message_send' class='sr-only' >message_send</label>"				
						+"<input id='message_send' class='form-control' type='text' value='" + user_name + "' readonly /></div>"					
						+"<div class='form-group' style='width: 300px'><label for='message_get' class='sr-only'>message_get</label>"
						+"<select id='message_get' class='form-control'></select></div>"
						+"<div class='form-group' ><label for='message_message' class='sr-only'>Message</label>"
						+"<textarea name='message' id='message_message' cols='8' rows='8' class='form-control' placeholder='Message' ></textarea></div>"
						+"<div class='form-group'>"
						+"<input class='btn btn-primary btn-lg' id='submitWriteForm' value='Send Message' type='submit'></div>");
				
				$(".glyphicon-refresh").click(function() {
					$("#message_message").val("");
					$("#message_get").val("");					
				});
				
				// 사람찾기 ajax
					
				$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
					url : "messageWriteView.go",
					method : 'POST',
					type : 'json',
					contentType : "application/json",
					success : function(result) {
						
					var result_size = Object.keys(result).length;
					
						if(result_size > 0){
							
							$("#message_get").append("<option value=''> 받을 ID를 선택하세요 </option>");
							
							for(var i = 0; i < result_size; i++){
								$("#message_get").append("<option value='" + result[i].member_id + "'>" + result[i].member_id + " / " + result[i].member_name + "</option>");
							}
							
						} else {
							$("#message_get").html("<p>회원정보가 없습니다.</p>");
						}
							
					},
					error : function(result, status, er) {
						$(".message-list").text(er);
					}
				});
				
				/* 메세지 보내기 */
				$("#submitWriteForm").click(function() {
					
					var dataForm = {
						message_send: $("#message_send").val(),
						message_get: $("#message_get").val(),
						message_message: $("#message_message").val(),
					};
					
					if(	$("#message_get").val() == '' 	||
						$("#message_get").val() == null ||
						$("#message_get").val() == ' ')
						{
							alert('받는 사람 id를 선택해주세요.');
							return false;
						}
					
					if(	$("#message_message").val() == '' 	||
						$("#message_message").val() == null ||
						$("#message_message").val() == ' ')
						{
							alert('내용을 입력해주세요.');
							return false;
						}
					
					$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
						url : "messageWriteAjax.go",
						method : 'POST',
						type : 'json',
						data : JSON.stringify(dataForm),
						contentType : "application/json",
						success : function(result) {
							if(result > 0){
								alert('쪽지 발송에 성공하였습니다.');
							} else {
								alert('쪽지 발송에 실패하였습니다. 다시 시도해주세요.');
							}
							
						},
						error : function(result, status, er) {
							$(".message-list").text(er);
						}
					});
				}); // write button click end
				
				$("#message_get").html("");
				
			}); // write Form click end
		}); // document end
	} // function end
	
	
	// 보낸/받은 메세지 클릭했을 때 팝업창에 내용넣기
	function messagePopup(seq){

		var dataForm = {
				message_seq: seq
		};
		
		$.ajax({ // Ajax 요청을 작성하고 GET 방식으로 전송함.
			url : "messagePopupView.go",
			method : 'POST',
			type : 'json',
			data : JSON.stringify(dataForm),
			contentType : "application/json",
			success : function(result) {
				
				var username = $("#username").val();
				var result_size = Object.keys(result).length;
								
				if(result[0].message_get == username){
					
					// 받은 메세지함
					$(".message-container").html(
							"<li class='sent'>" 
							+"<input type='hidden' id='seq_num' value=" + result[0].message_seq + ">"
							+"<div class='details'>"
							+"<div class='left'>"
							+result[0].message_send
							+"<div class='arrow green'></div>You"
							+"</div>"
							+"<div class='right'>"
							+result[0].message_date
							+"</div></div>"
							+"</div>"
							+"<div class='message'><p>" + result[0].message_message  +"</p></div>"
							+"<div class='tool-box'>" 
							+"<a id='selectDeleteBtn' class='circle-icon small red-hover glyphicon glyphicon-remove'></a></div>"
							+"</li>");
					
					$("#selectDeleteBtn").click(function(){
						deleteBtn_popup_function(result[0].message_seq, "Get");
					});
					
				} else {
					
					// 보낸 메세지함
					$(".message-container").html(
							"<li class='received'>"
							+"<input type='hidden' id='seq_num' value=" + result[0].message_seq + ">"
							+"<div class='details'>"
							+"<div class='left'>You"
							+"<div class='arrow blue'></div>"
							+result[0].message_get
							+"</div>"
							+"<div class='right'>"
							+result[0].message_date
							+"</div></div>"
							+"</div>"
							+"<div class='message'><p>" + result[0].message_message  +"</p></div>"
							+"<div class='tool-box'>" 
							+"<a id='selectDeleteBtn' class='circle-icon small red-hover glyphicon glyphicon-remove'></a></div>"
							+"</li>");
					
					$("#selectDeleteBtn").click(function(){
						deleteBtn_popup_function(result[0].message_seq, "Send");
					});
					
				}
				
			},
			error : function(result, status, er) {
				$("#message").text(er);
			}
		});
	}
		
	