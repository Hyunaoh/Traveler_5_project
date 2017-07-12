<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>여행가 - 단체상품 등록</title>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("[name=group_pak_min]").change(function(){
				if($("[name=group_pak_min]").val() > $("[name=group_pak_max]").val()){
					$("#result_text").html("<font color='red'>"
							+ "최대인원이 최소인원보다 크거나 같아야 합니다."
							+ "</font>");
				}else{
					$("#result_text").html("");
				}
			});
			$("[name=group_pak_max]").change(function(){
				if($("[name=group_pak_min]").val() > $("[name=group_pak_max]").val()){
					$("#result_text").html("<font color='red'>"
							+ "최대인원이 최소인원보다 크거나 같아야 합니다."
							+ "</font>");
				}else{
					$("#result_text").html("");
				}
			});
			
			// 초기 설정
			$("#area").hide();
			$("#area_text1").hide();
			$("#area_text2").hide();
			$("#detail_info").hide();
			
			// 국가/지역 설정
			$("#country").change(function(){
				$("#area").show();
				$("#area_text1").show();
				if($("#country").val() == "대한민국"){
					$("#area").html("<option value='없음'>선택</option><option value='서울'>서울</option><option value='부산'>부산</option><option value='제주'>제주</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "미국"){
					$("#area").html("<option value='없음'>선택</option><option value='워싱턴 D.C.'>워싱턴 D.C.</option><option value='뉴욕'>뉴욕</option><option value='로스엔젤레스'>로스엔젤레스</option><option value='샌프란시스코'>샌프란시스코</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "영국"){
					$("#area").html("<option value='없음'>선택</option><option value='런던'>런던</option><option value='맨체스터'>맨체스터</option><option value='옥스퍼드'>옥스퍼드</option><option value='노팅엄'>노팅엄</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "프랑스"){
					$("#area").html("<option value='없음'>선택</option><option value='파리'>파리</option><option value='마르세유'>마르세유</option><option value='아비뇽'>아비뇽</option><option value='베르사유'>베르사유</option><option value='아를'>아를</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "이탈리아"){
					$("#area").html("<option value='없음'>선택</option><option value='피렌체'>피렌체</option><option value='밀라노'>밀라노</option><option value='제노바'>제노바</option><option value='피사'>피사</option><option value='시에나'>시에나</option><option value='아말피'>아말피</option><option value='소렌토'>소렌토</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "체코"){
					$("#area").html("<option value='없음'>선택</option><option value='프라하'>프라하</option><option value='브르노'>브르노</option><option value='카를로비바리'>카를로비바리</option><option value='쿠트나호라'>쿠트나호라</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "캐나다"){
					$("#area").html("<option value='없음'>선택</option><option value='몬트리올'>몬트리올</option><option value='캘거리'>캘거리</option><option value='에드먼턴'>에드먼턴</option><option value='킹스턴'>킹스턴</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "중국"){
					$("#area").html("<option value='없음'>선택</option><option value='상하이'>상하이</option><option value='베이징'>베이징</option><option value='텐진'>텐진</option><option value='광저우'>광저우</option><option value='칭다오'>칭다오</option><option value='기타'>기타</option>");
				} else if ($("#country").val() == "일본"){
					$("#area").html("<option value='없음'>선택</option><option value='도쿄'>도쿄</option><option value='교토'>교토</option><option value='오사카'>오사카</option><option value='삿포로'>삿포로</option><option value='고베'>고베</option><option value='기타'>기타</option>");
				} else{
					$("#area").hide();
					$("#area_text1").hide();
					$("#area_text2").hide();
					$("#area").html("<option value='없음'>없음</optoin>");
				}
			});
			$("#area").change(function(){
				if($("#area").val() == '없음'){
					$("#area_text2").hide();
					$("#detail_info").hide();
				} else{
					$("#area_text2").show();
					$("#detail_info").show();
				}
			});
		});
	</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp" />
	<br><br><br><br><br><br>
	<!-- content -->
	<form action="groupInsertPro.go" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="group_pak_title" class="form-control"/><br>
		내용 : <textarea name="group_pak_content" class="form-control"></textarea><br>
		사진 : <input type="file" name="imgFile" class="form-control"/><br>
		나라 :
			<select name="group_pak_place1" id="country" class="form-control">
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
			</select>
		<label id="area_text1"> 도시</label>
			<select name="group_pak_place2" id="area" class="form-control">
			</select><br>
		<label id="area_text2">상세장소<br></label>
			<textarea name="group_pak_place3" id="detail_info" rows="5" cols="30"
				class="form-control" placeholder="가고 싶은 장소 등 상세정보를 입력해주세요"></textarea><br>
		가격(인당) : <input type="number" name="group_pak_cost" class="form-control"/> 명<br>
		최소 인원 : <input type="number" min="1" value="1" name="group_pak_min" class="form-control"/><br>
		최대 인원 : <input type="number" min="1" value="1" name="group_pak_max" class="form-control"/><br>
		<div id="result_text"></div>
		<input type="hidden" name="group_pak_status" value="0" class="form-control"/><br>
		<input type="hidden" name="group_pak_flag1" value="0" class="form-control"/><br>
		<input type="hidden" name="group_pak_flag2" value="0" class="form-control"/><br>
		<input type="submit" value="등록" class="btn btn-default btn-md"/>
	</form>
</body>
</html>