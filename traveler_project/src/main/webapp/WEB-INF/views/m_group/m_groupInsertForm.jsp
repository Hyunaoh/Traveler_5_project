<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 단체 상품 신청</title>
	
	<!-- Group CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/css/group/group.css" />" />
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var count = Number(0);
			$("#add").click(function(){
				if($("#select_mem").val() == '선택'){
					alert("회원 또는 비회원을 선택해주세요");
				}else if($("#select_mem").val() == '회원'){
					count = count + 1;
					$("#add_info").append(
						'<div id="select_mem' + count + '"><hr>'
						+ '<label class="label-font">회원 신원정보 ID</label>'
						+ '<input type="text" required name="group_mem_id" class="form-control" placeholder="회원은 ID를 입력해야합니다."/><br>'
						+ '<label>이름</label> <input required type="text" name="group_mem_name" class="form-control"/><br>'
						+ '<label>나이</label> <input required type="number" min="1" name="group_mem_str_age" class="form-control"/><br>'
						+ '<label>성별</label> <select required name="group_mem_gender" value="${memberVO.member_gender}" class="black-font form-control">'
						+ '<option value="man">남성</option>'
						+ '<option value="woman">여성</option>'
						+ '</select><br></div>'
					);
				}else if($("#select_mem").val() == '비회원'){
					count = count + 1;
					$("#add_info").append(
							'<div id="select_mem' + count + '"><hr>'
							+ '<label class="label-font">비회원 신원정보</label>'
							+ '<input type="hidden" name="group_mem_id" value="없음"/>'
							+ '<label>이름</label> <input required type="text" name="group_mem_name" class="form-control"/><br>'
							+ '<label>나이</label> <input required type="number" min="1" name="group_mem_str_age" class="form-control"/><br>'
							+ '<label>성별</label> <select required name="group_mem_gender" value="${memberVO.member_gender}" class="black-font form-control">'
							+ '<option value="man">남성</option>'
							+ '<option value="woman">여성</option>'
							+ '</select><br></div>'
						);
				}
				$("#count").val(count+1);
			});
			$("#sub").click(function(){
				if(count > 0){
					$("#select_mem" + count + "").remove();
					count = count - 1;
				} else{
					alert("최소 1명은 필요합니다.");
				}
				$("#count").val(count+1);
			});
		});
	</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />

	<!-- banner -->
	<div class="group-banner" style="background-image:url('<c:url value='/resources/images/group_img/group-package-banner.jpg' />');"></div>
	
	<!-- content -->
	<div class="container m_gorup-container">
	
		<!-- Header -->
		<div class="row">
			<h1 class="m_group-header">단체 패키지 신청</h1>
		</div>
	
		<!-- 내용 -->
		<form action="m_groupInsertPro.go" method="post">
			<div class="row">
				<div class="col-md-5 col-sm-10 col-xm-10">
					<!-- hidden 값 -->
					<input type="hidden" name="group_mem_package_pk" value="${m_groupVO.group_mem_package_pk}"/>
					<input type="hidden" readonly name="group_mem_id" value="${memberVO.member_id}"/>
					
					<!-- 예약자 ID -->
					<label>예약자 신원정보 ID</label>
					<input type="text" readonly name="group_mem_reserve_id" value="${memberVO.member_id}"class="black-font form-control"/><br>
					
					<!-- 이름 -->
					<label>이름</label>
					<input type="text" readonly name="group_mem_name" value="${memberVO.member_name}"class="black-font form-control"/><br>
					
					<!-- 나이 -->
					<label>나이</label>
					<input type="number" required min="1" name="group_mem_str_age" class="black-font form-control"/><br>
					
					<!-- 성별 -->
					<label>성별</label> 
					<select name="group_mem_gender" required value="${memberVO.member_gender}" class="black-font form-control">
						<option value="man">남성</option>
						<option value="woman">여성</option>
					</select>
					
					<!-- 새로운 인원 추가될 부분 -->
					<div id="add_info"></div>
					
				</div>
				<div class="col-md-2 col-sm-2 col-xm-2">
					<!-- 인원 추가 -->
					<label>회원 여부</label>
					<select id="select_mem" class="black-font">
						<option>선택</option>
						<option>비회원</option>
						<option>회원</option>	
					</select><br>
					<button type="button" class="btn-custom btn-sm" id="add">인원 추가</button>
					<button type="button" class="btn-custom btn-sm" id="sub">인원 삭제</button>
					
					<!-- 현재인원과 예약하기 -->
					<hr>
					<label>현재 인원</label>
					<input readonly min="1" value="1" type="number" id="count" name="count" class="form-control"/><br>
					<input type="submit" value="신청" class="btn-custom"/>
				</div>
				
				<!-- 안내사항 -->
				<div class="col-md-4">
					<ul class="m_group-ul">
						<li>인원을 추가 하실때는 <font color="green">회원</font> 또는 <font color="green">비회원</font>을 정해주세요.</li>
						<li><font color="green">회원</font>의 경우, ID를 입력해주셔야 합니다.</li>
						<li><font color="green">비회원</font>의 경우, ID는 입력하지 않아도 됩니다.</li>
						<li>
							정보를 올바르게 입력했는지 확인 후,<br>
							<font color="green">예약 신청 버튼</font>을 눌러주시면 감사하겠습니다.
						</li>
						<li>
							만약 <font color="green">거짓된 정보</font>를 입력했을 경우,<br>
							이로인해 발생되는 피해는 모두 <font color="green">신청자에게 책임</font>이 있음을 알려드립니다.
						</li>
					</ul>
				</div>
				
			</div>
		</form>
		
	</div>
		
    <!-- footer -->
	<jsp:include page="../footer.jsp" />
</body>
</html>