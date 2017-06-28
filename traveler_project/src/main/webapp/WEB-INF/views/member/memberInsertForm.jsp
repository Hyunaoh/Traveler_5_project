<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입 Form</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
$(function(){
	var idCheck;
	$("#id_check").click(function(){
		alert(1);
		var dataForm = {
			member_id: $("#member_id").val()
		};
		alert(2);
		$.ajax({
			url: 'idConfirmAjax.go',
			method : 'get',
			type: 'json',
			data :  JSON.stringify(dataForm), 
			contentType: "application/json",
			success : function(result) {
				alert(result);
			},
			error : function(result, status, er) {
				alert(result+"/"+status+"/"+er);
			}
		});
		alert(3);
	});
});
	
</script>
</head>
<body>

	<form action="memberInsertPro.go" method="post">
	<div>
	ID
	<input type="text" name="member_id" id="member_id">
	<input type="button" value="중복확인" id="id_check">
	<p id = "id_check_display"></p><hr>
	</div>
	비밀번호
	<input type="text" name="member_pwd"><hr>
	이름
	<input type="text" name="member_name"><hr>
	닉네임
	<input type="text" name="member_nickName"><hr>
	성별
	<input type="radio" name="member_gender" value="man">man
	<input type="radio" name="member_gender" value="woman">woman<hr>
	국적
	<select name="member_nationality">
		<option>선택</option>
		<option value="대한민국">대한민국</option>
		<option value="미국">미국</option>
		<option value="영국">영국</option>
		<option value="프랑스">프랑스</option>
		<option value="이탈리아">이탈리아</option>
		<option value="체코">체코</option>
		<option value="캐나다">캐나다</option>
		<option value="중국">중국</option>
		<option value="일본">일본</option>
	</select><hr>
	구사언어
	<input type="checkbox" name="member_language" value="한국어">한국어
	<input type="checkbox" name="member_language" value="영어">영어
	<input type="checkbox" name="member_language" value="중국어">중국어
	<input type="checkbox" name="member_language" value="일본어">일본어
	<hr>
	자격증
	<input type="text" name="member_certification" placeholder="자격증이 없다면 '없음'을 입력하세요"><hr>
	전화번호
	<input type="text" name="member_tel" placeholder="'-' 없이 입력해주세요"><hr>
	이메일
	<input type="text" name="member_email"><hr>
	우편번호
	<input type="text" name="member_post" readonly="readonly" placeholder="검색버튼을 눌러주세요" class="postcodify_postcode5 form-control" />
	<p id="postcodify_search_button">검색</p>
	주소
	<input type="text" name="member_addrDetail" readonly="readonly" class="postcodify_address form-control" placeholder="검색버튼을 눌러주세요" />
	상세주소
	<input type="text" name="member_adrr"><hr>						
	<input type="hidden" name="member_isGuide" value="0">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	<input type="submit" value="확인">
	</form>
	<!-- 주소 "검색"창  -->
	<script>
		$(function() { $("#postcodify_search_button").postcodifyPopUp(); });
	</script>
	
	<!-- jQuery와 Postcodify를 로딩한다 -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
</body>
</html>