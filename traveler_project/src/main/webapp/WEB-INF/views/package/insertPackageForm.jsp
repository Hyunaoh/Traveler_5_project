<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><html>
<head>
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- 유효성 검사 -->
<script type="text/javascript">
	function checkNull(){
		
		
	}


</script>


<script>

	$(function() {
		$("#place2").hide();
		$("#place1").change(function() {
			$("#place2").show();
			tform = document.insertForm;
			if (tform.package_place1.value == '대한민국') {
				tform.package_place2.length = 4;
				tform.package_place2.options[0].text = '서울';
				tform.package_place2.options[0].value = '서울';
				tform.package_place2.options[1].text = '부산';
				tform.package_place2.options[1].value = '부산';
				tform.package_place2.options[2].text = '제주';
				tform.package_place2.options[2].value = '제주';
				tform.package_place2.options[3].text = '기타';
				tform.package_place2.options[3].value = '기타';
			} else if (tform.package_place1.value == '미국') {
				tform.package_place2.length = 5;
				tform.package_place2.options[0].text = '워싱턴 D.C.';
				tform.package_place2.options[0].value = '워싱턴 D.C.';
				tform.package_place2.options[1].text = '뉴욕';
				tform.package_place2.options[1].value = '뉴욕';
				tform.package_place2.options[2].text = '로스앤젤레스';
				tform.package_place2.options[2].value = '로스앤젤레스';
				tform.package_place2.options[3].text = '샌프란시스코';
				tform.package_place2.options[3].value = '샌프란시스코';
				tform.package_place2.options[4].text = '기타';
				tform.package_place2.options[4].value = '기타';
			} else if (tform.package_place1.value == '영국') {
				tform.package_place2.length = 6;
				tform.package_place2.options[0].text = '런던';
				tform.package_place2.options[0].value = '런던';
				tform.package_place2.options[1].text = '뉴욕';
				tform.package_place2.options[1].value = '뉴욕';
				tform.package_place2.options[2].text = '맨체스터';
				tform.package_place2.options[2].value = '맨체스터';
				tform.package_place2.options[3].text = '옥스퍼드';
				tform.package_place2.options[3].value = '옥스퍼드';
				tform.package_place2.options[4].text = '노팅엄';
				tform.package_place2.options[4].value = '노팅엄';
				tform.package_place2.options[5].text = '기타';
				tform.package_place2.options[5].value = '기타';
			} else if (tform.package_place1.value == '프랑스') {
				tform.package_place2.length = 6;
				tform.package_place2.options[0].text = '파리';
				tform.package_place2.options[0].value = '파리';
				tform.package_place2.options[1].text = '마르세유';
				tform.package_place2.options[1].value = '마르세유';
				tform.package_place2.options[2].text = '아비뇽';
				tform.package_place2.options[2].value = '아비뇽';
				tform.package_place2.options[3].text = '베르사유';
				tform.package_place2.options[3].value = '베르사유';
				tform.package_place2.options[4].text = '아를';
				tform.package_place2.options[4].value = '아를';
				tform.package_place2.options[5].text = '기타';
				tform.package_place2.options[5].value = '기타';
			} else if (tform.package_place1.value == '이탈리아') {
				tform.package_place2.length = 8;
				tform.package_place2.options[0].text = '피렌체';
				tform.package_place2.options[0].value = '피렌체';
				tform.package_place2.options[1].text = '밀라노';
				tform.package_place2.options[1].value = '밀라노';
				tform.package_place2.options[2].text = '제노바';
				tform.package_place2.options[2].value = '제노바';
				tform.package_place2.options[3].text = '피사';
				tform.package_place2.options[3].value = '피사';
				tform.package_place2.options[4].text = '시에나';
				tform.package_place2.options[4].value = '시에나';
				tform.package_place2.options[5].text = '아말피';
				tform.package_place2.options[5].value = '아말피';
				tform.package_place2.options[6].text = '소렌토';
				tform.package_place2.options[6].value = '소렌토';
				tform.package_place2.options[7].text = '기타';
				tform.package_place2.options[7].value = '기타';
			} else if (tform.package_place1.value == '체코') {
				tform.package_place2.length = 5;
				tform.package_place2.options[0].text = '프라하';
				tform.package_place2.options[0].value = '프라하';
				tform.package_place2.options[1].text = '브르노';
				tform.package_place2.options[1].value = '브르노';
				tform.package_place2.options[2].text = '카를로비바리';
				tform.package_place2.options[2].value = '카를로비바리';
				tform.package_place2.options[3].text = '쿠트나호라';
				tform.package_place2.options[3].value = '쿠트나호라';
				tform.package_place2.options[4].text = '기타';
				tform.package_place2.options[4].value = '기타';
			} else if (tform.package_place1.value == '캐나다') {
				tform.package_place2.length = 5;
				tform.package_place2.options[0].text = '몬트리올';
				tform.package_place2.options[0].value = '몬트리올';
				tform.package_place2.options[1].text = '캘거리';
				tform.package_place2.options[1].value = '캘거리';
				tform.package_place2.options[2].text = '에드먼턴';
				tform.package_place2.options[2].value = '에드먼턴';
				tform.package_place2.options[3].text = '킹스턴';
				tform.package_place2.options[3].value = '킹스턴';
				tform.package_place2.options[4].text = '기타';
				tform.package_place2.options[4].value = '기타';
			} else if (tform.package_place1.value == '중국') {
				tform.package_place2.length = 6;
				tform.package_place2.options[0].text = '상하이';
				tform.package_place2.options[0].value = '상하이';
				tform.package_place2.options[1].text = '베이징';
				tform.package_place2.options[1].value = '베이징';
				tform.package_place2.options[2].text = '텐진';
				tform.package_place2.options[2].value = '텐진';
				tform.package_place2.options[3].text = '광저우';
				tform.package_place2.options[3].value = '광저우';
				tform.package_place2.options[4].text = '칭다오';
				tform.package_place2.options[4].value = '칭다오';
				tform.package_place2.options[5].text = '기타';
				tform.package_place2.options[5].value = '기타';
			} else if (tform.package_place1.value == '일본') {
				tform.package_place2.length = 6;
				tform.package_place2.options[0].text = '도쿄';
				tform.package_place2.options[0].value = '도쿄';
				tform.package_place2.options[1].text = '교토';
				tform.package_place2.options[1].value = '교토';
				tform.package_place2.options[2].text = '오사카';
				tform.package_place2.options[2].value = '오사카';
				tform.package_place2.options[3].text = '삿포로';
				tform.package_place2.options[3].value = '삿포로';
				tform.package_place2.options[4].text = '고베';
				tform.package_place2.options[4].value = '고베';
				tform.package_place2.options[5].text = '기타';
				tform.package_place2.options[5].value = '기타';
			}
		});
	});
</script>

<script type="text/javascript">
	function add_tag(){
		
		
	}

</script>

</head>
<body>
	<!-- <h4>상품 등록하기</h4>
	<form name="insertForm" action="insertPackagePro.go" method="post" enctype="multipart/form-data"> -->
		<input type="text" name="package_title" placeholder="제목을 입력해주세요" required="required">
		<select name="package_place1" id="place1" required="required" >
			<option>나라 선택</option>
			<option value="대한민국">대한민국</option>
			<option value="미국">미국</option>
			<option value="영국">영국</option>
			<option value="프랑스">프랑스</option>
			<option value="이탈리아">이탈리아</option>
			<option value="체코">체코</option>
			<option value="캐나다">캐나다</option>
			<option value="중국">중국</option>
			<option value="일본">일본</option>
		</select>
		
		<select name="package_place2"  id="place2" required="required">
		</select>
		
		<p id="area_text2">상세사항 : </p>
		<textarea name="package_place3" id="detail_info" rows="5" cols="50" class="form-control" required="required"></textarea><br>
		<br>
		
		<form action="testHashTag.go" method="get">
			<p id="area_text3">해시태그 : </p>
			<input type="text" id="package_tag" name="package_tag" placeholder="#기호로 구분해 입력해주세요">
			<br><font size="1px" color="grey">예> #로맨틱 #성공적 #올빼미여행 </font>
			<input type="submit">
		</form>
		
		<textarea name="package_content" rows="5" cols="50" placeholder="내용을 입력해주세요" required="required"></textarea><br>
		<input type="number" name="package_leadTime" placeholder="소요시간을 입력해주세요" required="required">
		<input type ="file" name="imgFile" required="required">
		
		<input type="hidden" name="member_id"  value="test">
		
		
		<input type = "submit" value="등록" >
	
	<!-- </form> -->

</body>
</html>