<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						'<div id="select_mem' + count + '"><hr>ID <input type="text" name="group_mem_id" class="form-control"/><br>'
						+ '이름 <input type="text" name="group_mem_name" class="form-control"/><br>'
						+ '나이 <input type="number" min="1" name="group_mem_str_age" class="form-control"/><br>'
						+ '성별 <input type="text" name="group_mem_gender" class="form-control"/><br></div>'
					);
				}else if($("#select_mem").val() == '비회원'){
					count = count + 1;
					$("#add_info").append(
							'<div id="select_mem' + count + '"><hr><input type="hidden" name="group_mem_id" value="없음"/>'
							+ '이름 <input type="text" name="group_mem_name" class="form-control"/><br>'
							+ '나이 <input type="number" min="1" name="group_mem_str_age" class="form-control"/><br>'
							+ '성별 <input type="text" name="group_mem_gender" class="form-control"/><br></div>'
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
	<form action="m_groupInsertPro.go" method="post">
		<input type="hidden" name="group_mem_package_pk" value="${m_groupVO.group_mem_package_pk}"/>
		<input type="hidden" readonly name="group_mem_id" value="${memberVO.member_id}"/>
		ID <input type="text" readonly name="group_mem_reserve_id" value="${memberVO.member_id}"class="form-control"/><br>
		이름 <input type="text" readonly name="group_mem_name" value="${memberVO.member_name}"class="form-control"/><br>
		나이 <input type="number" min="1" name="group_mem_str_age" class="form-control"/><br>
		성별 <input type="text" value="${memberVO.member_gender}" name="group_mem_gender" class="form-control"/><br>
		<div id="add_info"></div>
		<select id="select_mem">
			<option>선택</option>
			<option>비회원</option>
			<option>회원</option>	
		</select>
		<button type="button" id="add">인원 추가</button>
		<button type="button" id="sub">인원 삭제</button><br>
		현재 인원 : <input readonly min="1" value="1" type="number" id="count" name="count" />
		<input type="submit" value="신청" class="btn btn-primary btn-md"/>
	</form>
</body>
</html>