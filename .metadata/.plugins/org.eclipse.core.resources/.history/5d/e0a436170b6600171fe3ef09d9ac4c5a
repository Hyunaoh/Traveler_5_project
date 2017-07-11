<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<title>쪽지함</title>
	<script type="text/javascript">
		function update(data){
			sendAjax(data);
		}
		function sendAjax(data) {
			var dateForm = {
					message_code : data
			};
			$.ajax({
				url : "messageOpenUpdateAjax.pet",
				method : 'POST',
				type : 'json',
				data : JSON.stringify(dateForm),
				contentType : "application/json",
				success : function(data) {
					
				},
				error : function(data, status, er) {
					
				}
			});
		}
	</script>
</head>
<body>
	<!-- 헤더 파일 -->
	<jsp:include page="../layout/header.jsp"/>

	<!-- 컨텐츠 -->
	<se:authentication property="name" var="username"/>
	<div class="container">
		<div class="row">
			<!-- 첫째 줄 -->
			<div class="col-lg-12 text-center">
				<h2>쪽지함</h2>
				<hr>
			</div>
		</div>
		
		<!-- 쪽지 보내기 버튼 -->
		<div class = "row">
			<div class="col-lg-12">
				<button type="button" class="btn btn-md btn-custom" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">쪽지보내기</button>
			</div>
		</div>
		
		<!-- 탭 기능 -->
		<div role="tabpanel">
			<!-- 탭 메뉴 -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active"><a href="#list" aria-controls="list" role="tab" data-toggle="tab">받은 쪽지</a></li>
				<li role="presentation"><a href="#success" aria-controls="success" role="tab" data-toggle="tab">보낸 쪽지</a></li>
			</ul>
			<!-- 탭 내용 -->
			<div class="tab-content">
				<!-- 받은쪽지 -->
				<div role="tabpanel" class="tab-pane fade in active" id="list">
					<div class="container">
						<div class="row">
							<table width="100%" class="table table-striped table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>시간</th>
										<th>제목</th>
										<th>보낸사람</th>
										<th>받는사람</th>
										<th>기타</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var ="var">
									<c:if test="${var.message_delete_reader == 'n' && username == var.message_reader}">
									<tr class = "board-custom">
										<td>${var.message_date}</td>
										<td>
										${var.message_title}
										<c:if test="${var.message_read == 'n'}">
											<kbd>new</kbd>
										</c:if>
										</td>
										<td>${var.message_writer}</td>
										<td>${var.message_reader}</td>
										<td>
										<form action = "messageDeletePro.pet" method = "post">
											<button onclick="update(${var.message_code})" type = "button" class="btn btn-md btn-custom" data-toggle="modal" data-target="#openMessage${var.message_code}">열어보기</button>
											<input type = "hidden" value="${var.message_code}" name="message_code"/>
											<input type = "hidden" value="${var.message_reader}" name="message_reader"/>
											<input class="btn btn-custom btn-md" type = "submit" value="삭제"/>
										</form>
										</td>
									</tr>
									
									<!-- 쪽지 열어보기 -->
									<div class="modal fade" id="openMessage${var.message_code}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
													<h4 class="modal-title" id="exampleModalLabel">${var.message_writer}님의 쪽지 내용</h4>
												</div>
												<form action="messageSendPro.pet" method = "post">
													<div class="modal-body">
															<div class="form-group">
																<label for="message-text" class="control-label">제목</label>
																<h3>${var.message_title}</h3>
																<label for="message-text" class="control-label">${var.message_date}</label>
																<hr>
															</div>
															<div class="form-group">
																<label for="message-text" class="control-label">내용</label>
																<h4>${var.message_body}</h4>
															</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-custom" data-dismiss="modal">닫기</button>
														<button type="button" class="btn btn-custom" data-toggle="modal" data-target="#exampleModal">답장 보내기</button>
													</div>
												</form>
											</div>
										</div>
									</div>
									<!-- 모달 끝 -->
									</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 보낸쪽지 -->
				<div role="tabpanel" class="tab-pane fade in" id="success">
					<div class="container">
						<div class="row">
							<table width="100%" class="table table-striped table-hover" id="dataTables-example">
								<thead>
									<tr>
										<th>시간</th>
										<th>제목</th>
										<th>보낸사람</th>
										<th>받는사람</th>
										<th>기타</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var ="var">
									<c:if test="${var.message_delete_writer == 'n' && username == var.message_writer}">
									<tr class = "board-custom">
										<td>${var.message_date}</td>
										<td>${var.message_title}</td>
										<td>${var.message_writer}</td>
										<td>${var.message_reader}</td>
										<td>
										<form action = "messageDeletePro.pet" method = "post">
											<input type = "hidden" value="${var.message_code}" name="message_code"/>
											<input type = "hidden" value="${var.message_writer}" name="message_writer"/>
											<input class="btn btn-custom btn-md" type = "submit" value="삭제"/>
										</form>
										</td>
									</tr>
									</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>		
				</div>
			</div>
		</div>
	</div>
	
	<!-- 쪽지 보내기 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">새로운 쪽지</h4>
				</div>
				<form action="messageSendPro.pet" method = "post">
					<div class="modal-body">
							<div class="form-group">
								<label for="recipient-name" class="control-label">받는사람</label>
								<input type="text" list="mlist" name="message_reader" class="form-control"/>
								<datalist id="mlist">
									<c:forEach items="${empDTOList}" var="list">
									<c:if test="${username != list.emp_code}">
										<option value="${list.emp_code}">이름 : ${list.emp_name} || 지점 : ${list.store_code}
										|| 직위 : 
										<c:if test="${list.emp_role == 'ROLE_SUPER_FULL' || list.emp_role == 'ROLE_FULL'}">
											정규직
										</c:if> 
										<c:if test="${list.emp_role == 'ROLE_SUPER_PART' || list.emp_role == 'ROLE_PART'}">
											비정규직
										</c:if>
										</option>
									</c:if>
									</c:forEach>					
								</datalist>
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">제목</label>
								<input type="text" class="form-control" name = "message_title" id="recipient-name">
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label">내용</label>
								<textarea class="form-control" name = "message_body"></textarea>
							</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-custom" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-custom">쪽지 보내기</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 푸터 파일 -->
	<jsp:include page="../layout/footer.jsp"/>
</body>
</html>