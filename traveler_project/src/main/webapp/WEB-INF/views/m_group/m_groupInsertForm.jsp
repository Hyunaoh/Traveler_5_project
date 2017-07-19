<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 단체 상품 신청</title>
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
						+ '<label class="label-font">회원 신원정보</label>'
						+ 'ID <input type="text" name="group_mem_id" class="form-control" placeholder="회원은 ID를 입력해야합니다."/><br>'
						+ '이름 <input type="text" name="group_mem_name" class="form-control"/><br>'
						+ '나이 <input type="number" min="1" name="group_mem_str_age" class="form-control"/><br>'
						+ '성별 <select name="group_mem_gender" value="${memberVO.member_gender}" class="black-font form-control">'
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
							+ '이름 <input type="text" name="group_mem_name" class="form-control"/><br>'
							+ '나이 <input type="number" min="1" name="group_mem_str_age" class="form-control"/><br>'
							+ '성별 <select name="group_mem_gender" value="${memberVO.member_gender}" class="black-font form-control">'
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
	<link rel="stylesheet" href="<c:url value="/resources/css/taehong.css" />" />
</head>
<body style="background-image: url('<c:url value="/resources/images/m_group_bg.jpg" />');">
	<!-- header -->
	<jsp:include page="../header.jsp" />

	<!-- content -->
	<section class="padding-top">
		<dvi class="container">
			<div class="row">
				<h1 class="header-font">단체 패키지 신청</h1>
			</div>
			<form action="m_groupInsertPro.go" method="post">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-5 custom-well">
						<label class="label-font">예약자 신원정보</label>
						<input type="hidden" name="group_mem_package_pk" value="${m_groupVO.group_mem_package_pk}"/>
						<input type="hidden" readonly name="group_mem_id" value="${memberVO.member_id}"/>
						ID <input type="text" readonly name="group_mem_reserve_id" value="${memberVO.member_id}"class="black-font form-control"/><br>
						이름 <input type="text" readonly name="group_mem_name" value="${memberVO.member_name}"class="black-font form-control"/><br>
						나이 <input type="number" min="1" name="group_mem_str_age" class="black-font form-control"/><br>
						성별 
						<select name="group_mem_gender" value="${memberVO.member_gender}" class="black-font form-control">
							<option value="man">남성</option>
							<option value="woman">여성</option>
						</select>
						<div id="add_info"></div>
						<select id="select_mem" class="black-font">
							<option>선택</option>
							<option>비회원</option>
							<option>회원</option>	
						</select>
						<button type="button" class="btn btn-primary btn-sm" id="add">인원 추가</button>
						<button type="button" class="btn btn-primary btn-sm" id="sub">인원 삭제</button><br>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-2">
						<div class="side-fix">
							현재 인원 : <input readonly min="1" value="1" type="number" id="count" name="count" class="black-font form-control"/>
							<hr>
							<input type="submit" value="신청" class="btn btn-primary btn-md"/>
						</div>
					</div>
					<div class="col-md-1"></div>
				</div>
			</form>
		</dvi>
	</section>
</body>
</html>